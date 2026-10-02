NameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .Names
	db 1 ; default option

.Names:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NAME@"

PlayerNameArray:
IF DEF(_GOLD)
	db "Gold@"
	db "DANIEL@"
	db "FRITZ@"
	db "KARL@"
ELIF DEF(_SILVER)
	db "Silber@"
	db "THOMAS@"
	db "OSKAR@"
	db "HANS@"
ENDC
	db 1 ; title indent
	db " NAME @" ; title
