.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc 
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc 

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
    newline db 10,13,0
    FName db "Full Name: ", 0
    Fyear db "First Year",10, 0
    Syear db "Second Year", 10, 0
    Tyear db "Third Year",10, 0
    fyear db "Fourth Year", 10, 0
    YearLevel db "Select year level: [1] 1st Year [2] 2nd Year [3] 3rd Year [4] 4th Year ",10, 0
    Program db "BACHELOR OF PHYSICAL EDUCATION", 10, 0
    Semester db "Select Semester: [1] First [2] Second [3] Summer: ", 0
    InvalidMsg db "Invalid input!", 10, 0

    ; Table Borders
    Border db "+-------------+-------------------------------------------------+-----+--------+-------+---------+", 10, 0
    TableHeader db "| Subject Code| Subject Title                                   | Lec |   Lab  | Total |  PreReq |", 10, 0
    Border2 db "+-------------+---------------------------------------------------------------------------------+-----+--------+-------+-------------------+", 10, 0
    TableHeader2 db "| Subject Code| Subject Title                                                                   | Lec |   Lab  | Total |       PreReq      |", 10, 0
    Border3 db "+-------------+-------------------------------------------------------------------------+-----+--------+-------+-------------------+", 10, 0
    TableHeader3 db "| Subject Code| Subject Title                                                           | Lec |   Lab  | Total |       PreReq      |", 10, 0

    ; First Semester
    F_Sem db "=== FIRST SEMESTER SUBJECTS ===", 10, 0
    F_Subj1 db "| GE 2        | Purposive Communication w/ Interactive Learning |  6  |   0    |   6   |  NONE   |", 10, 0
    F_Subj2 db "| GE 1        | Understanding the Self                          |  3  |   0    |   3   |  NONE   |", 10, 0
    F_Subj3 db "| GE 4        | Mathematics in the Modern World                 |  3  |   0    |   3   |  NONE   |", 10, 0
    F_Subj4 db "| GE 20       | Reading Visual Arts                             |  3  |   0    |   3   |  NONE   |", 10, 0
    F_Subj5 db "| BPE 111     | Philosophical & Socio-anthropological Found.    |  3  |   0    |   3   |  NONE   |", 10, 0
    F_Subj6 db "| GE 15       | Environmental Science                           |  3  |   0    |   3   |  NONE   |", 10, 0
    F_Subj7 db "| PANF 1      | Movement Competency Training                    |  2  |   0    |   2   |  NONE   |", 10, 0
    F_Subj8 db "| NSTP 1      | National Service Training Program 1             |  3  |   0    |   3   |  NONE   |", 10, 0

    ; Second Semester
    S_Sem db "=== SECOND SEMESTER SUBJECTS ===", 10, 0
    S_Subj1 db "| UGE 1       | Reading Comprehension                           |  6  |   0    |   6   |  GE 2   |", 10, 0
    S_Subj2 db "| GE 3        | The Contemporary World                          |  3  |   0    |   3   |  NONE   |", 10, 0
    S_Subj3 db "| EDUC 101    | The Child & Adolescent Learner & Learning       |  3  |   0    |   3   |  NONE   |", 10, 0
    S_Subj4 db "| GE 6        | Rizal's Life and Works                          |  3  |   0    |   3   |  NONE   |", 10, 0
    S_Subj5 db "| BPE 112     | Anatomy & Physiology of Human Movement          |  3  |   0    |   3   |  NONE   |", 10, 0
    S_Subj6 db "| BPE 113     | Principles Motor Control & Learning             |  3  |   0    |   3   |  NONE   |", 10, 0
    S_Subj7 db "| PANF 2      | Exercise-based Fitness Activities               |  2  |   0    |   2   |  PANF 1 |", 10, 0
    S_Subj8 db "| NSTP 2      | National Service Training Program 2             |  3  |   0    |   3   |  NSTP 1 |", 10, 0

    ; Summer Semester
    Sum_Sem db "=== SUMMER SUBJECTS ===", 10, 0
    Sum_Subj1 db "| BPE 122     | Applied Motor Control & Learning of Exercise    |  3  |    0   |   3   | BPE 113 |", 10, 0
    Sum_Subj2 db "| BPE 123     | Individual & Dual Sports                        |  3  |    0   |   3   | BPE 113 |", 10, 0
    Sum_Subj3 db "| BPE 121     | Physiology of Exercise & Physical Activity      |  3  |    0   |   3   | BPE 112 |", 10, 0
    
    ;Second Year - First Semester

    SY2_F_Sem db "===FIRST SEMESTER SUBJECTS ===", 10, 0
    SY2_F_Subj1 db "| LP 100      | Strategic Lesson Planning and Design            |  3  |  0     |   3   | NONE    |", 10, 0
    SY2_F_Subj2 db "| BPE 213     | Philippine Traditional Games and Sports         |  3  |  0     |   3   | NONE    |", 10, 0
    SY2_F_Subj3 db "| GE 7        | Art Appreciation                                |  3  |  0     |   3   | NONE    |", 10, 0
    SY2_F_Subj4 db "| EDUC 102    | Technology for Teaching and Learning 1          |  3  |  0     |   3   | NONE    |", 10, 0
    SY2_F_Subj5 db "| BPE 211     | Movement Education                              |  3  |  0     |   3   | BPE 113 |", 10, 0
    SY2_F_Subj6 db "| BPE 212     | Philippine Traditional Dances                   |  3  |  0     |   3   | BPE 113 |", 10, 0
    SY2_F_Subj7 db "| GE 11       | The Entrepreneurial Mind                        |  2  |  0     |   2   | NONE    |", 10, 0
    SY2_F_Subj8 db "| EDUC 105    | Assessment of Learning 1                        |  3  |  0     |   3   | NONE    |", 10, 0
    SY2_F_Subj9 db "| PANF 3      | Dance and Sports 1                              |  3  |  0     |   3   | PANF 2  |", 10, 0

    ; Second Year - Second Semester
    SY2_S_Sem db "===SECOND SEMESTER SUBJECTS ===", 10, 0
    SY2_S_Subj1 db "| GE 5        | Science, Technology, and Society                |  3  |  0     |   3   | NONE    |", 10, 0
    SY2_S_Subj2 db "| EDUC 107    | Assessment of Learning 2                        |  3  |  0     |   3   | EDUC 105|", 10, 0
    SY2_S_Subj3 db "| EDUC 103    | Facilitating Learner-centered Teaching          |  3  |  0     |   3   | EDUC 101|", 10, 0
    SY2_S_Subj4 db "| EDUC 104    | Foundations of Special and Inclusive Education  |  3  |  0     |   3   | NONE    |", 10, 0
    SY2_S_Subj5 db "| EDUC 106    | The Teacher and the School Curriculum           |  3  |  0     |   3   | NONE    |", 10, 0
    SY2_S_Subj6 db "| BPE 221     | International Dance and Other Forms             |  3  |  0     |   3   | BPE 212 |", 10, 0
    SY2_S_Subj7 db "| GE 8        | Readings in Philippine History                  |  2  |  0     |   2   | NONE    |", 10, 0
    SY2_S_Subj8 db "| BPE 223     | Emergency Preparedness and Safety Management    |  3  |  0     |   3   | BPE 122 |", 10, 0
    SY2_S_Subj9 db "| PANF 4      | Dance and Sports 2                              |  3  |  0     |   3   | PANF 3  |", 10, 0

    ; Second Year - Summer
    SY2_Sum_Sem db "===SUMMER SUBJECTS ===", 10, 0
    SY2_Sum_Subj1 db "| BPE 222     | Swimming and Aquatics                           |  3  |  0     |   3   | BPE 223 |", 10, 0
    SY2_Sum_Subj2 db "| BPE 224     | Art in the K-12 Curriculum                      |  3  |  0     |   3   | EDUC103 |", 10, 0
    SY2_Sum_Subj3 db "| BPE 313     | Sports and Exercise Psychology                  |  3  |  0     |   3   | BPE 112 |", 10, 0

    ;Third Year - First Semester

    SY3_F_Sem db "===FIRST SEMESTER SUBJECTS ===", 10, 0
    SY3_F_Subj1 db "| FIL 215     | Malayuning Komunikasyon sa Wikang Filipino                              |  3  |   0    |   3   | NONE              |", 10, 0
    SY3_F_Subj2 db "| GE 9        | Ethics (Disciplinal)                                                    |  3  |   0    |   3   | NONE              |", 10, 0
    SY3_F_Subj3 db "| BPE 321     | Team Sports                                                             |  3  |   0    |   3   | BPE 123           |", 10, 0
    SY3_F_Subj4 db "| BPE 312     | Personal, Community and Environmental Health                            |  3  |   0    |   3   | NONE              |", 10, 0
    SY3_F_Subj5 db "| BPE 324     | Curriculum and Assessment for Physical Education and Health Education   |  3  |   0    |   3   | EDUC 105, EDUC 106|", 10, 0
    SY3_F_Subj6 db "| BPE 315     | Music in the K-12 Curriculum                                            |  3  |   0    |   3   | EDUC 103          |", 10, 0
    SY3_F_Subj7 db "| BPE 412     | Research in School PE 1                                                 |  3  |   0    |   3   | EDUC 107          |", 10, 0
    SY3_F_Subj8 db "| EDUC 108    | Building and Enhancing New Literacies Across the Curriculum             |  3  |   0    |   3   | NONE              |", 10, 0
    SY3_F_Subj9 db "| BPE 311     | Coordinated School Health Program                                       |  3  |   0    |   3   | BPE 223           |", 10, 0

    ; Third Year - Second Semester
    SY3_S_Sem db "===SECOND SEMESTER SUBJECTS ===", 10, 0
    SY3_S_Subj1 db "| EDUC 109    | The Teaching Profession                                                         |  3  |   0    |   3   | NONE              |", 10, 0
    SY3_S_Subj2 db "| BPE 323     | Drug Education, Consumer Health Education and Healthy Eating                    |  3  |   0    |   3   | BPE 311, BPE 312  |", 10, 0
    SY3_S_Subj3 db "| BPE 322     | Process if Teaching PE & Health Education                                       |  3  |   0    |   3   | EDUC 103          |", 10, 0
    SY3_S_Subj4 db "| BPE 327     | Administration and Management of Physical Education and Health Programs         |  3  |   0    |   3   | BPE 123, BPE 312  |", 10, 0
    SY3_S_Subj5 db "| BPE 325/L   | Technology for Teaching and Learning 2 - PE and Health Education                |  3  |   0    |   3   | EDUC 103          |", 10, 0
    SY3_S_Subj6 db "| CAED 500c   | Career and Personality Development                                              |  3  |   0    |   3   | 3rd yr standing   |", 10, 0
    SY3_S_Subj7 db "| EDUC 11D    | The Teacher and the Community, School Culture and Organizational Leadership     |  2  |   0    |   2   | NONE              |", 10, 0
    SY3_S_Subj8 db "| 0PE 413     | Research in School PE 2                                                         |  3  |   0    |   3   | BPE 412           |", 10, 0

    ; Third Year - Summer
    SY3_Sum_Sem db "===SUMMER SUBJECTS ===", 10, 0
    SY3_Sum_note db "No courses available for this semester yet.", 10, 0


    ;4th Year - First Semester

    SY4_F_Sem db "===FIRST SEMESTER SUBJECTS ===", 10, 0
    SY4_F_Subj1 db "| FS 1        | Field Study 1 (1st T)                           |  3  |  0     |   3   | BPE 413 |", 10, 0
    SY4_F_Subj2 db "| FS 2        | Field Study 2 (2nd T)                           |  3  |  0     |   3   | BPE 413 |", 10, 0
    SY4_F_Subj3 db "| CA 501      | General Education                               |  5  |  0     |   5   | BPE 413 |", 10, 0
    SY4_F_Subj4 db "| CA 502      | Professional Education                          |  5  |  0     |   5   | BPE 413 |", 10, 0

   ;4th Year - Second Semester

    SY4_S_Sem db "===SECOND SEMESTER SUBJECTS ===", 10, 0
    SY4_S_Subj1 db "| CA 503      | Specialization                                  |  5  |  0     |   5   | ------- |", 10, 0
    SY4_S_Subj2 db "| ED 421      | Teaching Internship                             |  6  |  0     |   6   | ------- |", 10, 0

    ; Fourth Year - Summer
    SY4_Sum_Sem db "===SUMMER SUBJECTS ===", 10, 0
    SY4_Sum_note db "No courses available for this semester yet.", 10, 0








