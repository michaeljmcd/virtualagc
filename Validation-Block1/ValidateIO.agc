# Copyright 2004 Ronald S. Burkey <info@sandroid.org>
#  
# This file is part of yaAGC. 
#
# yaAGC is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# yaAGC is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with yaAGC; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

# Filename:	ValidateIO.agc
# Purpose:	This is the part of the Validation program that validates
#		just the i/o instructions like READ, WRITE, etc.
# Mod history:	07/05/04 RSB.	Began.
		
# There is no good way to test the i/o channel functions solely within the 
# CPU, as both peripheral devices and user interaction are really required.
# We use CH11 and CH12 briefly, since both are 15 bits wide and both readable
# and writeable.
# CH11 controls status lights on the DSKY, so we back it up first. It also
# contains the Engine On and Engine Off bits, so care should be taken to NOT
# run Validation when an engine is attached.
		
		INCR	ERRNUM

		# First check that L is channel 1 and Q is channel 2.
		# Also, perform normal READs and WRITEs on channel 11.
		INCR	ERRSUB		# 1
		CA	TEN
		EXTEND
		WRITE	L
		CA	FIVE
		EXTEND
		WRITE	Q
		EXTEND
		READ	CH11   # Back up CH11 so we don't permanently
		TS	SKEEP3 # screw up the DSKY display
		CA	NINE
		EXTEND
		WRITE	CH11
		CA	L
		COM
		AD	TEN
		EXTEND
		BZF	IO1
		TCF	IOERROR
IO1		INCR	ERRSUB		# 2
		CA	Q
		COM
		AD	FIVE
		EXTEND
		BZF	IO2
		TCF	IOERROR
IO2		INCR	ERRSUB		# 3
		EXTEND
		READ	L
		COM
		AD	TEN
		EXTEND
		BZF	IO3
		TCF	IOERROR
IO3		INCR	ERRSUB		# 4
		EXTEND
		READ	Q
		COM
		AD	FIVE
		EXTEND
		BZF	IO4
		TCF	IOERROR
IO4		INCR	ERRSUB		# 5
		EXTEND
		READ	CH11
		COM
		AD	NINE
		EXTEND
		BZF	IO5
		TCF	IOERROR
IO5

		# Test RAND.
		INCR	ERRSUB		# 6
		CA	MASKL1
		EXTEND
		WRITE	L
		CA	MASKL1
		EXTEND
		WRITE	Q
		CA	MASKR1
		EXTEND
		WRITE	CH12
		CA	MASKR1
		EXTEND
		WRITE	CH11
		CA	MASKL2
		EXTEND
		RAND	L
		COM
		AD	ANDL1L2
		EXTEND
		BZF	IO6A
		TCF	IOERROR
IO6A		INCR	ERRSUB		# 7
		CA	MASKR2
		EXTEND
		RAND	Q
		COM
		AD	ANDL1R2
		EXTEND
		BZF	IO7A
		TCF	IOERROR
IO7A		INCR	ERRSUB		# 10 octal
		CA	MASKL2
		EXTEND
		RAND	CH12
		COM
		AD	ANDR1L2
		EXTEND
		BZF	IO8A
		TCF	IOERROR
IO8A		INCR	ERRSUB		# 11
		CA	MASKR2
		EXTEND
		RAND	CH11
		COM
		AD	ANDR1R2
		EXTEND
		BZF	IO9A
		TCF	IOERROR
IO9A
	
		# Test ROR.
		INCR	ERRSUB		# 12
		CA	MASKL1
		EXTEND
		WRITE	L
		CA	MASKL1
		EXTEND
		WRITE	Q
		CA	MASKR1
		EXTEND
		WRITE	CH12
		CA	MASKR1
		EXTEND
		WRITE	CH11
		CA	MASKL2
		EXTEND
		ROR	L
		COM
		AD	ORL1L2
		EXTEND
		BZF	IO6O
		TCF	IOERROR
IO6O		INCR	ERRSUB		# 13
		CA	MASKR2
		EXTEND
		ROR	Q
		COM
		AD	ORL1R2
		EXTEND
		BZF	IO7O
		TCF	IOERROR
IO7O		INCR	ERRSUB		# 14
		CA	MASKL2
		EXTEND
		ROR	CH12
		COM
		AD	ORR1L2
		EXTEND
		BZF	IO8O
		TCF	IOERROR
IO8O		INCR	ERRSUB		# 15
		CA	MASKR2
		EXTEND
		ROR	CH11
		COM
		AD	ORR1R2
		EXTEND
		BZF	IO9O
		TCF	IOERROR
IO9O
	
		# Test RXOR.
		INCR	ERRSUB		# 16
		CA	MASKL1
		EXTEND
		WRITE	L
		CA	MASKL1
		EXTEND
		WRITE	Q
		CA	MASKR1
		EXTEND
		WRITE	CH12
		CA	MASKR1
		EXTEND
		WRITE	CH11
		CA	MASKL2
		EXTEND
		RXOR	L
		COM
		AD	XORL1L2
		EXTEND
		BZF	IO6X
		TCF	IOERROR
