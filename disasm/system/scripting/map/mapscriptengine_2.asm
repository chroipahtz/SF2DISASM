
; SCRIPT SECTION system\scripting\map\mapscriptengine_2 :
; Mapscript engine, part 2

; =============== S U B R O U T I N E =======================================

; In: A0 = script address

ExecuteMapScript:
										
										move.l  #byte_FF9004,(dword_FFB1A4).l
										movem.l d0-a6,-(sp)
										movea.l a0,a6
										clr.b   ((AVOID_CUTSCENE_DIALOGS-$1000000)).w
loc_47140:
										
										btst    #INPUT_A_START_BIT,((P2_INPUT-$1000000)).w
																						; if P2 START and DEBUG MODE, DEACTIVATE DIALOGS
										beq.s   loc_47156
										tst.b   (DEBUG_MODE_ACTIVATED).l
										beq.s   loc_47156
										move.b  #$FF,((AVOID_CUTSCENE_DIALOGS-$1000000)).w
loc_47156:
										
										move.w  (a6)+,d0
										cmpi.w  #$FFFF,d0
										beq.w   loc_47234
										tst.w   d0
										bpl.s   loc_47174
										tst.b   ((AVOID_CUTSCENE_DIALOGS-$1000000)).w
										bne.s   loc_47172       ; if cmd > $8000 and dialogs activated, SLEEP CMD
										andi.w  #$FF,d0
										jsr     (Sleep).w       
loc_47172:
										
										bra.s   loc_47140       
loc_47174:
										
										add.w   d0,d0
										move.w  rjt_cutsceneScriptCommands(pc,d0.w),d0
										jsr     rjt_cutsceneScriptCommands(pc,d0.w)
										bra.s   loc_47140       
