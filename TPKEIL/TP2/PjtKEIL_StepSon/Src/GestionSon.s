	PRESERVE8
	THUMB   
		
	include DriverJeuLaser.inc
; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly



;Section RAM (read write):
	area    maram,data,readwrite
	import Son
	export CallbackSon

Index dcd 0x0
SortieSon dcd 0x0
	export SortieSon
; ===============================================================================================
	

;Section ROM code (read only) :		
	area    moncode,code,readonly
	
; écrire le code ici	

; R4 sera échantillon

;echantillon = Son[index]
;echantillon = echantillon + 32 768
;echantillon = (echantillon*719)/65536 // >>16
;SortieSon = echantillon
;index++



CallbackSon proc

;si index < 5512
	push{r4, r5, r6}
	
	ldr r1,=Index     ;r2 = &Index
	ldr r2, [r1]    ;r1 = valeur pointée par r2
	mov r3, #5512     ;r3 = 5512
	CMP r2, r3        ;if r2 != r3
	BNE fction
	bx lr
	
	
fction
;echantillon = Son[index]

	ldr r1,=Son
	ldrsh r4 ,[R1, r2, lsl #1]     ;r4 = *(r1+r2*2)
;echantillon = echantillon + 32 768
	add r4, #32768
;echantillon = (echantillon*719)/65536 // >>16
	mov r3, #719
	mul r4, r3
	lsr r4, #16
;SortieSon = echantillon

	ldr r5,=SortieSon
	str r4, [r5]     ;*r5 = r4

;index++
	add r2, #1

	ldr r6,=Index
	str r2, [r6]     ;*r5 = r4
	pop {r4, r5, r6}

	bx lr
	endp
				
	END	