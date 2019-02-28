COMMENT*
			                           PROBLEM 1
		  Write a procedure that receives a number in AX, counts the number
		  of ones in its binary representation, and return this count in BX.Do this
		  in 7 instruction.

*COMMENT 
INCLUDE Irvine32.inc

.data
remainder word 0
quotient word 0
binary byte 100 DUP(?)
count dword ?
.code
main PROC
MOV EAX,0
MOV EDX,0
MOV EBX,0

	
	MOV AX,25		;Take the input in AX
	call count1s    ;Convert to binary
	MOV EAX,0       

	MOV AL,25		
	call writedec

	MOV AL,'='
	call writechar

	MOV ECX,count
	MOV ESI,offset binary
	add ESI,count
	sub ESI,1

	L1:
		MOV AL,[ESI]
		call writedec
		DEC ESI
	LOOP L1
main ENDP

count1s PROC 

MOV ESI,offset binary
.while(AL != 0)		;While the dividend is not zero keep looping.

	.while (AL >= 2)	;While the dividend is greater than the divisor 
		sub AX,2        ;Sub 2 from the dividend  
		add DX,1        ; and Add 1 to the quotient.
	.endw
	
	MOV [ESI],AL		;Store the binary number into the array.
	INC ESI

	add count,1			;Keep a count of binary digits.


	MOV AX,DX       ;Make AX the dividend again.
	MOV DX,0        ;restar the quotient.
.endw

ret
count1s ENDP
end main