
function  gaia_get, GAIA_LIST=gaia_list, TARGET_DIR=target_dir_value, TYPE=type_value, DOWNLOAD_TYPE=downloadtype_value , FILENAME=filename_value, QUIET=quiet_value
	compile_opt idl2
	
	IF n_elements(gaia_list) EQ 0 THEN message, "Provide gaia list result of a gaia_search please" ELSE GAIA_LIST=gaia_list
	IF n_elements(target_dir_value) NE 0 THEN TARGET_DIR=target_dir_value
	IF n_elements(quiet_value) EQ 0 THEN QUIET=0 ELSE QUIET=quiet_value	
	IF n_elements(filename_value) NE 0 THEN FILENAME=filename_value
	IF n_elements(type_value) NE 0 THEN TYPE=type_value
	file=obj_new()
	IF n_elements(downloadtype_value) NE 0 THEN BEGIN 
		DOWNLOAD_TYPE=downloadtype_value
		file=gaia_get_selection( GAIA_LIST=GAIA_LIST, TARGET_DIR=TARGET_DIR, DOWNLOAD_TYPE=DOWNLOAD_TYPE, FILENAME=FILENAME, QUIET=QUIET )
		return ,1
	ENDIF ELSE BEGIN
		FOREACH gaia_item, GAIA_LIST DO BEGIN
			file=gaia_item->get_file(TARGET_DIR=TARGET_DIR, QUIET=QUIET, TYPE=TYPE)
		ENDFOREACH
		return, 1
	ENDELSE	 
	
end

