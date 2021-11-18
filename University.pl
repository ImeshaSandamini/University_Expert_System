:- use_module(library(jpl)).

go :-sleep(0.4),	
		write('-----------------------------------------------------------------'),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.2),
		write("###################||| EXPERT SYSTEM |||#########################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write('-----------------------------------------------------------------'),nl,nl,
		sleep(0.2),
		write('By using this system you can choose best deegree in our university according to your qualification'),nl,nl,nl,
		
		interface2.

  
	subject(Student,bio) :- verify(Student," did you pass A/L Biology? (y/n)").
	subject(Student,chemistry) :- verify(Student," did you pass A/L Chemistry?(y/n) ?").
	subject(Student,com_maths) :- verify(Student," did you pass A/L Combined Mathematics(y/n) ?").
	subject(Student,physics) :- verify(Student," did you pass A/L Physics (y/n) ?").
	subject(Student,agri) :- verify(Student," did you pass A/L Agriculture (y/n) ?").
	subject(Student,commerce) :- verify(Student," did you pass A/L Commerce (y/n) ?").
	subject(Student,economics) :- verify(Student," did you pass A/L Economics (y/n) ?").
	subject(Student,bs) :- verify(Student," did you pass A/L Bussiness Studies subject (y/n) ?").
	subject(Student,accounting) :- verify(Student," did you pass A/L Accounting (y/n) ?").
	
	subject(Student,it) :- verify(Student," did you pass O/L It (y/n) ?").
	subject(Student,english) :- verify(Student," did you have above C pass O/L English subject(y/n) ?").
	subject(Student,maths) :- verify(Student," did you have above C pass O/L Maths subject(y/n) ?").
	
		
	degree(Student,engineering) :-
		subject(Student,com_maths),
		subject(Student,chemistry),
		subject(Student,physics),		
		
		nl,			
		write('Recommended Books for this course:'),
		nl,
		write('1: Engineering Fundamentals by Saeed Moaveni'),
		nl,
		write('2: Studying Engineering - A Road Map to A Rewarding Career by Raymond B. Landis'),
		nl,
		write('3: Engineering the ABCs: How Engineers Shape Our World by Patty Brien'),
		nl.
					
    degree(Student,computerscience) :-
		(subject(Student,com_maths);subject(Student,bio)),
		subject(Student,it),
		subject(Student,english),
		subject(Student,maths),
		
		nl,			
		write('Recommended Books for this course:'),
		nl,
		write('1: Algorithms by Robert Sedgewick'),
		nl,
		write('2: Types and Programming Languages by Benjamin C.'),
		nl.
		
	degree(Student,agriculture) :-
        subject(Student,agri),
		(subject(Student,chemistry);subject(Student,bio)),
		
		nl,			
		write('Recommended Books for this course:'),
		nl,
		write('1: General Agriculture by Olive Thomas'),
		nl,
		write('2: Economy with agriculture by James K. Morgan'),
		nl.
				
	degree(Student,biochemistry) :-
		subject(Student,bio),
		subject(Student,chemistry),
		
		nl,			
		write('Recommended Books for this course:'),
		nl,
		write('1: Lehninger Principles of Biochemistry by Albert L. Lehninger'),
		nl,
		write('2: Fundamentals of Biochemistry'),
		nl.
		
	degree(Student,management) :-
		subject(Student,accounting),
		subject(Student,economics),
		subject(Student,bs),

		nl,			
		write('Recommended Books for this course:'),
		nl,
		write('1: The Lean Startup by Eric Reis '),
		nl,
		write('2: Fundamentals of management'),
		nl.		

	degree(Student,tourism) :-
		subject(Student,commerce),
		subject(Student,economics),
		subject(Student,english),
		
		nl,			
		write('Recommended Books for this course:'),
		nl,
		write('1: Economics of Sustainable Tourism by Anil Markandya'),
		nl,
		write('2: Tourism Management: An Introduction by Clare Inkson, Lynn Minnaert'),
		nl.
		
	degree(Student,law) :-
		(subject(Student,commerce);subject(Student,com_maths);subject(Student,bio)),
		subject(Student,english),

		nl,			
		write('Recommended Books for this course:'),
		nl,
		write('1: Bleak House by Charles Dickens'),
		nl,
		write('2: The Rule of Law by Tom Bingham'),
		nl,
		write('3: Justice: What the Right Thing to Do? by Michael J Sandel'),
		nl.		

	degree(Student,quantity_surveying) :-
		(subject(Student,com_maths);subject(Student,bio);subject(Student,commerce);subject(Student,agri)),
		subject(Student,maths),
		
		nl,			
		write('Recommended Books for this course:'),
		nl,
		write('1: Quantity Surveyor Pocket Book Duncan Cartlidge'),
		nl,
		write('2: Construction Quantity Surveying Donald Towey'),
		nl.
										
	degree(_,"to write our appitude test.But currently you have not enough qulifications to enter our ").
	
    response(Reply) :-
        read(Reply),
        write(Reply),nl.

ask(Student,Question) :-
	write(Student),write(', do you'),write(Question),
	
	interface(', do you',Student,Question),
	write('Loading.'),nl,
	sleep(1),
	write('Loading..'),nl,
	sleep(1),
	write('Loading...'),nl,
	sleep(1),
    nl.
	
:- dynamic yes/1,no/1.		
	
verify(P,S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(P,S))).
	 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.
	

st(Student):- 
		degree(Student,Course),
		interface3(Student,', you can choose ',Course,' degree program.'),
        write(Student),write(', you can choose '),write(Course),write(' degree program.'),undo,end.


end :-
		nl,nl,nl,
		sleep(0.7),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write("################||| THANK YOU FOR USE ME |||#####################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl.
		
		
interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- UNIVERSITY EXPERT SYSTEM ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [500,300], _),
	jpl_call(F, setSize, [500,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),
	jpl_call(F, dispose, [], _), 
	write(N),nl,
	( (N == yes ; N == y)
      ->
       assert(yes(Z)) ;
       assert(no(Z)), fail).

	   
interface2 :-
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- UNIVERSITY EXPERT SYSTEM ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [500,300], _),
	jpl_call(F, setSize, [500,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'Welcome! How are you? Tell me your name please'], N),
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(null)
		->	write('you cancelled'),interface3('you cancelled. ','Thank you ','for use ','me.'),end,fail
		;	write("Welcome! How are you? Tell me your name please : "),write(N),nl,st(N)
	).
	
	
interface3(P,W1,D,W2) :-
	atom_concat(P,W1, A),
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- UNIVERSITY EXPERT SYSTEM ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [500,300], _),
	jpl_call(F, setSize, [500,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(void)
		->	write('')
		;	write("")
	).	
		   
help :- write("To start the expert system please type 'go.' and press Enter key").	 


% Write to file
write_to_file(File, Text):-
	open(File, write, Stream),
	write(Stream, Text),nl,
	close(Stream).
	
% Read from file
read_file(File):-
	open(File, read, Stream),
	% Get char from the data stream
	get_char(Stream, Char1),
	% Output all the chars until end of file
	proc_stream(Char1, Stream),
	close(Stream).

% Continue getting all chars until end_of_file
% "!" (cut) is used to abort back-tracking or this execution
proc_stream(end_of_file,_):-!. % Terminating Condition for Recursive Procedure Call

proc_stream(Char, Stream):-
	write(Char),
	get_char(Stream, Char2),
	proc_stream(Char2, Stream). 






  