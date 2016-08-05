
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 100                         ;# max packet in ifq
set val(nn)     100                         ;# number of nodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      1000                      ;# X dimension of topography
set val(y)      1000                      ;# Y dimension of topography
set val(stop)   60.0                         ;# time of simulation end
set val(energymodel)      EnergyModel
set val(initialenergy)       1000

#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#     Mobile node parameter setup
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
		-channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace OFF \
                -energyModel  $val(energymodel) \
		-initialEnergy  $val(initialenergy) \
		-rxPower 1.0 \
		-txPower 1.0 \
		-idlePower 0.001 \
		-sleepPower 0.001

#Node creation
for {set i 0} {$i < $val(nn)} {incr i} {
	set n($i) [$ns node]
	$n($i) color blue
}

$n(0) set X_ 1000.00
$n(0) set Y_ 1000.00
$n(0) set Z_ 0.0
$ns initial_node_pos $n(0) 50
$ns at 0.0 "$n(0) color brown"
$ns at 0.0 "$n(0) label Basestation"
$ns at 0.01 "$n(0) add-mark m1 white circle"

$n(1) set X_ 950.00
$n(1) set Y_ 950.00
$n(1) set Z_ 0.0
$ns initial_node_pos $n(1) 40
$ns at 0.0 "$n(1) color blue"
$ns at 0.0 "$n(1) label SenCar"
$ns at 0.01 "$n(1) add-mark m1 white square"

$n(2) set X_ 320.00
$n(2) set Y_ 450.00
$n(2) set Z_ 0.0
$ns at 0.01 "$n(2) color pink"

$n(3) set X_ 400.00
$n(3) set Y_ 200.00
$n(3) set Z_ 0.0
$ns at 0.01 "$n(3) color darkblue"

$n(4) set X_ 930.00
$n(4) set Y_ 350.00
$n(4) set Z_ 0.0
$ns at 0.01 "$n(4) color yellow"

$n(5) set X_ 710.00
$n(5) set Y_ 800.00
$n(5) set Z_ 0.0
$ns at 0.01 "$n(5) color magenta"

$n(6) set X_ 550.00
$n(6) set Y_ 550.00
$n(6) set Z_ 0.0
$ns at 0.01 "$n(6) color cyan"

$n(7) set X_ 100.00
$n(7) set Y_ 600.00
$n(7) set Z_ 0.0
$ns at 0.01 "$n(7) color darkgreen"

$n(8) set X_ 100.00
$n(8) set Y_ 260.00
$n(8) set Z_ 0.0
$ns at 0.01 "$n(8) color pink"

$n(9) set X_ 580.00
$n(9) set Y_ 380.00
$n(9) set Z_ 0.0
$ns at 0.01 "$n(9) color darkblue"

$n(10) set X_ 700.00
$n(10) set Y_ 150.00
$n(10) set Z_ 0.0
$ns at 0.01 "$n(10) color yellow"

$n(11) set X_ 890.00
$n(11) set Y_ 650.00
$n(11) set Z_ 0.0
$ns at 0.01 "$n(11) color magenta"

$n(12) set X_ 520.00
$n(12) set Y_ 720.00
$n(12) set Z_ 0.0
$ns at 0.01 "$n(12) color cyan"

$n(13) set X_ 170.00
$n(13) set Y_ 780.00
$n(13) set Z_ 0.0
$ns at 0.01 "$n(13) color darkgreen"

for {set i 14} {$i < $val(nn)} {incr i} {
	set xval [expr rand() * 950]
	set yval [expr rand() * 950]
	$n($i) set X_ $xval
	$n($i) set Y_ $yval
	$n($i) set Z_ 0.0
if { [expr $xval < 325] && [expr $yval < 488] && [expr $yval < 975] } {
$n($i) color brown
$ns at 0.01 "$n($i) color pink"
}
if { [expr $xval > 325] && [expr $xval < 650] && [expr $yval < 488] } {
$n($i) color darkblue
$ns at 0.01 "$n($i) color darkblue"
}
if { [expr $xval > 650] && [expr $xval < 975 ] && [expr $yval < 488] } {
$n($i) color brown
$ns at 0.01 "$n($i) color yellow"
}
if { [expr $xval < 325] && [expr $yval > 488] && [expr $yval < 975] } {
$n($i) color darkgreen
$ns at 0.01 "$n($i) color darkgreen"
}
if { [expr $xval > 325] && [expr $xval < 650] && [expr $yval > 488] && [expr $yval < 975] } {
$n($i) color darkblue
$ns at 0.01 "$n($i) color cyan"
}
if { [expr $xval > 650] && [expr $yval > 488] && [expr $yval < 975] && [expr $xval < 975 ] } {
$n($i) color magenta
$ns at 0.01 "$n($i) color magenta"
}
}

for {set i 2} {$i < $val(nn)} { incr i } {
# 30 defines the node size for nam
$ns initial_node_pos $n($i) 30
}

source energy

$ns at 0.0 "$ns trace-annotate \"Network Formation...........\""
$ns at 0.01 "$ns trace-annotate \"Cluster is formed...........\""
$ns at 1.0 "$ns trace-annotate \"Cluster head is elected...........\""
$ns at 1.5 "$ns trace-annotate \"SenCar moves to collect data from CH...........\""
$ns at 6.1 "$ns trace-annotate \"Communication starts...........\""
$ns at 31.3 "$ns trace-annotate \"Energy reduced.....\""
$ns at 32.0 "$ns trace-annotate \"CH changes.....\""
$ns at 50.5 "$ns trace-annotate \"Communication ends.....\""
$ns at 52.0 "$ns trace-annotate \"SenCar forwards to BS.....\""

source chead

#Data gathering
$ns at 1.5 "$n(1) setdest 800 400 100.0"
$ns at 7.5 "$n(1) setdest 650 700 100.0"
$ns at 11.0 "$n(1) setdest 600 510 100.0"
$ns at 13.0 "$n(1) setdest 400 480 100.0"
$ns at 15.1 "$n(1) setdest 80 540 100.0"
$ns at 18.5 "$n(1) setdest 350 250 100.0"
$ns at 24.0 "$n(1) setdest 500 500 100.0"
$ns at 27.0 "$n(1) setdest 890 350 50.0"
$ns at 35.5 "$n(1) setdest 750 750 50.0"
$ns at 44.0 "$n(1) setdest 950 950 30.0"

source traffic.tcl

#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}

for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n($i) reset"
}

$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
