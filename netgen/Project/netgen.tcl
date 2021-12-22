# Wishrc startup for ToolScript (netgen)
#
# For installation:  Put this file and also tclnetgen.so into
# directory ${CAD_ROOT}/netgen/tcl/, and set the "load" line below
# to point to the location of tclnetgen.so.  Also see comments
# in shell script "netgen.sh".
#

# Check namespaces for existence of other applications
set UsingMagic 0
set UsingXCircuit 0
set UsingIRSIM 0
set batchmode 0
set nlist [namespace children]
foreach i $nlist {
   switch $i {
      ::magic { set UsingMagic 1 }
      ::xcircuit { set UsingXCircuit 1 }
      ::irsim { set UsingIRSIM 1 }
   }
}

# -lazy option not needed if stubs libraries are handled correctly
# load -lazy /usr/local/lib/netgen/tcl/tclnetgen.so

load /usr/local/lib/netgen/tcl/tclnetgen.so

#----------------------------------------------------------------
# Convert LVS list result into a JSON file 
#----------------------------------------------------------------

proc netgen::convert_to_json {filename lvs_final} {
   set pidx [string last . $filename]
   set jsonname [string replace $filename $pidx end ".json"]
   if {![catch {open $jsonname w} fjson]} {
      puts $fjson "\["
      # Outer list is of each cell compared
      set clen [llength $lvs_final]
      set cidx 0
      foreach circuit $lvs_final {
         incr cidx
         puts $fjson "  \{"
         set nkeys [llength $circuit]
         set kidx 0
	 foreach {key value} $circuit {
            incr kidx 2
	    switch $key {
	       name {
	          puts $fjson "   \"${key}\": \["
		  set cktval [lindex $value 0]
		  puts $fjson "      \"${cktval}\","
		  set cktval [lindex $value 1]
		  puts $fjson "      \"${cktval}\""
		  if {$kidx == $nkeys} {
		     puts $fjson "   \]"
		  } else {
		     puts $fjson "   \],"
		  }
	       }
	       pins {
	          puts $fjson "   \"${key}\": \["
	          puts $fjson "      \["
		  set cktval [lindex $value 0]
		  foreach pin [lrange $cktval 0 end-1] {
		     puts $fjson "        \"$pin\","
		  }
		  set pin [lindex $cktval end]
		  puts $fjson "        \"$pin\""
	          puts $fjson "      \], \["
		  set cktval [lindex $value 1]
		  foreach pin [lrange $cktval 0 end-1] {
		     puts $fjson "        \"$pin\","
		  }
		  set pin [lindex $cktval end]
		  puts $fjson "        \"$pin\""
	          puts $fjson "      \]"
		  if {$kidx == $nkeys} {
		     puts $fjson "   \]"
		  } else {
		     puts $fjson "   \],"
		  }
	       }
               nets {
	          puts $fjson "   \"${key}\": \["
		  set cktval [lindex $value 0]
		  puts $fjson "    $cktval,"
		  set cktval [lindex $value 1]
		  puts $fjson "    $cktval"
		  if {$kidx == $nkeys} {
		     puts $fjson "   \]"
		  } else {
		     puts $fjson "   \],"
		  }
               }
	       devices {
	          puts $fjson "   \"${key}\": \["
	          puts $fjson "       \["
		  set cktval [lindex $value 0]
		  foreach dev [lrange $cktval 0 end-1] {
		     set devname [lindex $dev 0]
		     set devnum  [lindex $dev 1]
		     puts $fjson "         \[\"${devname}\", ${devnum}\],"
		  }
		  set dev [lindex $cktval end]
		  set devname [lindex $dev 0]
		  set devnum  [lindex $dev 1]
		  puts $fjson "         \[\"${devname}\", ${devnum} \]"
	          puts $fjson "       \], \["
		  set cktval [lindex $value 1]
		  foreach dev [lrange $cktval 0 end-1] {
		     set devname [lindex $dev 0]
		     set devnum  [lindex $dev 1]
		     puts $fjson "         \[\"${devname}\", ${devnum} \],"
		  }
		  set dev [lindex $cktval end]
		  set devname [lindex $dev 0]
		  set devnum  [lindex $dev 1]
		  puts $fjson "         \[\"${devname}\", ${devnum} \]"
	          puts $fjson "       \]"
		  if {$kidx == $nkeys} {
		     puts $fjson "   \]"
		  } else {
		     puts $fjson "   \],"
		  }
	       }
	       goodnets -
	       badnets {
	          puts $fjson "   \"${key}\": \["
		  set glen [llength $value]
		  set gidx 0
		  foreach group $value {
		     incr gidx
	             puts $fjson "      \["
	             puts $fjson "        \["
		     set cktval [lindex $group 0]
		     set nlen [llength $cktval]
		     set nidx 0
		     foreach net $cktval {
			incr nidx
	                puts $fjson "          \["
			set netname [string map {"\\" "\\\\"} [lindex $net 0]]
		        puts $fjson "            \"$netname\","
		        puts $fjson "            \["
			set netconn [lindex $net 1]
			foreach fanout [lrange $netconn 0 end-1] {
			   set devname [lindex $fanout 0]
			   set pinname [lindex $fanout 1]
			   set count [lindex $fanout 2]
			   if {$count == {}} {set count 0}
		           puts $fjson "              \[ \"$devname\", \"$pinname\", $count \],"
			}
			set fanout [lindex $netconn end]
			set devname [lindex $fanout 0]
			set pinname [lindex $fanout 1]
			set count [lindex $fanout 2]
			if {$count == {}} {set count 0}
		        puts $fjson "              \[ \"$devname\", \"$pinname\", $count \]"
		        puts $fjson "            \]"
			if {$nidx == $nlen} {
	                   puts $fjson "          \]"
			} else {
	                   puts $fjson "          \],"
			}
		     }
	             puts $fjson "        \], \["
		     set cktval [lindex $group 1]
		     set nlen [llength $cktval]
		     set nidx 0
		     foreach net $cktval {
			incr nidx
	                puts $fjson "          \["
			set netname [string map {"\\" "\\\\"} [lindex $net 0]]
		        puts $fjson "            \"$netname\","
		        puts $fjson "            \["
			set netconn [lindex $net 1]
			foreach fanout [lrange $netconn 0 end-1] {
			   set devname [lindex $fanout 0]
			   set pinname [lindex $fanout 1]
			   set count [lindex $fanout 2]
			   if {$count == {}} {set count 0}
		           puts $fjson "              \[ \"$devname\", \"$pinname\", $count \],"
			}
			set fanout [lindex $netconn end]
			set devname [lindex $fanout 0]
			set pinname [lindex $fanout 1]
			set count [lindex $fanout 2]
			if {$count == {}} {set count 0}
		        puts $fjson "              \[ \"$devname\", \"$pinname\", $count \]"
		        puts $fjson "            \]"
			if {$nidx == $nlen} {
	                   puts $fjson "          \]"
			} else {
	                   puts $fjson "          \],"
			}
		     }
	             puts $fjson "        \]"
		     if {$gidx == $glen} {
	                puts $fjson "      \]"
		     } else {
	                puts $fjson "      \],"
		     }
		  }
		  if {$kidx == $nkeys} {
		     puts $fjson "   \]"
		  } else {
		     puts $fjson "   \],"
		  }
	       }
	       goodelements -
	       badelements {
	          puts $fjson "   \"${key}\": \["
		  set glen [llength $value]
		  set gidx 0
		  foreach group $value {
		     incr gidx
	             puts $fjson "      \["
	             puts $fjson "        \["
		     set cktval [lindex $group 0]
		     set ilen [llength $cktval]
		     set iidx 0
		     foreach inst $cktval {
			incr iidx
	                puts $fjson "          \["
			set instname [string map {"\\" "\\\\"} [lindex $inst 0]]
		        puts $fjson "            \"$instname\","
		        puts $fjson "            \["
			set instpins [lindex $inst 1]
			foreach fanout [lrange $instpins 0 end-1] {
			   set pinname [lindex $fanout 0]
			   set count [lindex $fanout 1]
			   if {$count == {}} {set count 0}
		           puts $fjson "              \[ \"$pinname\", $count \],"
			}
			set fanout [lindex $instpins end]
			set pinname [lindex $fanout 0]
			set count [lindex $fanout 1]
			if {$count == {}} {set count 0}
		        puts $fjson "              \[ \"$pinname\", $count \]"
		        puts $fjson "            \]"
			if {$iidx == $ilen} {
	                   puts $fjson "          \]"
			} else {
	                   puts $fjson "          \],"
			}
		     }
	             puts $fjson "        \], \["
		     set cktval [lindex $group 1]
		     set ilen [llength $cktval]
		     set iidx 0
		     foreach inst $cktval {
			incr iidx
	                puts $fjson "          \["
			set instname [string map {"\\" "\\\\"} [lindex $inst 0]]
		        puts $fjson "            \"$instname\","
		        puts $fjson "            \["
			set instpins [lindex $inst 1]
			foreach fanout [lrange $instpins 0 end-1] {
			   set pinname [lindex $fanout 0]
			   set count [lindex $fanout 1]
			   if {$count == {}} {set count 0}
		           puts $fjson "              \[ \"$pinname\", $count \],"
			}
			set fanout [lindex $instpins end]
			set pinname [lindex $fanout 0]
			set count [lindex $fanout 1]
			if {$count == {}} {set count 0}
		        puts $fjson "              \[ \"$pinname\", $count \]"
		        puts $fjson "            \]"
			if {$iidx == $ilen} {
	                   puts $fjson "          \]"
			} else {
	                   puts $fjson "          \],"
			}
		     }
	             puts $fjson "        \]"
		     if {$gidx == $glen} {
	                puts $fjson "      \]"
		     } else {
	                puts $fjson "      \],"
		     }
		  }
		  if {$kidx == $nkeys} {
		     puts $fjson "   \]"
		  } else {
		     puts $fjson "   \],"
		  }
	       }
	       properties {
	          puts $fjson "   \"${key}\": \["
		  set plen [llength $value]
                  set pidx 0
		  foreach instance $value {
		     incr pidx
	             puts $fjson "      \["
		     set instnames [string map {"\\" "\\\\"} [lindex $instance 0]]
		     set instname0 [string map {"\\" "\\\\"} [lindex $instnames 0]]
	             puts $fjson "         \["
		     puts $fjson "           \"${instname0}\","
	             puts $fjson "           \["
		     foreach property [lrange $instance 1 end-1] {
		        set prop0 [lindex $property 0]
			set propname [lindex $prop0 0]
			set propval [lindex $prop0 1]
		        puts $fjson "             \[\"${propname}\", \"${propval}\"\],"
		     }
		     set property [lindex $instance end]
		     set prop0 [lindex $property 0]
		     set propname [lindex $prop0 0]
		     set propval [lindex $prop0 1]
		     puts $fjson "             \[\"${propname}\", \"${propval}\"\]"
	             puts $fjson "           \]"
	             puts $fjson "         \],"
		     set instname1 [string map {"\\" "\\\\"} [lindex $instnames 1]]
	             puts $fjson "         \["
		     puts $fjson "           \"${instname1}\","
	             puts $fjson "           \["
		     foreach property [lrange $instance 1 end-1] {
		        set prop1 [lindex $property 1]
			set propname [lindex $prop1 0]
			set propval [lindex $prop1 1]
		        puts $fjson "             \[\"${propname}\", \"${propval}\"\],"
		     }
		     set property [lindex $instance end]
		     set prop1 [lindex $property 1]
		     set propname [lindex $prop1 0]
		     set propval [lindex $prop1 1]
		     puts $fjson "             \[\"${propname}\", \"${propval}\"\]"
	             puts $fjson "           \]"
	             puts $fjson "         \]"
		     if {$pidx == $plen} {
	                puts $fjson "      \]"
		     } else {
	                puts $fjson "      \],"
		     }
		  }
		  if {$kidx == $nkeys} {
		     puts $fjson "   \]"
		  } else {
		     puts $fjson "   \],"
		  }
	       }
	    }
	 }
         if {$cidx == $clen} {
            puts $fjson "  \}"
	 } else {
            puts $fjson "  \},"
	 }
      }
      puts $fjson "\]"
   }
   close $fjson
}