IO6X		INCR	ERRSUB		# 17
		CA	MASKR2
		EXTEND
		RXOR	Q
		COM
		AD	XORL1R2
		EXTEND
		BZF	IO7X
		TCF	IOERROR
IO7X		INCR	ERRSUB		# 20 octal
		CA	MASKL2
		EXTEND
		RXOR	CH12
		COM
		AD	XORR1L2
		EXTEND
		BZF	IO8X
		TCF	IOERROR
IO8X		INCR	ERRSUB		# 21
		CA	MASKR2
		EXTEND
		RXOR	CH11
		COM
		AD	XORR1R2
		EXTEND
		BZF	IO9X
		TCF	IOERROR
IO9X
	
		# Test WAND.
		INCR	ERRSUB		# 22
		CA	MASKL1
		EXTEND
		WRITE	L
		CA	MASKL1
		EXTEND
		WRITE	Q
		CA	MASKR1
		EXTEND
		WRITE	CH12
		CA	MASKR1
		EXTEND
		WRITE	CH11
		CA	MASKL2
		EXTEND
		WAND	L
		COM
		AD	L
		EXTEND
		BZF	IO10A
		TCF	IOERROR
IO10A		INCR	ERRSUB		# 23
		CA	ANDL1L2
		COM
		AD	L
		EXTEND
		BZF	IO11A
		TCF	IOERROR
IO11A		INCR	ERRSUB		# 24
		CA	MASKR2
		EXTEND
		WAND	Q
		COM
		AD	Q
		EXTEND
		BZF	IO12A
		TCF	IOERROR
IO12A		INCR	ERRSUB		# 25
		CA	ANDL1R2
		COM
		AD	Q
		EXTEND
		BZF	IO13A
		TCF	IOERROR
IO13A		INCR	ERRSUB		# 26
		CA	MASKL2
		EXTEND
		WAND	CH12
		COM
		AD	ANDR1L2
		EXTEND
		BZF	IO14A
		TCF	IOERROR
IO14A		INCR	ERRSUB		# 27
		EXTEND
		READ	CH12
		COM
		AD	ANDR1L2
		EXTEND
		BZF	IO15A
		TCF	IOERROR
IO15A		INCR	ERRSUB		# 30 octal
		CA	MASKR2
		EXTEND
		WAND	CH11
		COM
		AD	ANDR1R2
		EXTEND
		BZF	IO16A
		TCF	IOERROR
IO16A		INCR	ERRSUB		# 31
		EXTEND
		READ	CH11
		COM
		AD	ANDR1R2
		EXTEND
		BZF	IO17A
		TCF	IOERROR
IO17A		
	
		# Test WOR.
		INCR	ERRSUB		# 32
		CA	MASKL1
		EXTEND
		WRITE	L
		CA	MASKL1
		EXTEND
		WRITE	Q
		CA	MASKR1
		EXTEND
		WRITE	CH12
		CA	MASKR1
		EXTEND
		WRITE	CH11
		CA	MASKL2
		EXTEND
		WOR	L
		COM
		AD	L
		EXTEND
		BZF	IO10O
		TCF	IOERROR
IO10O		INCR	ERRSUB		# 33
		CA	ORL1L2
		COM
		AD	L
		EXTEND
		BZF	IO11O
		TCF	IOERROR
IO11O		INCR	ERRSUB		# 34
		CA	MASKR2
		EXTEND
		WOR	Q
		COM
		AD	Q
		EXTEND
		BZF	IO12O
		TCF	IOERROR
IO12O		INCR	ERRSUB		# 35
		CA	ORL1R2
		COM
		AD	Q
		EXTEND
		BZF	IO13O
		TCF	IOERROR
IO13O		INCR	ERRSUB		# 36
		CA	MASKL2
		EXTEND
		WOR	CH12
		COM
		AD	ORR1L2
		EXTEND
		BZF	IO14O
		TCF	IOERROR
IO14O		INCR	ERRSUB		# 37
		EXTEND
		READ	CH12
		COM
		AD	ORR1L2
		EXTEND
		BZF	IO15O
		TCF	IOERROR
IO15O		INCR	ERRSUB		# 40 octal
		CA	MASKR2
		EXTEND
		WOR	CH11
		COM
		AD	ORR1R2
		EXTEND
		BZF	IO16O
		TCF	IOERROR
IO16O		INCR	ERRSUB		# 41
		EXTEND
		READ	CH11
		COM
		AD	ORR1R2
		EXTEND
		BZF	IO17O
		TCF	IOERROR
IO17O		
	
		# Test EDRUPT.  (I believe it ... sure ... why not?)
		# ... later ...

		# All done!
		TCF	IODONE
IOERROR		CA	SKEEP3 # Fix CH11 before showing the error
		EXTEND
		WRITE	CH11
		TC	ERRORDSP
IODONE		CA	ZEROES
		TS	ERRSUB
		CA	SKEEP3 # Fix CH11 before moving on
		EXTEND
		WRITE	CH11
		

