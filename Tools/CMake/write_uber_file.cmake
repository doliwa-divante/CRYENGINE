# Writes an uber file to disk
# Args: (Passed before -P with -D)
#   -DUBER_FILE : path of the generated file
#   -DSRC_FILES : list of source files seperated by comma
#   -DSRC_DIR   : source dir to which source files are relative
FILE(WRITE ${UBER_FILE} "// Unity Build generated by CMake\n")

string(REPLACE "," ";" unit_sources "${SRC_FILES}")
foreach(source_file ${unit_sources} )
	if (${source_file} MATCHES ".*\\.\\cpp$" OR 
			${source_file} MATCHES ".*\\.\\CPP$" OR
			${source_file} MATCHES ".*\\.\\c$")
		FILE( APPEND ${UBER_FILE} "#include <${SRC_DIR}/${source_file}>\n")
	endif()
endforeach(source_file)