#-----------------------------------------------------------------------
# Define the "lvs" command as a way of calling the netgen options
# for standard compare, essentially the same as the old "netcomp"
# standalone program.
#
# Use the "canonical" command to parse the file and cell names,
# although if the cells have not been read in yet, then the
# original syntax of filename or {filename cellname} is required.
#
# "args" may be "-list", "-json", or "-blackbox".
#    "-list" returns output as a nested list.
#    "-json" creates a .json-format output file in addition to stdout.
#    "-blackbox" treats empty cells as black-box entries.
#    "-noflatten={list}" is a list of cells not to flatten if mismatched.
#    i.e., the cells are expected to match and any mismatch cannot be
#    expected to be resolved by flattening the contents of the mismatched
#    cells.
#-----------------------------------------------------------------------

proc netgen::lvs { name1 name2 {setupfile setup.tcl} {logfile comp.out} args} {
   set dolist 0
   set dojson 0
   set noflat {}
   foreach arg $args {
      if {$arg == "-list"} {
	 puts stdout "Generating list result"
	 set dolist 1
	 set lvs_final {}
      } elseif {$arg == "-json"} {
	 puts stdout "Generating JSON file result"
	 set dolist 1
	 set dojson 1
	 set lvs_final {}
      } elseif {$arg == "-blackbox"} {
	 puts stdout "Treating empty subcircuits as black-box cells"
	 netgen::model blackbox on
      } elseif {[string first "-noflatten=" $arg] == 0} {
	 set value [string range $arg 11 end]
	 # If argument is a filename then read the list of cells from it;
	 # otherwise, argument is the list of files itself in quotes or
	 # braces.
	 if {![catch {file exists $value}]} {
	    if {![catch {open $value r} fnf]} {
	       while {[gets $fnf line] >= 0} {
		  if {[lindex $line 0] != "#"} {
		     foreach cell $line {
		    	lappend noflat $cell
		     }
		  }
	       }
	       close $fnf
	    } else {
	       puts stderr "Cannot open file $value for reading cell list."
	    }
	 } else {
	    set noflat [string trim $value \"\{\}]
	 }
	 if {[llength $noflat] > 0} {
	    puts stdout "Will not flatten these subcells: $noflat"
	 }
      }
   }

   # Allow name1 or name2 to be a list of {filename cellname},
   # A single <filename>, or any valid_cellname form if the
   # file has already been read.

   if {[catch {set flist1 [canonical $name1]}]} {
      if {[llength $name1] == 2} {
         set file1 [lindex $name1 0]
         set cell1 [lindex $name1 1]
      } else {
         set file1 $name1
         set cell1 $name1
      }
      puts stdout "Reading netlist file $file1"
      set fnum1 [netgen::readnet $file1]
   } else {
      set cell1 [lindex $flist1 0]
      set fnum1 [lindex $flist1 1]
      set flist1 [canonical $fnum1]
      set file1 [lindex $flist1 0]
   }

   if {[catch {set flist2 [canonical $name2]}]} {
      if {[llength $name2] == 2} {
         set file2 [lindex $name2 0]
         set cell2 [lindex $name2 1]
      } else {
         set file2 $name2
         set cell2 $name2
      }
      puts stdout "Reading netlist file $file2"
      set fnum2 [netgen::readnet $file2]
   } else {
      set cell2 [lindex $flist2 0]
      set fnum2 [lindex $flist2 1]
      set flist2 [canonical $fnum2]
      set file2 [lindex $flist2 0]
   }

   if {$fnum1 == $fnum2} {
      puts stderr "Both cells are in the same netlist:  Cannot compare!"
      return
   }

   set clist1 [cells list $fnum1]
   set cidx [lsearch -regexp $clist1 ^$cell1$]
   if {$cidx < 0} {
      puts stderr "Cannot find cell $cell1 in file $file1"
      return
   } else {
      set cell1 [lindex $clist1 $cidx]
   }
   set clist2 [cells list $fnum2]
   set cidx [lsearch -regexp $clist2 ^$cell2$]
   if {$cidx < 0} {
      puts stderr "Cannot find cell $cell2 in file $file2"
      return
   } else {
      set cell2 [lindex $clist2 $cidx]
   }

   netgen::compare assign "$fnum1 $cell1" "$fnum2 $cell2"

   if {[file exists $setupfile]} {
      puts stdout "Reading setup file $setupfile"
      # Instead of sourcing the setup file, run each line so we can
      # catch individual errors and not let them halt the LVS process
      set perrors 0
      if {![catch {open $setupfile r} fsetup]} {
	 set sline 0
	 set command {}
	 while {[gets $fsetup line] >= 0} {
	    incr sline
	    append command $line "\n"
	    if {[info complete $command]} {
	       if {[catch {uplevel 1 [list namespace eval netgen $command]} msg]} {
		  set msg [string trimright $msg "\n"]
		  puts stderr "Error $setupfile:$sline (ignoring), $msg"
		  incr perrors
	       }
	       set command {}
	    }
	 }
	 close $fsetup
      } else {
	 puts stdout "Error:  Cannot read the setup file $setupfile"
      }
	
      if {$perrors > 0} {
	 puts stdout "Warning:  There were errors reading the setup file"
      }
   } elseif {[string first nosetup $setupfile] < 0} {
      netgen::permute default	;# transistors and resistors
      netgen::property default
   }

   if {[string first nolog $logfile] < 0} {
      puts stdout "Comparison output logged to file $logfile"
      netgen::log file $logfile

      netgen::log start
      netgen::log echo off
      set dolog true
   } else {
      set dolog false
   }

   if {$dolist == 1} {
      set endval [netgen::compare -list hierarchical "$fnum1 $cell1" "$fnum2 $cell2"]
   } else {
      set endval [netgen::compare hierarchical "$fnum1 $cell1" "$fnum2 $cell2"]
   }
   if {$endval == {}} {
      netgen::log put "No cells in queue!\n"
      return
   }
   set properr {}
   set matcherr {}
   set pinsgood -1
   while {$endval != {}} {
      if {$dolist == 1} {
         netgen::run -list converge
      } else {
         netgen::run converge
      }
      netgen::log echo on
      if {[verify equivalent]} {
	 # Resolve automorphisms by pin and property
	 if {$dolist == 1} {
            netgen::run -list resolve
	 } else {
            netgen::run resolve
	 }
	 set uresult [verify unique]
         if {$uresult == 0} {
	    netgen::log put "   Networks match locally but not globally.\n"
	    netgen::log put "   Probably connections are swapped.\n"
	    netgen::log put "   Check the end of logfile ${logfile} for implicated nodes.\n"
	    if {$dolist == 1} {
	       verify -list nodes
	    } else {
	       verify nodes
	    }

	    # Flatten the non-matching subcircuit (but not the top-level cells)
            if {[netgen::print queue] != {}} {
	       if {([lsearch $noflat [lindex $endval 0]] == -1) &&
			([lsearch $noflat [lindex $endval 1]] == -1)} {
	           netgen::log put "  Flattening non-matched subcircuits $endval\n"
	           netgen::flatten class "[lindex $endval 0] $fnum1"
	           netgen::flatten class "[lindex $endval 1] $fnum2"
	       } else {
	           netgen::log put "  Continuing with black-boxed subcircuits $endval\n"
		   lappend matcherr [lindex $endval 0]"($fnum1)"
		   lappend matcherr [lindex $endval 1]"($fnum2)"
	           # Match pins
                   netgen::log echo off
	           if {$dolist == 1} {
		       set result [equate -list -force pins "$fnum1 [lindex $endval 0]" \
				"$fnum2 [lindex $endval 1]"]
	           } else {
		       set result [equate -force pins "$fnum1 [lindex $endval 0]" \
				"$fnum2 [lindex $endval 1]"]
	           }
	           if {$result != 0} {
		       equate classes "$fnum1 [lindex $endval 0]" \
			        "$fnum2 [lindex $endval 1]"
	           }
	           set pinsgood $result
                   netgen::log echo on
	       }
	    }
	 } else {
            netgen::log echo off
	    if {$dolist == 1} {
		set result [equate -list pins "$fnum1 [lindex $endval 0]" \
				"$fnum2 [lindex $endval 1]"]
	    } else {
		set result [equate pins "$fnum1 [lindex $endval 0]" \
				"$fnum2 [lindex $endval 1]"]
	    }
	    if {$result != 0} {
		equate classes "$fnum1 [lindex $endval 0]" \
			 "$fnum2 [lindex $endval 1]"
	    }
	    # If $uresult == -1 then these are black-box entries and
	    # $pinsgood should not be set to the resulting value.
	    if {$uresult > 0} {
	        set pinsgood $result
	    }
            netgen::log echo on
	 }
	 if {$uresult == 2} {lappend properr [lindex $endval 0]}
      } else {
	 # Flatten the non-matching subcircuit (but not the top-level cells)
         if {[netgen::print queue] != {}} {
	    if {([lsearch $noflat [lindex $endval 0]] == -1) &&
		    ([lsearch $noflat [lindex $endval 1]] == -1)} {
	       netgen::log put "  Flattening non-matched subcircuits $endval\n"
	       netgen::flatten class "[lindex $endval 0] $fnum1"
	       netgen::flatten class "[lindex $endval 1] $fnum2"
	    } else {
	       netgen::log put "  Continuing with black-boxed subcircuits $endval\n"
	       lappend matcherr [lindex $endval 0]"($fnum1)"
	       lappend matcherr [lindex $endval 0]"($fnum2)"
	       # Match pins
               netgen::log echo off
	       if {$dolist == 1} {
		   set result [equate -list -force pins "$fnum1 [lindex $endval 0]" \
			    "$fnum2 [lindex $endval 1]"]
	       } else {
		   set result [equate -force pins "$fnum1 [lindex $endval 0]" \
			    "$fnum2 [lindex $endval 1]"]
	       }
	       if {$result != 0} {
		   equate classes "$fnum1 [lindex $endval 0]" \
			    "$fnum2 [lindex $endval 1]"
	       }
	       set pinsgood $result
               netgen::log echo on
	    }
	 }
      }
      netgen::log echo off
      if {$dolist == 1} {
         catch {lappend lvs_final $lvs_out}
         set lvs_out {}
         set endval [netgen::compare -list hierarchical]
      } else {
         set endval [netgen::compare hierarchical]
      }
   }
   netgen::log echo off
   puts stdout "Result: " nonewline
   netgen::log echo on
   if {$pinsgood == 0} {
      # NOTE:  Need to disambiguate these two cases. . .
      netgen::log put "Cells failed matching, or top level cell failed pin matching.\n"
   } else {
      verify only
   }
   if {$properr != {}} {
      netgen::log put "The following cells had property errors:\n " [regsub -all { } $properr "\n "] "\n"
   }
   if {$matcherr != {}} {
      netgen::log put "The following subcells failed to match:\n " [regsub -all { } $matcherr "\n "] "\n"
   }
   if {$dolog} {
      netgen::log end
   }
   puts stdout "LVS Done."
   if {$dojson == 1} {
      netgen::convert_to_json $logfile $lvs_final
   } elseif {$dolist == 1} {
      return $lvs_final
   }
}

# It is important to make sure no netgen commands overlap with Tcl built-in
# commands, because otherwise the namespace import will fail.

proc pushnamespace { name } {

   set y [namespace eval ${name} info commands ::${name}::*]
   set z [info commands]

   foreach v $y {
      regsub -all {\*} $v {\\*} i
      set x [namespace tail $i]
      if {[lsearch $z $x] < 0} {
         namespace import $i
      } else {
            puts "Warning: ${name} command '$x' use fully-qualified name '$v'"
      }
   }
}

proc popnamespace { name } {
   set z [info commands]
   set l [expr [string length ${name}] + 5]

   while {[set v [lsearch $z ${name}_tcl_*]] >= 0} {
      set y [lindex $z $v]
      set w [string range $y $l end]
      interp alias {} ::$w {}
      rename ::$y ::$w
      puts "Info: replacing ::$w with ::$y"
   }
   namespace forget ::${name}::*
}

set auto_noexec 1       ;# don't EVER call UNIX commands w/o "shell" in front

#----------------------------------------------------------------------
# Cross-Application section
#----------------------------------------------------------------------

# Setup IRSIM assuming that the Tcl version is installed.
# We do not need to rename procedure irsim to NULL because it is
# redefined in a script, which simply overwrites the original.

proc irsim { args } {
   global CAD_ROOT
   set irsimscript [glob -nocomplain ${CAD_ROOT}/irsim/tcl/irsim.tcl]
   if { ${irsimscript} == {} } {
      puts stderr "\"irsim\" requires Tcl-based IRSIM version 9.6 or newer."
      puts stderr "Could not find script \"irsim.tcl\".  If IRSIM is installed in a"
      puts stderr "place other than CAD_ROOT (=${CAD_ROOT}), use the command"
      puts stderr "\"source <path>/irsim.tcl\" before doing \"irsim\"."
   } else {
      source $irsimscript
      eval {irsim} $args
   }
}

# Setup Xcircuit assuming that the Tcl version is installed.

proc xcircuit { args } {
   global CAD_ROOT
   global argc
   global argv
   set xcircscript [glob -nocomplain ${CAD_ROOT}/xcircuit*/xcircuit.tcl]
   if { ${xcircscript} == {} } {
      puts stderr "\"xcircuit\" requires Tcl-based XCircuit version 3.1 or newer."
      puts stderr "Could not find script \"xcircuit.tcl\".  If XCircuit is installed in a"
      puts stderr "place other than CAD_ROOT (=${CAD_ROOT}), use the command"
      puts stderr "\"source <path>/xcircuit.tcl\"."
   } else {
      # if there are multiple installed versions, choose the highest version.
      if {[llength $xcircscript] > 1} {
        set xcircscript [lindex [lsort -decreasing -dictionary $xcircscript] 0]
      }
      set argv $args
      set argc [llength $args]
      uplevel #0 source $xcircscript
   }
}

# Setup Magic assuming that the Tcl version is installed.

proc magic { args } {
   global CAD_ROOT
   global argc
   global argv
   set magicscript [glob -nocomplain ${CAD_ROOT}/magic/tcl/magic.tcl]
   if { ${magicscript} == {} } {
      puts stderr "\"magic\" requires Tcl-based Magic version 7.2 or newer."
      puts stderr "Could not find script \"magic.tcl\".  If Magic is installed in a"
      puts stderr "place other than CAD_ROOT (=${CAD_ROOT}), use the command"
      puts stderr "\"source <path>/magic.tcl\"."
   } else {
      set argv $args
      set argc [llength $args]
      uplevel #0 source $magicscript
   }
}

#----------------------------------------------------------------------------
# Have we called netgen from tkcon or a clone thereof?  If so, set NetgenConsole
#----------------------------------------------------------------------------

if {! $UsingMagic } {
   if {[lsearch [interp aliases] tkcon] != -1} {
      set NetgenConsole tkcon
      wm withdraw .
   }
}

pushnamespace netgen

#----------------------------------------------------------------------------
# For now, if we are standalone, pop down the default Tk window.
# Sometime later we may wish to provide a standalone GUI frontend in Tk
# to improve upon the original X11 "xnetgen" frontend.  If so, its
# definitions would go below.

if {! $UsingMagic } {
   if {[lsearch [interp aliases] tkcon] != -1} {
      if {[string range [wm title .] 0 3] == "wish"} {
	 wm withdraw .
      }
   }
}

#----------------------------------------------------------------------------
# No-console mode drops "--" in front of the argument list and "-noc"
# is retained, so remove them.  Internally, the console will be determined
# by checking for a slave interpreter, so there is no need for any
# action here other than removing the argument.

if {[lindex $argv 0] == "--"} {
   incr argc -1
   set argv [lrange $argv 1 end]
}

if {[string range [lindex $argv 0] 0 3] == "-noc"} {
   incr argc -1
   set argv [lrange $argv 1 end]
}

if {[string range [lindex $argv 0] 0 3] == "-bat"} {
   incr argc -1
   set argv [lrange $argv 1 end]
   set batchmode 1
}

#----------------------------------------------------------------------------
# Anything on the command line is assumed to be a netgen command to evaluate

if {[catch {eval $argv}]} {
   puts stdout "$errorInfo"
}
if {$batchmode == 1} {quit}

#----------------------------------------------------------------------------
# Netgen start function drops back to interpreter after initialization & setup
