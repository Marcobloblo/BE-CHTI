

#include "DriverJeuLaser.h"

extern short int LeSignal[];
extern int DFTModuleAuCarre( short int * Signal64ech, char k);
int tab[64];
	
int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

// Apr�s ex�cution : le coeur CPU est clock� � 72MHz ainsi que tous les timers
CLOCK_Configure();


	
	

//============================================================================	
for(int i=0; i < 64; i++)
		{
			tab[i] = DFTModuleAuCarre(&LeSignal[0], i);
		}	
	
while	(1)
	{

	}
	
}

