
; ASM FILE data\maps\entries\map13\mapsetups\s3.asm :
; 0x5822A..0x582AC : 
ms_map13_ZoneEvents:
		msZoneEvent 24, NO_DIRECTION, Map13_ZoneEvent0-ms_map13_ZoneEvents
		msZoneEvent 255, 11, Map13_ZoneEvent1-ms_map13_ZoneEvents
		msZoneEvent 255, 30, Map13_ZoneEvent2-ms_map13_ZoneEvents
		msDefaultZoneEvent 0, return_582AA-ms_map13_ZoneEvents

; =============== S U B R O U T I N E =======================================

Map13_ZoneEvent0:
		
		 
		chkFlg  $2C6            ; set after Oddler wanders down from the mountain
		bne.s   byte_58264      
		script  cs_58330
		chkFlg  $2C7            ; set after you dislodge the turtle/fairy in Polca
		bne.s   loc_58254
		script  cs_58310
		bra.s   byte_5825E      
loc_58254:
		move.w  #$82,d0 
		jsr     MoveEntityOutOfMap
byte_5825E:
		setFlg  $2C6            ; set after Oddler wanders down from the mountain
		bra.s   return_5827A
byte_58264:
		chkFlg  $31F            ; set after you agree to kill Zeon in Bedoe (King's yes/no dialog)
		beq.s   return_5827A
		chkFlg  $2CB            ; set after returning to Polca from Bedoe and seeing the devils vs. birds scene
		bne.s   return_5827A
		script  cs_585FE
		setFlg  $2CB            ; set after returning to Polca from Bedoe and seeing the devils vs. birds scene
return_5827A:
		rts

	; End of function Map13_ZoneEvent0


; =============== S U B R O U T I N E =======================================

Map13_ZoneEvent1:
		
		 
		chkFlg  $2CC            ; set after your raft-giving conversation with the mayor in Polca
		beq.s   return_58292
		chkFlg  $2CD            ; set after the mayor first tries to have you take Oddler with you (Peter declines)
		bne.s   return_58292
		script  cs_58AE2
		setFlg  $2CD            ; set after the mayor first tries to have you take Oddler with you (Peter declines)
return_58292:
		rts

	; End of function Map13_ZoneEvent1


; =============== S U B R O U T I N E =======================================

Map13_ZoneEvent2:
		
		 
		chkFlg  $2CC            ; set after your raft-giving conversation with the mayor in Polca
		beq.s   return_582AA
		chkFlg  $2CE            ; set after Oddler runs after you as you leave Polca, and tags along
		bne.s   return_582AA
		script  cs_58BEA
		setFlg  $2CE            ; set after Oddler runs after you as you leave Polca, and tags along
return_582AA:
		rts

	; End of function Map13_ZoneEvent2

