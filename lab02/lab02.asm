# Calculate sums of positive odd and negative even values in an array
#   in MIPS assembly using MARS
# for MYΥ-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 
     
main:
        la         $a0, length       # get address of length to $a0
        lw         $a0, 0($a0)       # get the length in to $a0

        la         $a1, input        # get address of array to $a1

        addiu      $s0, $zero, 0     # sum of positive odd values starts as 0
        addiu      $s1, $zero, 0     # sum of negative even values starts as 0

        add	   $s2, $0, $0		# set s2 as 0   	 
    	la         $a2, length       	# get address of length to $a2
        lw         $a2, 0($a2) 		# get the length into $a2	    	    	          	      	 
        la  	   $a0, input		# get address of input to $a2
        		   		   		   		   
loop:
	beq	 $s2, $a2, quitloop	# if $s2=$a2 then quits loop	
	addi	 $s2, $s2, 1		# $s2=$s2+1(counters the time that loop works)
	lw 	 $s3, 0($a0)		# $s3 gets the current value of the input 	 
	slti	 $t1, $s3, 0		# if $s3<0		
	bne	 $t1, $0, neg		# go to neg
	j	 pos			# else go to pos 
neg:
	andi 	 $t2, $s3, 1		# check if the number is odd or equal	
	beq	 $t2, $0, equal		# if its equal go to equal	
	j	 skip			# else go to skip
equal:
	add 	 $s1, $s1, $s3		# $s1=$s1+$s3
	j	 skip			# go to skip
pos:
	andi	 $t3, $s3, 1		# check if the number is odd or equal
	bne	 $t3, $0, odd		# if the number is odd go to odd
	j	 skip			# go to skip
odd:
	add 	 $s0, $s0, $s3		# $s0=$s0+$s3
skip:
	addi	 $a0, $a0, 4		# $a0=$a0+4($a0 gets the next value from input)
	j	 loop			# go to loop	
quitloop:
        
exit: 
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.
        
        ###############################################################################
        # Data input.
        ###############################################################################
        .data
length: .word 5 # Number of values in the input array
input:  .word 3, -2, 0, 4, -1
