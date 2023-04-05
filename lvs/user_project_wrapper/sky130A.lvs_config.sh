# LVS configuration file - bash version - non hierarchical

# All cell lists allow the use of the "*" wildcard

: "${TOP_SOURCE:=user_project_wrapper}"
: "${TOP_LAYOUT:=$TOP_SOURCE}"
export TOP_SOURCE TOP_LAYOUT

# list of cells to be flattened before extraction
export EXTRACT_FLATGLOB="
	"

# list of cells to be abstracted before extraction
export EXTRACT_ABSTRACT="
	*__fill_*
	*__fakediode_*
	*__tapvpwrvgnd_*"

# list of cells to be flattened during lvs
export LVS_FLATTEN="
	"

# list of cells not to be flattened during lvs
export LVS_NOFLATTEN="
	"

# list of cells to be ignored during lvs
export LVS_IGNORE="
	"

# list of spice input files (lowest hierarchy first)
export LVS_SPICE_FILES="
	$PDK_ROOT/$PDK/libs.ref/sky130_fd_sc_hd/spice/sky130_ef_sc_hd__decap_12.spice
	$PDK_ROOT/$PDK/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice"

# list of verilog input files (lowest hierarchy first)
export LVS_VERILOG_FILES="
    $UPRJ_ROOT/verilog/gl/user_proj_example.v
	$UPRJ_ROOT/verilog/gl/$TOP_SOURCE.v"

# gds file
: "${LAYOUT_FILE:=$UPRJ_ROOT/gds/$TOP_LAYOUT.gds}"
export LAYOUT_FILE


