
; ASM FILE data\maps\entries\map63\mapsetups\s6_initfunction.asm :
; 0x5CA50..0x5CA6E : 

; =============== S U B R O U T I N E =======================================

ms_map63_InitFunction:
                
                 
                chkFlg  $1D             ; Claude joined
                bne.s   return_5CA5C
                script  cs_5CA5E
return_5CA5C:
                
                rts

	; End of function ms_map63_InitFunction

cs_5CA5E:       setSprite $1D,$B0
                setFacing $1D,DOWN
                stopEntity $1D
                csc_end
