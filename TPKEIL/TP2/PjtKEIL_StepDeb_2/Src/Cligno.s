	PRESERVE8
	THUMB   
		

; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite
Flag dcb 0x0		

	
; ===============================================================================================
	
	include DriverJeuLaser.inc
	export TimeCallback	
	export Flag
		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici		




TimeCallback proc

	ldr r4, =Flag
	ldrb r2, [r4]
	mov r0, #1
	CMP r2, #1
	BEQ oui
	push {lr}
	bl GPIOB_Set
	mov r2, #1
	str r2, [r4]
	pop{pc}

oui
	push {lr}
	bl GPIOB_Clear
	mov r2, #0
	str r2,[r4]
	pop {pc}
	
	endp
	
	END	