.data? 

    fullname db 100 dup (?)
    dummy db 100 dup (?)
    yearlevel db 100 dup (?)
    semester db 2 dup(?)

.code
main:
    invoke StdOut, addr FName
    invoke StdIn, addr fullname, 10
    invoke StdIn, addr dummy, 10
    invoke StdOut, addr YearLevel
    invoke StdIn, addr yearlevel, 10

    .if yearlevel == '1'
    invoke StdOut, addr Semester
    invoke StdIn, addr semester, 2
    
    .if semester == '1'
        invoke ClearScreen
        invoke StdOut, addr FName
        invoke StdOut, addr fullname
        invoke StdOut, addr newline
        invoke StdOut, addr Fyear
        invoke StdOut, addr Program
        invoke StdOut, addr F_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr F_Subj1
        invoke StdOut, addr F_Subj2
        invoke StdOut, addr F_Subj3
        invoke StdOut, addr F_Subj4
        invoke StdOut, addr F_Subj5
        invoke StdOut, addr F_Subj6
        invoke StdOut, addr F_Subj7
        invoke StdOut, addr F_Subj8
        invoke StdOut, addr Border
    .elseif semester == '2'
        invoke ClearScreen
        invoke StdOut, addr Fyear
        invoke StdOut, addr S_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr S_Subj1
        invoke StdOut, addr S_Subj2
        invoke StdOut, addr S_Subj3
        invoke StdOut, addr S_Subj4
        invoke StdOut, addr S_Subj5
        invoke StdOut, addr S_Subj6
        invoke StdOut, addr S_Subj7
        invoke StdOut, addr S_Subj8
        invoke StdOut, addr Border
    .elseif semester == '3'
        invoke ClearScreen
        invoke StdOut, addr Fyear
        invoke StdOut, addr Sum_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr Sum_Subj1
        invoke StdOut, addr Sum_Subj2
        invoke StdOut, addr Sum_Subj3
        invoke StdOut, addr Border
    .else
        invoke StdOut, addr InvalidMsg
    .endif

    .elseif yearlevel == '2'
    invoke StdOut, addr Semester
    invoke StdIn, addr semester, 2
    
    .if semester == '1'
        invoke ClearScreen
        invoke StdOut, addr Syear
        invoke StdOut, addr Program
        invoke StdOut, addr SY2_F_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr SY2_F_Subj1
        invoke StdOut, addr SY2_F_Subj2
        invoke StdOut, addr SY2_F_Subj3
        invoke StdOut, addr SY2_F_Subj4
        invoke StdOut, addr SY2_F_Subj5
        invoke StdOut, addr SY2_F_Subj6
        invoke StdOut, addr SY2_F_Subj7
        invoke StdOut, addr SY2_F_Subj8
        invoke StdOut, addr SY2_F_Subj9
        invoke StdOut, addr Border
    .elseif semester == '2'
        invoke ClearScreen
        invoke StdOut, addr Syear
        invoke StdOut, addr Program
        invoke StdOut, addr SY2_S_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr SY2_S_Subj1
        invoke StdOut, addr SY2_S_Subj2
        invoke StdOut, addr SY2_S_Subj3
        invoke StdOut, addr SY2_S_Subj4
        invoke StdOut, addr SY2_S_Subj5
        invoke StdOut, addr SY2_S_Subj6
        invoke StdOut, addr SY2_S_Subj7
        invoke StdOut, addr SY2_S_Subj8
        invoke StdOut, addr Border
    .elseif semester == '3'
        invoke ClearScreen
        invoke StdOut, addr Syear
        invoke StdOut, addr Program
        invoke StdOut, addr SY2_Sum_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr SY2_Sum_Subj1
        invoke StdOut, addr SY2_Sum_Subj2
        invoke StdOut, addr SY2_Sum_Subj3
        invoke StdOut, addr Border
    .else
        invoke StdOut, addr InvalidMsg
    .endif
    .elseif yearlevel == '3'
    invoke StdOut, addr Semester
    invoke StdIn, addr semester, 2

    .if semester == '1'
        invoke ClearScreen
        invoke StdOut, addr Tyear
        invoke StdOut, addr Program
        invoke StdOut, addr SY3_F_Sem
        invoke StdOut, addr Border3
        invoke StdOut, addr TableHeader3
        invoke StdOut, addr Border3
        invoke StdOut, addr SY3_F_Subj1
        invoke StdOut, addr SY3_F_Subj2
        invoke StdOut, addr SY3_F_Subj3
        invoke StdOut, addr SY3_F_Subj4
        invoke StdOut, addr SY3_F_Subj5
        invoke StdOut, addr SY3_F_Subj6
        invoke StdOut, addr SY3_F_Subj7
        invoke StdOut, addr SY3_F_Subj8
        invoke StdOut, addr SY3_F_Subj9
        invoke StdOut, addr Border3
    .elseif semester == '2'
        invoke ClearScreen
        invoke StdOut, addr Tyear
        invoke StdOut, addr Program
        invoke StdOut, addr SY3_S_Sem
        invoke StdOut, addr Border2
        invoke StdOut, addr TableHeader2
        invoke StdOut, addr Border2
        invoke StdOut, addr SY3_S_Subj1
        invoke StdOut, addr SY3_S_Subj2
        invoke StdOut, addr SY3_S_Subj3
        invoke StdOut, addr SY3_S_Subj4
        invoke StdOut, addr SY3_S_Subj5
        invoke StdOut, addr SY3_S_Subj6
        invoke StdOut, addr SY3_S_Subj7
        invoke StdOut, addr SY3_S_Subj8
        invoke StdOut, addr Border2
    .elseif semester == '3'
        invoke ClearScreen
        invoke StdOut, addr Tyear
        invoke StdOut, addr Program
        invoke StdOut, addr SY3_Sum_Sem
        invoke StdOut, addr SY3_Sum_note
    .else
        invoke StdOut, addr InvalidMsg
    .endif

    .elseif yearlevel == '4'
    invoke StdOut, addr Semester
    invoke StdIn, addr semester, 2

    .if semester == '1'
        invoke ClearScreen
        invoke StdOut, addr fyear
        invoke StdOut, addr Program
        invoke StdOut, addr SY4_F_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr SY4_F_Subj1
        invoke StdOut, addr SY4_F_Subj2
        invoke StdOut, addr SY4_F_Subj3
        invoke StdOut, addr SY4_F_Subj4
        invoke StdOut, addr Border
    .elseif semester == '2'
        invoke ClearScreen
        invoke StdOut, addr fyear
        invoke StdOut, addr Program
        invoke StdOut, addr SY4_S_Sem
        invoke StdOut, addr Border
        invoke StdOut, addr TableHeader
        invoke StdOut, addr Border
        invoke StdOut, addr SY4_S_Subj1
        invoke StdOut, addr SY4_S_Subj2
        invoke StdOut, addr Border
    .elseif semester == '3'
        invoke ClearScreen
        invoke StdOut, addr fyear
        invoke StdOut, addr Program
        invoke StdOut, addr SY4_Sum_Sem
        invoke StdOut, addr SY4_Sum_note
    .else
        invoke StdOut, addr InvalidMsg
    .endif

    .endif
    invoke ExitProcess, 0
end main