INCLUDE Irvine32.inc


.data
	Score SDWORD 0
	count DWORD 0
	NameOfPlayer BYTE 20 DUP(?)
	play_again BYTE "Do you want to play again?", 0
	caption BYTE "Quiz game", 0
	eq1 byte "Q.How many days are there in a nonleapyear?",0
	ea1 byte "a)365   b)444    c)200",0
	eq2 byte "Q.How many sides are there in a  isoceles  triangle?",0
	ea2 byte "a)1   b)2    c)5",0
	eq3 byte "Who discovered electricity?",0
	ea3 byte "a)Steve Jobs   b)Thomas Edison   c)Benjamin Franklin",0
	eq4 byte "Q.Which 2 part of your body continues to grow?",0
	ea4 byte "a)Nose and Ears   b)Legs and Hands    c)Hairs and teeth",0
	eq5 byte "Q.Which is  the coldest continent on earth?",0
	ea5 byte "a)Karachi   b)Antarctica    c)Australia",0
	eq6 byte "Q.Which is the largest mammal?",0
	ea6 byte "a)Whale   b)Cat    c)Sparow",0
	eq7 byte "Q.What do you call a house made of ice?",0
	ea7 byte "a)PentHouse   b)Igloo    c)TreeHouse",0
	eq8 byte "Q.Which is the largest country in the world?",0
	ea8 byte "a)India   b)Pakistan    c)Rusia",0
	eq9 byte "Q.If you freeze water, what do you get?",0
	ea9 byte "a)Ice   b)Fire    c)Air",0
	eq10 byte "Q.What do caterpillars turn into",0
	ea10 byte "a)Snail   b)Butterfly    c)Tiger",0

	mq1 byte "What is the lifespan of a dragonfly?",0
	ma1 byte "a)1 day   b)3 days    c)20 years",0
	mq2 byte "What is the capital of Portugal??",0
	ma2 byte "a)Kabul    b)Lisbon    c)Jersey",0
	mq3 byte "Who is the current Prime Minister of Pakistan?",0
	ma3 byte "a)Bajwa   b)Imran Khan    c)Beggar Sharif",0
	mq4 byte "How many hearts does an Octopus Have?",0
	ma4 byte "a)2   b)3    c)1",0
	mq5 byte "Where were the first computer animations produced?",0
	ma5 byte "a)Rutherford Lab   b)TechG labs   c)Google Office",0
	mq6 byte "When did World War II end?",0
	ma6 byte "a)1980   b)1945   c)1946",0
	mq7 byte "The Taj Mahal was constructed as a tomb of the wife of which Mughal Emperor?",0
	ma7 byte "a)Akbar   b)Aurangzeb   c)Shahjehan",0
	mq8 byte "Who is the first female Prime Minister of Australia?",0
	ma8 byte "a)Jullia Gilliard   b)Benazir  c)Jessy Malcolms",0
	mq9 byte "Which country gifted the famous Statue of Liberty?",0
	ma9 byte "a)Germany   b)France  c)Canada",0
	mq10 byte "Elon Musk is the CEO of which famous brand?",0
	ma10 byte "a)Twitter   b)Facebook  c)Google",0

	hq1 byte "Which gas is formed when a hydrogen bomb is detonated?",0
	ha1 byte "a)Oxygen   b)Hydrogen  c)Helium",0
	hq2 byte "Which fruit will you find at the top of the trophy of the Men?s Wimbledon?",0
	ha2 byte "a)Mango   b)Apple  c)PineApple",0
	hq3 byte "Which superhero has kryptonite as his only weakness?",0
	ha3 byte "a)Superman   b)Batman  c)Hulk",0
	hq4 byte "How many notes are there in a musical scale?",0
	ha4 byte "a)7   b)5  c)8",0
	hq5 byte "What is the Olympic sport in which athletes cross the finish line backwards?",0
	ha5 byte "a)Swimming   b)Rowing  c)Javelin Throw",0
	hq6 byte "Whereabouts in the body is the pituitary gland located?",0
	ha6 byte "a)Brain   b)Legs  c)Eyes",0
	hq7 byte "How many black and white squares are there on a chess board in total?",0
	ha7 byte "a)56   b)66  c)64",0
	hq8 byte "Area 51 is located in which US state?",0
	ha8 byte "a)Arizona   b)Los Angeles  c)Nevada",0
	hq9 byte "In what year was McDonald's founded?",0
	ha9 byte "a)1960   b)1955  c)1940",0
	hq10 byte "What is the currency of Poland?",0
	ha10 byte "a)Dollars   b)Zloty  c)Riyal",0



