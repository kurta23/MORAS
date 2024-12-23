@0
D=M
@5
M=D       // Postavim 5. memoriju na vrijednost nulte za pripremu

@0
D=M       // Učitaj vrijednost sa mem lokacije 0 u D
@5
D=D-M     // Oduzmi vrijednost sa mem lokacije 5 od vrijednosti sa lokacije 0 (D = D - M)
@skip1
D;JGE     // Ako je D >= 0, preskoči sljedeći korak (to znači da je 0 <= 5, pa ne treba ništa mijenjati)
@0
D=M       // Ponovno učitaj vrijednost sa memorijske lokacije 0 u D
@5
M=D       // Spremi vrijednost sa lokacije 0 na lokacije 5
(skip1)     // Ovdje nastavlja program ako nije bilo potrebno spremiti


@1
D=M       
@5
D=D-M     
@skip2
D;JGE     
@1
D=M       
@5
M=D      
(skip2)   


@2
D=M      
@5
D=D-M   
@skip3
D;JGE    
@2
D=M       
@5
M=D       
(skip3)    


@3
D=M      
@5
D=D-M    
@skip4
D;JGE    
@3
D=M      
@5
M=D      
(skip4)     


@4
D=M     
@5
D=D-M  
@skip5
D;JGE    
@4
D=M      
@5
M=D       
(skip5)    


(END)     // Beskonačna petlja za end
@END
0;JMP    