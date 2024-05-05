/*FACTS*/
/* Personality types */
type(1, 'ISTJ-A! Diligent and fact-oriented individuals, whose reliability is unquestionable').
type(2, 'ISFJ-A! Dedicated and warm protectors, always ready to defend their loved ones').
type(3, 'INFJ-A! Charismatic and inspiring leaders who mesmerize their listeners').
type(4, 'INTJ-A! Imaginative and strategic thinkers with a plan for every situation').
type(5, 'ISTP-A! Bold and practical experimenters, masters of various tools').
type(6, 'ISFP-A! Flexible and charming artists, always exploring new experiences').
type(7, 'INFP-A! Poetic, kind, and altruistic souls, always eager to support noble causes').
type(8, 'INTP-A! Innovative with an insatiable thirst for knowledge').
type(9, 'ESTP-A! Smart, energetic, and perceptive individuals who thrive on excitement').
type(10, 'ESFP-A! Spontaneous, energetic, and enthusiastic people who bring vibrancy to life').
type(11, 'ENFP-A! Enthusiastic, creative, and sociable free spirits who find joy in everything').
type(12, 'ENTP-A! Smart and curious thinkers who love intellectual challenges').
type(13, 'ESTJ-A! Excellent administrators and managers, adept at handling people and tasks').
type(14, 'ESFJ-A! Exceptionally caring, social, and popular individuals always willing to help').
type(15, 'ENFJ-A! Quiet and mystical yet highly inspiring and tireless idealists').
type(16, 'ENTJ-A! Bold, imaginative, and resolute leaders who create opportunities').
type(17, 'ISTJ-T! Practical and fact-oriented individuals, their reliability is never in question').
type(18, 'ISFJ-T! Committed and protective, always ready to defend their loved ones').
type(19, 'INFJ-T! Charismatic leaders who captivate their audience with their presence').
type(20, 'INTJ-T! Visionary and strategic thinkers with meticulously planned approaches').
type(21, 'ISTP-T! Fearless and practical experimenters who excel with various tools').
type(22, 'ISFP-T! Adaptable and charismatic artists, always embracing new adventures').
type(23, 'INFP-T! Poetic, altruistic, and kind-hearted individuals, eager to support noble causes').
type(24, 'INTP-T! Innovative minds with an unquenchable thirst for knowledge and understanding').
type(25, 'ESTP-T! Energetic and perceptive individuals who thrive on challenging environments').
type(26, 'ESFP-T! Spontaneous and enthusiastic, bringing liveliness and joy to every situation').
type(27, 'ENFP-T! Creative and sociable free spirits, always finding reasons to smile and inspire').
type(28, 'ENTP-T! Curious and intellectual thinkers, drawn to challenges and exploration').
type(29, 'ESTJ-T! Efficient administrators and managers, adept at managing both tasks and people').
type(30, 'ESFJ-T! Caring and popular, always ready to lend a helping hand to those in need').
type(31, 'ENFJ-T! Inspirational and tireless idealists, quietly mystical yet deeply motivating').
type(32, 'ENTJ-T! Bold and imaginative leaders, always finding or creating solutions to challenges').

/*FACTS*/
/* Questions to determine each dimension */
question('E', 'Do you tend to focus on the outer world and get energized by social interactions?').
question('S', 'Do you tend to rely on your five senses and focus on what is real and concrete?').
question('T', 'Do you tend to make decisions based on logic and objective analysis?').
question('J', 'Do you tend to prefer a structured and organized lifestyle?').
question('A', 'Do you tend to be generally calm and confident in most situations?').

/*RULES*/
/* Entry point of the expert system */
identify_type :-
    write('Answer the following questions with "yes." or "no."'), nl,
    retractall(answer(_)), % Remove existing answer facts
    identify_dimension('E', Extraversion),
    identify_dimension('S', Sensing),
    identify_dimension('T', Thinking),
    identify_dimension('J', Judging),
     identify_dimension('A', Assertive),
    determine_type(Extraversion, Sensing, Thinking, Judging, Assertive).

/*RULES*/
/* Ask user a question and record the answer */
identify_dimension(Dimension, Answer) :-
    question(Dimension, Question),
    write(Question), write(' '),
    read(Response),
    (Response == yes  ->
        Answer = Dimension
    ;
        opposite_trait(Dimension, OppositeAnswer),
        Answer = OppositeAnswer
    ).

/*RULES*/
/* Determine the personality type based on the dimensions */
determine_type(Extraversion, Sensing, Thinking, Judging, Assertive) :-
    type_number([Extraversion, Sensing, Thinking, Judging, Assertive], TypeNumber),
    type(TypeNumber, PersonalityType),
    write('Your MBTI personality type is: '), write(PersonalityType), nl.