.code

main proc

mov eax,0
	mov ebx,0
	mov ecx,0
	mov edx,0
	mov al,4
	
	call settextcolor
	call gettextcolor
	call title1
	call PlayerName
	Choice:
		mov eax,0
		call Clrscr
		call title1
		call Crlf
		mov edx, Offset NameOfPlayer
		mWrite "Welcome "
		call WriteString
		call Crlf
		call Crlf
		call instruction
		call menu
		mov eax,0
		call readint
		cmp eax, 1
		jz beginner
		cmp eax, 2
		jz intermediate
		cmp eax, 3
		jz advanced
		cmp eax, 1
		jl invalid_choice
		jmp option1
		option1:
			cmp eax, 3
			jg invalid_choice
			jmp endd
		invalid_choice:
			mWrite "Enter valid Choice of level."
			mov eax, 700
			call delay
			jmp choice
		jmp endd
		beginner:
			call clrscr
			call easyfunc
			jmp again
		intermediate:
			call clrscr
			call medfunc
			jmp again
		advanced:
			call clrscr
			call hardfunc
			jmp again
		again:
			call crlf
			mov ebx, Offset caption
			mov edx, Offset play_again
			call MsgBoxAsk
			;mWrite "Do u want to play Again?"
			;call crlf
			;Mwrite "1. Yes   2.  No"
			;call crlf
			;mWrite "Choice: "
			cmp eax, 6
			je Choice
			jmp endd
		endd:
			call clrscr
			call title1
			call crlf
			mov al,9
			call writechar
			call writechar
			call writechar	
			mWrite "Thank You."
			call crlf
exit 
main ENDP

	title1 proc
		mov al,9
		call writechar
		call writechar
		call writechar	
		mwrite"QUIZ GAME"
		call crlf
		call crlf
		call crlf
		ret
	title1 endp

	PlayerName PROC
		mov ecx, 20
		mov edx, Offset NameOfPlayer 
		mWrite "Enter Your Name: "
		call ReadString
		ret
	PlayerName ENDP

	instruction PROC
		mwrite "INSTRUCTIONS TO FOLLOW: "
		call crlf
		mwrite"i) For every correct answer,You will get 2 marks"
		call crlf
		mwrite"ii) For every wrong answer,2 mark will be deducted"
		call crlf
		mwrite"iii) If you give 3 wrong answers, Quiz will end."
		call crlf
		call Crlf
		ret
	instruction endp

	;=================Menu================;
	menu PROC
		mwrite"Select difficulty level"
		call crlf
		mwrite"1. Beginner "
		call crlf
		mwrite"2. Intermediate"
		call crlf
		mwrite"3. Advanced"
		call crlf
		call Crlf
		mWrite "Choice: "
		ret
	menu endp


	;==============================Display score
	DisplayScore PROC, name1: PTR BYTE, points:DWORD
		call Clrscr
		call title1
		mov eax, 0
		mov eax, points
		mov edx, name1
		call WriteString
		mWrite " your Total score is: "
		call Writeint
		cmp eax,4
		jge l1
		jmp l2
		l1:
		call crlf
		mwrite "Excellent Job"
		jmp l100
		l2:
		call crlf
		mwrite "You need to improve"
		l100:
		ret
	DisplayScore ENDP

exit 
main ENDP
END main