rjt_cutsceneScriptCommands:
										
										dc.w csc00_displaySingleTextbox-rjt_cutsceneScriptCommands
																						; csc for Cutscene Script Command
										dc.w csc01_displaySingleTextboxWithVars-rjt_cutsceneScriptCommands
										dc.w csc02_displayTextbox-rjt_cutsceneScriptCommands
										dc.w csc03_displayTextboxWithVars-rjt_cutsceneScriptCommands
										dc.w csc04_setTextIndex-rjt_cutsceneScriptCommands
										dc.w csc05_playSound-rjt_cutsceneScriptCommands
										dc.w csc06_doNothing-rjt_cutsceneScriptCommands
										dc.w csc07_executeMapSystemEvent-rjt_cutsceneScriptCommands
										dc.w csc08_joinForce-rjt_cutsceneScriptCommands
										dc.w csc09_hideTextBoxAndPortrait-rjt_cutsceneScriptCommands
										dc.w csc0A_executeSubroutine-rjt_cutsceneScriptCommands
																						; execute subroutine xxxxxxxx
										dc.w csc0B_jump-rjt_cutsceneScriptCommands
										dc.w csc0C_jumpIfFlagSet-rjt_cutsceneScriptCommands
										dc.w csc0D_jumpIfFlagClear-rjt_cutsceneScriptCommands
										dc.w csc0E_jumpIfForceMemberInList-rjt_cutsceneScriptCommands
										dc.w csc0F_jumpIfCharacterAlive-rjt_cutsceneScriptCommands
										dc.w csc10_setOrClearFlag-rjt_cutsceneScriptCommands
										dc.w csc11_promptYesNoForStoryFlow-rjt_cutsceneScriptCommands
										dc.w csc12_executeContextMenu-rjt_cutsceneScriptCommands
										dc.w csc13_setStoryFlag-rjt_cutsceneScriptCommands
										dc.w csc14_setEntityActscriptManual+$10000-rjt_cutsceneScriptCommands
										dc.w csc15_setEntityActscript+$10000-rjt_cutsceneScriptCommands
										dc.w csc16_waitUntilEntityIdle+$10000-rjt_cutsceneScriptCommands
										dc.w csc17_setEntityPosAndFacingWithFlash+$10000-rjt_cutsceneScriptCommands
										dc.w csc18_flashEntityWhite+$10000-rjt_cutsceneScriptCommands
										dc.w csc19_setEntityPosAndFacing+$10000-rjt_cutsceneScriptCommands
										dc.w csc1A_setEntitySprite+$10000-rjt_cutsceneScriptCommands
										dc.w csc1B_startEntityAnim+$10000-rjt_cutsceneScriptCommands
										dc.w csc1C_stopEntityAnim+$10000-rjt_cutsceneScriptCommands
										dc.w csc1D_showPortrait+$10000-rjt_cutsceneScriptCommands
										dc.w csc1E_hidePortrait+$10000-rjt_cutsceneScriptCommands
										dc.w csc1F_declareForceMemberDead+$10000-rjt_cutsceneScriptCommands
										dc.w csc20_addForceMembersOnMapToList+$10000-rjt_cutsceneScriptCommands
										dc.w csc21_removeForceMemberFromList+$10000-rjt_cutsceneScriptCommands
										dc.w csc22_animateEntityFadeInOrOut+$10000-rjt_cutsceneScriptCommands
										dc.w csc23_setEntityFacing+$10000-rjt_cutsceneScriptCommands
										dc.w csc24_setCameraTargetEntity+$10000-rjt_cutsceneScriptCommands
										dc.w csc25_cloneEntity+$10000-rjt_cutsceneScriptCommands
										dc.w csc26_entityNodHead+$10000-rjt_cutsceneScriptCommands
										dc.w csc27_entityShakeHead+$10000-rjt_cutsceneScriptCommands
										dc.w csc28_moveEntityNextToPlayer+$10000-rjt_cutsceneScriptCommands
										dc.w csc29_setEntityDest+$10000-rjt_cutsceneScriptCommands
										dc.w csc2A_entityShiver+$10000-rjt_cutsceneScriptCommands
										dc.w csc2B_+$10000-rjt_cutsceneScriptCommands
										dc.w csc2C_followEntity+$10000-rjt_cutsceneScriptCommands
										dc.w csc2D_moveEntity+$10000-rjt_cutsceneScriptCommands
										dc.w csc2E_hideEntity+$10000-rjt_cutsceneScriptCommands
										dc.w csc2F_+$10000-rjt_cutsceneScriptCommands
										dc.w csc30_removeEntityShadow+$10000-rjt_cutsceneScriptCommands
										dc.w csc31_moveEntityAboveEntity+$10000-rjt_cutsceneScriptCommands
										dc.w csc32_setCameraDestInTiles+$10000-rjt_cutsceneScriptCommands
										dc.w csc33_setQuakeAmount+$10000-rjt_cutsceneScriptCommands
										dc.w csc34_setBlocks+$10000-rjt_cutsceneScriptCommands
										dc.w csc35_+$10000-rjt_cutsceneScriptCommands
										dc.w csc36_+$10000-rjt_cutsceneScriptCommands
										dc.w csc37_loadMapAndFadeIn+$10000-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
										dc.w csc39_fadeInFromBlack+$10000-rjt_cutsceneScriptCommands
										dc.w csc3A_fadeOutToBlack+$10000-rjt_cutsceneScriptCommands
										dc.w csc3B_slowFadeInFromBlack+$10000-rjt_cutsceneScriptCommands
										dc.w csc3C_slowFadeOutToBlack+$10000-rjt_cutsceneScriptCommands
										dc.w csc3D_tintMap+$10000-rjt_cutsceneScriptCommands
										dc.w csc3E_FlickerOnce+$10000-rjt_cutsceneScriptCommands
										dc.w csc3F_fadeMapOutToWhite+$10000-rjt_cutsceneScriptCommands
										dc.w csc40_fadeMapInFromWhite+$10000-rjt_cutsceneScriptCommands
										dc.w csc41_flashScreenWhite+$10000-rjt_cutsceneScriptCommands
										dc.w csc42_+$10000-rjt_cutsceneScriptCommands
										dc.w csc43_+$10000-rjt_cutsceneScriptCommands
										dc.w csc44_+$10000-rjt_cutsceneScriptCommands
										dc.w csc45_+$10000-rjt_cutsceneScriptCommands
										dc.w csc46_+$10000-rjt_cutsceneScriptCommands
										dc.w csc47_+$10000-rjt_cutsceneScriptCommands
										dc.w csc48_loadMap+$10000-rjt_cutsceneScriptCommands
										dc.w csc49_+$10000-rjt_cutsceneScriptCommands
										dc.w csc4A_fadeInFromBlackHalf+$10000-rjt_cutsceneScriptCommands
										dc.w csc4B_fadeOutToBlackHalf+$10000-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
										dc.w csc50_setEntitySize+$10000-rjt_cutsceneScriptCommands
										dc.w csc51_+$10000-rjt_cutsceneScriptCommands
										dc.w csc52_+$10000-rjt_cutsceneScriptCommands
										dc.w csc53_+$10000-rjt_cutsceneScriptCommands
										dc.w csc54_+$10000-rjt_cutsceneScriptCommands
										dc.w csc55_resetCharacterBattleStats+$10000-rjt_cutsceneScriptCommands
										dc.w csc56_+$10000-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
										dc.w csc_doNothing-rjt_cutsceneScriptCommands
