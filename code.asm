list p=16f877A
#include p16f877A.inc
BANKSEL TRISC
MOVLW 0X01
MOVWF TRISC
CLRF TRISB
CLRF TRISD
BANKSEL PORTB
MOVLW 0X00
MOVWF 0X30
CASE BTFSS PORTC,0
 GOTO UPCOUNT
  GOTO BLINK
  
 UPCOUNT:
    BTFSC 0X30,2
     CALL VAL
    CALL DISPLAY
     INCF 0X30,1
      CALL DELAY
     GOTO CASE
     
   BLINK:
     BSF PORTD,0
     CALL DELAY
     BCF PORTD,0
     CALL DELAY
     BSF PORTD,1
     CALL DELAY
     BCF PORTD,1
     CALL DELAY
   GOTO CASE
   
   VAL:
     MOVLW 0X00
     MOVWF 0X30
     RETURN
   DISPLAY:
      MOVF 0X30,0
      
      MOVWF PORTB
      CALL DELAY
     RETURN
      
    DELAY:
     MOVLW 0X05
     MOVWF 0X31
 LP3 MOVLW 0XFF
     MOVWF 0X32
 LP2 MOVLW 0XFF
     MOVWF 0X33
 LP1 DECFSZ 0X33,1
     GOTO LP1 
     DECFSZ 0X32,1
     GOTO LP2  
     DECFSZ 0X31,1
     GOTO LP3 
     RETURN 
END
