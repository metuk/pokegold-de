PlaceWaitingText::
	hlcoord 3, 10
	ld b, 1
	ld c, 12

	ld a, [wBattleMode]
	and a
	jr z, .notinbattle

	call Textbox
	jr .proceed

.notinbattle
	predef LinkTextboxAtHL

.proceed
	hlcoord 4, 11
	ld de, .Waiting
	call PlaceString
	ld c, 50
	jp DelayFrames

.Waiting:
	db "BITTE WARTEN@"

DummyPredef1:
	ret