loc_47234:
										
										tst.w   ((TEXT_WINDOW_INDEX-$1000000)).w
										beq.s   loc_4723E
										jsr     (WaitForCameraToCatchUp).w
loc_4723E:
										
										clr.w   ((word_FFB194-$1000000)).w
										movem.l (sp)+,d0-a6
										rts

	; End of function ExecuteMapScript


; =============== S U B R O U T I N E =======================================

csc_doNothing:
										
										rts

	; End of function csc_doNothing


; =============== S U B R O U T I N E =======================================

csc00_displaySingleTextbox:
										
										tst.b   ((AVOID_CUTSCENE_DIALOGS-$1000000)).w
										bne.s   loc_47298
										cmpi.w  #$FFFF,(a6)
										beq.s   loc_4726A
										move.l  a6,-(sp)
										bsr.w   csc1D_showPortrait
										movea.l (sp)+,a6
										move.w  (a6),d0
										bsr.w   GetEntityPortraitAndSpeechSfx
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										bra.s   loc_47270
loc_4726A:
										
										move.w  #0,((CURRENT_SPEAK_SOUND-$1000000)).w
loc_47270:
										
										adda.w  #2,a6
										move.w  ((CUTSCENE_DIALOG_INDEX-$1000000)).w,d0
										jsr     (WaitForCameraToCatchUp).w
										jsr     (DisplayText).l 
										addq.w  #1,((CUTSCENE_DIALOG_INDEX-$1000000)).w
																						; increment script number (move forward in script bank)
										jsr     j_HidePortraitWindow
										trap    #TEXTBOX
										dc.w $FFFF
										moveq   #$A,d0
										jsr     (Sleep).w       
										bra.s   return_4729C
loc_47298:
										
										adda.w  #2,a6
return_4729C:
										
										rts

	; End of function csc00_displaySingleTextbox


; =============== S U B R O U T I N E =======================================

csc01_displaySingleTextboxWithVars:
										
										cmpi.w  #$FFFF,(a6)
										beq.s   loc_472B8
										move.l  a6,-(sp)
										bsr.w   csc1D_showPortrait
										movea.l (sp)+,a6
										move.w  (a6),d0
										bsr.w   GetEntityPortraitAndSpeechSfx
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										bra.s   loc_472BE
loc_472B8:
										
										move.w  #0,((CURRENT_SPEAK_SOUND-$1000000)).w