/*FACTS*/
/*Mapping opposite traits*/
opposite_trait('E', 'I').
opposite_trait('I', 'E').
opposite_trait('S', 'N').
opposite_trait('N', 'S').
opposite_trait('T', 'F').
opposite_trait('F', 'T').
opposite_trait('J', 'P').
opposite_trait('P', 'J').
opposite_trait('A', 'T').
opposite_trait('T', 'A').

/*RULES*/
/* Determine the type number based on the dimensions */
type_number([E, S, T, J, A], TypeNumber) :-
    (E == 'I', S == 'S', T == 'T', J == 'J', A == 'A' -> TypeNumber = 1 ;%ISTJ-A
     E == 'I', S == 'S', T == 'F', J == 'J', A == 'A' -> TypeNumber = 2 ;%ISFJ-A
    E == 'I', S == 'N', T == 'F', J == 'J', A == 'A' -> TypeNumber = 3 ;%INFJ-A
    E == 'I', S == 'N', T == 'T', J == 'J', A == 'A' -> TypeNumber = 4 ;%INTJ-A
    E == 'I', S == 'S', T == 'T', J == 'P', A == 'A' -> TypeNumber = 5 ;%ISTP-A
    E == 'I', S == 'S', T == 'F', J == 'P', A == 'A' -> TypeNumber = 6 ;%ISFP-A
    E == 'I', S == 'N', T == 'F', J == 'P', A == 'A' -> TypeNumber = 7 ;%INFP-A
    E == 'I', S == 'N', T == 'T', J == 'P', A == 'A' -> TypeNumber = 8 ;%INTP-A
    E == 'E', S == 'S', T == 'T', J == 'P', A == 'A' -> TypeNumber = 9 ;%ESTP-A
    E == 'E', S == 'S', T == 'F', J == 'P', A == 'A' -> TypeNumber = 10 ;%ESFP-A
    E == 'E', S == 'N', T == 'F', J == 'P', A == 'A' -> TypeNumber = 11 ;%ENFP-A
    E == 'E', S == 'N', T == 'T', J == 'P', A == 'A' -> TypeNumber = 12 ;%ENTP-A
    E == 'E', S == 'S', T == 'T', J == 'J', A == 'A' -> TypeNumber = 13 ;%ESTJ-A
    E == 'E', S == 'S', T == 'F', J == 'J', A == 'A' -> TypeNumber = 14 ;%ESFJ-A
    E == 'E', S == 'N', T == 'F', J == 'J', A == 'A' -> TypeNumber = 15 ;%ENFJ-A
    E == 'E', S == 'N', T == 'T', J == 'J', A == 'A' -> TypeNumber = 16;%ENTJ-A
    E == 'I', S == 'S', T == 'T', J == 'J', A == 'T' -> TypeNumber = 17 ;%ISTJ-T
    E == 'I', S == 'S', T == 'F', J == 'J', A == 'T' -> TypeNumber = 18 ;%ISFJ-T
    E == 'I', S == 'N', T == 'F', J == 'J', A == 'T' -> TypeNumber = 19 ;%INFJ-T
    E == 'I', S == 'N', T == 'T', J == 'J', A == 'T' -> TypeNumber = 20;%INTJ-T
    E == 'I', S == 'S', T == 'T', J == 'P', A == 'T' -> TypeNumber = 21 ;%ISTP-T
    E == 'I', S == 'S', T == 'F', J == 'P', A == 'T' -> TypeNumber = 22 ;%ISFP-T
    E == 'I', S == 'N', T == 'F', J == 'P', A == 'T' -> TypeNumber = 23 ;%INFP-T
    E == 'I', S == 'N', T == 'T', J == 'P', A == 'T' -> TypeNumber = 24 ;%INTP-T
    E == 'E', S == 'S', T == 'T', J == 'P', A == 'T' -> TypeNumber = 25 ;%ESTP-T
    E == 'E', S == 'S', T == 'F', J == 'P', A == 'T' -> TypeNumber = 26 ;%ESFP-T
    E == 'E', S == 'N', T == 'F', J == 'P', A == 'T' -> TypeNumber = 27 ;%ENFP-T
    E == 'E', S == 'N', T == 'T', J == 'P', A == 'T' -> TypeNumber = 28 ;%ENTP-T
    E == 'E', S == 'S', T == 'T', J == 'J', A == 'T' -> TypeNumber = 29 ;%ESTJ-T
    E == 'E', S == 'S', T == 'F', J == 'J', A == 'T' -> TypeNumber = 30 ;%ESFJ-T
    E == 'E', S == 'N', T == 'F', J == 'J', A == 'T' -> TypeNumber = 31 ;%ENFJ-T
    E == 'E', S == 'N', T == 'T', J == 'J', A == 'T' -> TypeNumber = 32).%ENTJ-T