loc_472BE:
										
										adda.w  #2,a6
										move.w  (a6)+,((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  (a6)+,((TEXT_NAME_INDEX_2-$1000000)).w
										move.w  ((CUTSCENE_DIALOG_INDEX-$1000000)).w,d0
										jsr     (WaitForCameraToCatchUp).w
										jsr     (DisplayText).l 
										addq.w  #1,((CUTSCENE_DIALOG_INDEX-$1000000)).w
										jsr     j_HidePortraitWindow
										trap    #TEXTBOX
										dc.w $FFFF
										moveq   #$A,d0
										jsr     (Sleep).w       
										rts

	; End of function csc01_displaySingleTextboxWithVars


; =============== S U B R O U T I N E =======================================

csc02_displayTextbox:
										
										tst.b   ((AVOID_CUTSCENE_DIALOGS-$1000000)).w
										bne.s   loc_4732C
										cmpi.w  #$FFFF,(a6)
										beq.s   loc_4730E
										move.l  a6,-(sp)
										bsr.w   csc1D_showPortrait
										movea.l (sp)+,a6
										move.w  (a6),d0
										bsr.w   GetEntityPortraitAndSpeechSfx
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										bra.s   loc_47314
loc_4730E:
										
										move.w  #0,((CURRENT_SPEAK_SOUND-$1000000)).w
loc_47314:
										
										adda.w  #2,a6
										move.w  ((CUTSCENE_DIALOG_INDEX-$1000000)).w,d0
										jsr     (WaitForCameraToCatchUp).w
										jsr     (DisplayText).l 
										addq.w  #1,((CUTSCENE_DIALOG_INDEX-$1000000)).w
										bra.s   return_47330
loc_4732C:
										
										adda.w  #2,a6
return_47330:
										
										rts

	; End of function csc02_displayTextbox


; =============== S U B R O U T I N E =======================================

csc03_displayTextboxWithVars:
										
										cmpi.w  #$FFFF,(a6)
										beq.s   loc_4734C
										move.l  a6,-(sp)
										bsr.w   csc1D_showPortrait
										movea.l (sp)+,a6
										move.w  (a6),d0
										bsr.w   GetEntityPortraitAndSpeechSfx
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										bra.s   loc_47352
loc_4734C:
										
										move.w  #0,((CURRENT_SPEAK_SOUND-$1000000)).w
loc_47352:
										
										adda.w  #2,a6
										move.w  (a6)+,((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  (a6)+,((TEXT_NAME_INDEX_2-$1000000)).w
										move.w  ((CUTSCENE_DIALOG_INDEX-$1000000)).w,d0
										jsr     (WaitForCameraToCatchUp).w
										jsr     (DisplayText).l 
										addq.w  #1,((CUTSCENE_DIALOG_INDEX-$1000000)).w
										rts

	; End of function csc03_displayTextboxWithVars


; =============== S U B R O U T I N E =======================================

; set cutscene dialogue index

csc04_setTextIndex:
										
										move.w  (a6)+,((CUTSCENE_DIALOG_INDEX-$1000000)).w
										rts

	; End of function csc04_setTextIndex


; =============== S U B R O U T I N E =======================================

; play sound of index 00xx

csc05_playSound:
										
										move.w  (a6)+,d0
										trap    #SOUND_COMMAND
										dc.w SOUND_COMMAND_GET_D0_PARAMETER
										rts

	; End of function csc05_playSound


; =============== S U B R O U T I N E =======================================

csc06_doNothing:
										
										rts

	; End of function csc06_doNothing


; =============== S U B R O U T I N E =======================================

csc07_executeMapSystemEvent:
										
										lea     ((MAP_EVENT_TYPE-$1000000)).w,a0
										move.w  #1,(a0)+
										move.b  #0,(a0)+
										move.b  (a6)+,(a0)+
										move.b  (a6)+,(a0)+
										move.b  (a6)+,(a0)+
										move.b  (a6)+,(a0)+
										rts

	; End of function csc07_executeMapSystemEvent


; =============== S U B R O U T I N E =======================================

; make 00xx character join force with bit F set for sad join music

csc08_joinForce:
										
										move.w  #0,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     (WaitForCameraToCatchUp).w
										move.w  (a6)+,d0
										bclr    #$F,d0
										bne.s   loc_473B0
										trap    #SOUND_COMMAND
										dc.w MUSIC_JOIN         ; join music
										bra.s   loc_473B4       
loc_473B0:
										
										trap    #SOUND_COMMAND
										dc.w MUSIC_SAD_JOIN     ; sad join music
loc_473B4:
										
										cmpi.w  #$80,d0 ; HARDCODED use case
										bne.s   loc_473D4
										move.w  #1,d0           ; make sarah and chester join at the same time
										jsr     j_JoinForce
										move.w  #2,d0
										jsr     j_JoinForce
										trap    #TEXTBOX
										dc.w $1BF               ; "{NAME;1} the PRST and{N}{NAME;2} the KNTE{N}have joined the force."
										bra.s   loc_473EC
loc_473D4:
										
										jsr     j_JoinForce
										jsr     j_GetClass      
										move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
										move.w  d1,((TEXT_NAME_INDEX_2-$1000000)).w
										trap    #TEXTBOX
										dc.w $1BE               ; "{NAME} the {CLASS} {N}has joined the force."
loc_473EC:
										
										jsr     j_FadeOut_WaitForP2Input
										trap    #TEXTBOX
										dc.w $FFFF
										moveq   #$A,d0
										jsr     (Sleep).w       
										rts

	; End of function csc08_joinForce


; =============== S U B R O U T I N E =======================================

; related to portrait window

csc09_hideTextBoxAndPortrait:
										
										jsr     j_HidePortraitWindow
										trap    #TEXTBOX
										dc.w $FFFF
										rts

	; End of function csc09_hideTextBoxAndPortrait


; =============== S U B R O U T I N E =======================================

csc0A_executeSubroutine:
										
										movea.l (a6)+,a1
										move.l  a0,-(sp)
										jsr     (a1)
										movea.l (sp)+,a0
										rts

	; End of function csc0A_executeSubroutine


; =============== S U B R O U T I N E =======================================

csc0B_jump:
										
										movea.l (a6),a6
										rts

	; End of function csc0B_jump


; =============== S U B R O U T I N E =======================================

; xxxx yyyyyyyy

csc0C_jumpIfFlagSet:
										
										move.w  (a6)+,d1
										jsr     j_CheckFlag
										beq.w   loc_47428
										movea.l (a6),a6
										bra.s   return_4742A
loc_47428:
										
										addq.w  #4,a6
return_4742A:
										
										rts

	; End of function csc0C_jumpIfFlagSet


; =============== S U B R O U T I N E =======================================

; xxxx yyyyyyyy

csc0D_jumpIfFlagClear:
										
										move.w  (a6)+,d1
										jsr     j_CheckFlag
										bne.w   loc_4743C
										movea.l (a6),a6
										bra.s   return_4743E
loc_4743C:
										
										addq.w  #4,a6
return_4743E:
										
										rts

	; End of function csc0D_jumpIfFlagClear


; =============== S U B R O U T I N E =======================================

; branch if something

csc0E_jumpIfForceMemberInList:
										
										move.w  (a6)+,d0
										lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a1
										move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
										subq.w  #1,d7
										bcs.w   return_47462
loc_47450:
										
										cmp.b   (a1)+,d0
										beq.w   loc_47460
										dbf     d7,loc_47450
										addq.w  #4,a6
										bra.w   return_47462
loc_47460:
										
										movea.l (a6),a6
return_47462:
										
										rts

	; End of function csc0E_jumpIfForceMemberInList


; =============== S U B R O U T I N E =======================================

; xxxx yyyyyyyy

csc0F_jumpIfCharacterAlive:
										
										move.w  (a6)+,d0
										jsr     j_GetCurrentHP
										tst.w   d1
										bne.w   loc_47476
										movea.l (a6),a6
										bra.s   return_47478
loc_47476:
										
										addq.w  #4,a6
return_47478:
										
										rts

	; End of function csc0F_jumpIfCharacterAlive


; =============== S U B R O U T I N E =======================================

; xxxx yyyy

csc10_setOrClearFlag:
										
										move.w  (a6)+,d1
										move.w  (a6)+,d0
										bne.s   loc_47488
										jsr     j_ClearFlag
										bra.s   return_4748E
loc_47488:
										
										jsr     j_SetFlag
return_4748E:
										
										rts

	; End of function csc10_setOrClearFlag


; =============== S U B R O U T I N E =======================================

csc11_promptYesNoForStoryFlow:
										
										move.l  a6,-(sp)
										jsr     j_YesNoPrompt
										movea.l (sp)+,a6
										moveq   #$59,d1 ; flag index : last answer to story-related yes/no question
										tst.w   d0
										bne.s   loc_474A8
										jsr     j_SetFlag
										bra.s   loc_474AE
loc_474A8:
										
										jsr     j_ClearFlag
loc_474AE:
										
										moveq   #$A,d0
										jsr     (Sleep).w       
										rts

	; End of function csc11_promptYesNoForStoryFlow


; =============== S U B R O U T I N E =======================================

csc12_executeContextMenu:
										
										move.w  (a6)+,d0
										move.l  a6,-(sp)
										tst.w   d0
										bne.s   loc_474C4
										jsr     j_ChurchActions ; xxxx = 0
loc_474C4:
										
										cmpi.w  #1,d0
										bne.s   loc_474D0
										jsr     j_ShopActions   ; xxxx = 1
loc_474D0:
										
										cmpi.w  #2,d0
										bne.s   loc_474DC
										jsr     j_BlacksmithActions
																						; xxxx = 2
loc_474DC:
										
										movea.l (sp)+,a6
										rts

	; End of function csc12_executeContextMenu


; =============== S U B R O U T I N E =======================================

; xxxx

csc13_setStoryFlag:
										
										move.w  (a6)+,d1
										addi.w  #$190,d1
										jsr     j_SetFlag
										rts

	; End of function csc13_setStoryFlag


; =============== S U B R O U T I N E =======================================

sub_474EE:
										
										moveq   #0,d0
										move.b  #$11,((CURRENT_MAP-$1000000)).w
																						; Mt Volcanon Shrine ?
										bsr.w   ExecuteEntityEvent
										rts

	; End of function sub_474EE
