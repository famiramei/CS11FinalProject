
.DATA
    newline db 10,13,0
    selection db "[1] 1st Year [2] 2nd Year [3] 3rd Year [4] 4th Year", 10, 0
    FName db "Full Name: ", 0
    Fyear db "First Year ",10, 0
    Syear db "Second Year", 10, 0
    Tyear db "Third Year",10, 0
    fyear db "Fourth Year", 10, 0
    YearLevel db "Select year level: ", 0
    prospectus db 9,9,9,9,9,9, "BACHELOR OF PHYSICAL EDUCATION PROSPECTUS", 10, 0
    Sname db "Student's Name  :   ", 0
    Program db "Program/Course  :   BACHELOR OF PHYSICAL EDUCATION", 10, 0
    semSelect db "[1] First [2] Second [3] Summer", 10,0
    Semester db "Select Semester: ", 0
    InvalidMsg db "Invalid input!", 10, 0
    inputSubject db 10, 10,"Input Subject Key: ", 0

    ; Table Border
    Border db "+-------------+-------------------------------------------------------------------------------+-----+--------+-------+-------------------+", 10, 0
    TableHeader db "| Subject Code| Subject Title                                                                 | Lec |   Lab  | Total |       PreReq      |", 10, 0
                                            

    ; First Semester
    F_Sem db "|> 1st Year/ 1st Sem                                                                                                                     |", 10, 0
    F_Subj1 db "| GE 2        | Purposive Communication w/ Interactive Learning                               |  6  |   0    |   6   |  NONE             |", 10, 0
    F_Subj2 db "| GE 1        | Understanding the Self                                                        |  3  |   0    |   3   |  NONE             |", 10, 0
    F_Subj3 db "| GE 4        | Mathematics in the Modern World                                               |  3  |   0    |   3   |  NONE             |", 10, 0
    F_Subj4 db "| GE 20       | Reading Visual Arts                                                           |  3  |   0    |   3   |  NONE             |", 10, 0
    F_Subj5 db "| BPE 111     | Philosophical & Socio-anthropological Found.                                  |  3  |   0    |   3   |  NONE             |", 10, 0
    F_Subj6 db "| GE 15       | Environmental Science                                                         |  3  |   0    |   3   |  NONE             |", 10, 0
    F_Subj7 db "| PANF 1      | Movement Competency Training                                                  |  2  |   0    |   2   |  NONE             |", 10, 0
    F_Subj8 db "| NSTP 1      | National Service Training Program 1                                           |  3  |   0    |   3   |  NONE             |", 10, 0
    total db "|             |                                                                    TOTAL UNITS|  26 |   0    |   26  |                   |", 10, 0

    ; Second Semester
    S_Sem db "|> 1st Year/ 2nd Sem                                                                                                                     |", 10, 0
    S_Subj1 db "| UGE 1       | Reading Comprehension                                                         |  6  |   0    |   6   |  GE 2             |", 10, 0
    S_Subj2 db "| GE 3        | The Contemporary World                                                        |  3  |   0    |   3   |  NONE             |", 10, 0
    S_Subj3 db "| EDUC 101    | The Child & Adolescent Learner & Learning                                     |  3  |   0    |   3   |  NONE             |", 10, 0
    S_Subj4 db "| GE 6        | Rizal's Life and Works                                                        |  3  |   0    |   3   |  NONE             |", 10, 0
    S_Subj5 db "| BPE 112     | Anatomy & Physiology of Human Movement                                        |  3  |   0    |   3   |  NONE             |", 10, 0
    S_Subj6 db "| BPE 113     | Principles Motor Control & Learning                                           |  3  |   0    |   3   |  NONE             |", 10, 0
    S_Subj7 db "| PANF 2      | Exercise-based Fitness Activities                                             |  2  |   0    |   2   |  PANF 1           |", 10, 0
    S_Subj8 db "| NSTP 2      | National Service Training Program 2                                           |  3  |   0    |   3   |  NSTP 1           |", 10, 0

    ; Summer Semester
    Sum_Sem db "|> 1st Year/ Summer                                                                                                                      |", 10, 0
    Sum_Subj1 db "| BPE 122     | Applied Motor Control & Learning of Exercise                                  |  3  |    0   |   3   | BPE 113           |", 10, 0
    Sum_Subj2 db "| BPE 123     | Individual & Dual Sports                                                      |  3  |    0   |   3   | BPE 113           |", 10, 0
    Sum_Subj3 db "| BPE 121     | Physiology of Exercise & Physical Activity                                    |  3  |    0   |   3   | BPE 112           |", 10, 0
    total_sum db "|             |                                                                    TOTAL UNITS|  9  |    0   |   9   |                   |", 10, 0

    ;Second Year - First Semester

    SY2_F_Sem db "|> 2nd Year/ 1st Sem                                                                                                                     |", 10, 0
    SY2_F_Subj1 db "| LP 100      | Strategic Lesson Planning and Design                                          |  3  |  0     |   3   | NONE              |", 10, 0
    SY2_F_Subj2 db "| BPE 213     | Philippine Traditional Games and Sports                                       |  3  |  0     |   3   | NONE              |", 10, 0
    SY2_F_Subj3 db "| GE 7        | Art Appreciation                                                              |  3  |  0     |   3   | NONE              |", 10, 0
    SY2_F_Subj4 db "| EDUC 102    | Technology for Teaching and Learning 1                                        |  3  |  0     |   3   | NONE              |", 10, 0
    SY2_F_Subj5 db "| BPE 211     | Movement Education                                                            |  3  |  0     |   3   | BPE 113           |", 10, 0
    SY2_F_Subj6 db "| BPE 212     | Philippine Traditional Dances                                                 |  3  |  0     |   3   | BPE 113           |", 10, 0
    SY2_F_Subj7 db "| GE 11       | The Entrepreneurial Mind                                                      |  2  |  0     |   2   | NONE              |", 10, 0
    SY2_F_Subj8 db "| EDUC 105    | Assessment of Learning 1                                                      |  3  |  0     |   3   | NONE              |", 10, 0
    SY2_F_Subj9 db "| PANF 3      | Dance and Sports 1                                                            |  3  |  0     |   3   | PANF 2            |", 10, 0

    ; Second Year - Second Semester
    SY2_S_Sem db "|> 2nd Year/ 2nd Sem                                                                                                                     |", 10, 0
    SY2_S_Subj1 db "| GE 5        | Science, Technology, and Society                                              |  3  |  0     |   3   | NONE              |", 10, 0
    SY2_S_Subj2 db "| EDUC 107    | Assessment of Learning 2                                                      |  3  |  0     |   3   | EDUC 105          |", 10, 0
    SY2_S_Subj3 db "| EDUC 103    | Facilitating Learner-centered Teaching                                        |  3  |  0     |   3   | EDUC 101          |", 10, 0
    SY2_S_Subj4 db "| EDUC 104    | Foundations of Special and Inclusive Education                                |  3  |  0     |   3   | NONE              |", 10, 0
    SY2_S_Subj5 db "| EDUC 106    | The Teacher and the School Curriculum                                         |  3  |  0     |   3   | NONE              |", 10, 0
    SY2_S_Subj6 db "| BPE 221     | International Dance and Other Forms                                           |  3  |  0     |   3   | BPE 212           |", 10, 0
    SY2_S_Subj7 db "| GE 8        | Readings in Philippine History                                                |  2  |  0     |   2   | NONE              |", 10, 0
    SY2_S_Subj8 db "| BPE 223     | Emergency Preparedness and Safety Management                                  |  3  |  0     |   3   | BPE 122           |", 10, 0
    SY2_S_Subj9 db "| PANF 4      | Dance and Sports 2                                                            |  3  |  0     |   3   | PANF 3            |", 10, 0

    ; Second Year - Summer
    SY2_Sum_Sem db "|> 2nd Year/ Summer                                                                                                                      |", 10, 0
    SY2_Sum_Subj1 db "| BPE 222     | Swimming and Aquatics                                                         |  3  |  0     |   3   | BPE 223           |", 10, 0
    SY2_Sum_Subj2 db "| BPE 224     | Art in the K-12 Curriculum                                                    |  3  |  0     |   3   | EDUC103           |", 10, 0
    SY2_Sum_Subj3 db "| BPE 313     | Sports and Exercise Psychology                                                |  3  |  0     |   3   | BPE 112           |", 10, 0

    ;Third Year - First Semester

    SY3_F_Sem db "|> 3rd Year/ 1st Sem                                                                                                                     |", 10, 0
    SY3_F_Subj1 db "| FIL 215     | Malayuning Komunikasyon sa Wikang Filipino                                    |  3  |   0    |   3   | NONE              |", 10, 0
    SY3_F_Subj2 db "| GE 9        | Ethics (Disciplinal)                                                          |  3  |   0    |   3   | NONE              |", 10, 0
    SY3_F_Subj3 db "| BPE 321     | Team Sports                                                                   |  3  |   0    |   3   | BPE 123           |", 10, 0
    SY3_F_Subj4 db "| BPE 312     | Personal, Community and Environmental Health                                  |  3  |   0    |   3   | NONE              |", 10, 0
    SY3_F_Subj5 db "| BPE 324     | Curriculum and Assessment for Physical Education and Health Education         |  3  |   0    |   3   | EDUC 105, EDUC 106|", 10, 0
    SY3_F_Subj6 db "| BPE 315     | Music in the K-12 Curriculum                                                  |  3  |   0    |   3   | EDUC 103          |", 10, 0
    SY3_F_Subj7 db "| BPE 412     | Research in School PE 1                                                       |  3  |   0    |   3   | EDUC 107          |", 10, 0
    SY3_F_Subj8 db "| EDUC 108    | Building and Enhancing New Literacies Across the Curriculum                   |  3  |   0    |   3   | NONE              |", 10, 0
    SY3_F_Subj9 db "| BPE 311     | Coordinated School Health Program                                             |  3  |   0    |   3   | BPE 223           |", 10, 0
    SY3_total_1 db "|             |                                                                    TOTAL UNITS|  27 |   0    |   27  |                   |", 10, 0

    ; Third Year - Second Semester
    SY3_S_Sem db "|> 3rd Year/ 2nd Sem                                                                                                                     |", 10, 0
    SY3_S_Subj1 db "| EDUC 109    | The Teaching Profession                                                       |  3  |   0    |   3   | NONE              |", 10, 0
    SY3_S_Subj2 db "| BPE 323     | Drug Education, Consumer Health Education and Healthy Eating                  |  3  |   0    |   3   | BPE 311, BPE 312  |", 10, 0
    SY3_S_Subj3 db "| BPE 322     | Process if Teaching PE & Health Education                                     |  3  |   0    |   3   | EDUC 103          |", 10, 0
    SY3_S_Subj4 db "| BPE 327     | Administration and Management of Physical Education and Health Programs       |  3  |   0    |   3   | BPE 123, BPE 312  |", 10, 0
    SY3_S_Subj5 db "| BPE 325/L   | Technology for Teaching and Learning 2 - PE and Health Education              |  3  |   0    |   3   | EDUC 103          |", 10, 0
    SY3_S_Subj6 db "| CAED 500c   | Career and Personality Development                                            |  3  |   0    |   3   | 3rd yr standing   |", 10, 0
    SY3_S_Subj7 db "| EDUC 11D    | The Teacher and the Community, School Culture and Organizational Leadership   |  2  |   0    |   2   | NONE              |", 10, 0
    SY3_S_Subj8 db "| 0PE 413     | Research in School PE 2                                                       |  3  |   0    |   3   | BPE 412           |", 10, 0
    SY3_total_2 db "|             |                                                                    TOTAL UNITS|  23 |   1    |   24  |                   |", 10, 0

    ; Third Year - Summer
    SY3_Sum_Sem db "===SUMMER SUBJECTS ===", 10, 0
    SY3_Sum_note db "No courses available for this semester yet.", 10, 0


    ;4th Year - First Semester

    SY4_F_Sem db "|> 4th Year/ 1st Sem                                                                                                                     |", 10, 0
    SY4_F_Subj1 db "| FS 1        | Field Study 1 (1st T)                                                         |  3  |  0     |   3   | BPE 413           |", 10, 0
    SY4_F_Subj2 db "| FS 2        | Field Study 2 (2nd T)                                                         |  3  |  0     |   3   | BPE 413           |", 10, 0
    SY4_F_Subj3 db "| CA 501      | General Education                                                             |  5  |  0     |   5   | BPE 413           |", 10, 0
    SY4_F_Subj4 db "| CA 502      | Professional Education                                                        |  5  |  0     |   5   | BPE 413           |", 10, 0
    SY4_total_1 db "|             |                                                                    TOTAL UNITS|  16 |  0     |   16  |                   |", 10, 0

   ;4th Year - Second Semester

    SY4_S_Sem db "|> 4th Year/ 2nd Sem                                                                                                                     |", 10, 0
    SY4_S_Subj1 db "| CA 503      | Specialization                                                                |  5  |  0     |   5   |       -------     |", 10, 0
    SY4_S_Subj2 db "| ED 421      | Teaching Internship                                                           |  6  |  0     |   6   |       -------     |", 10, 0
    SY4_total_2 db "|             |                                                                    TOTAL UNITS|  11 |  0     |   11  |                   |", 10, 0


    ; Fourth Year - Summer
    SY4_Sum_Sem db "===SUMMER SUBJECTS ===", 10, 0
    SY4_Sum_note db "No courses available for this semester yet.", 10, 0

    selection1 db 10, 9, "| A - GE 2     | B - GE 1    | C - GE 4     | D - GE 20   |", 0
    selection2 db 10, 9, "| E - BPE 111  | F - GE 15   | G - PANF 1   | H - NSTP 1  |", 0

    Sselection1 db 10, 9, "| A - UGE 1     | B - GE 3      | C - EDUC 101   | D - GE 6   |", 0
    Sselection2 db 10, 9, "| E - BPE 112   | F - BPE 113   | G - PANF 2     | H - NSTP 2 |", 0

    Sumselection1 db 10, 9, "| A - BPE 122  | B - BPE 123  | C - BPE 121  |", 0

    S_selection1 db 10, 9, "| A - LP 100    |  B - BPE 213     | C - GE 7    |", 0
    S_selection2 db 10, 9, "| D - EDUC 102  |  E - BPE 211     | F - BPE 212 |", 0
    S_selection3 db 10, 9, "| G - GE 11     |  H - EDUC 105    | I - PANF 3  |", 0

    S2_selection1 db 10, 9, "| A - GE 5      |  B - EDUC 107   | C - EDUC 103  |", 0
    S2_selection2 db 10, 9, "| D - EDUC 104  |  E - EDUC 106   | F - BPE 221   |", 0
    S2_selection3 db 10, 9, "| G - GE 8      |  H - BPE 223    | I - PANF 4    |", 0

    S_Sumselection1 db 10, 9, "| A - BPE 222  | B - BPE 224  | C - BPE 313  |", 0

    T_selection1 db 10, 9, "| A - FIL 215   |  B - GE 9      | C - BPE 321  |", 0
    T_selection2 db 10, 9, "| D - BPE 312   |  E - BPE 324   | F - BPE 315  |", 0
    T_selection3 db 10, 9, "| G - BPE 412   |  H - EDUC 108  | I - BPE 311  |", 0

    T2_selection1 db 10, 9, "| A - EDUC 109   | B - BPE 323    | C - BPE 322    | D - BPE 327  |", 0
    T2_selection2 db 10, 9, "| E - BPE 325/L  | F - CAED 500c  | G - EDUC 11D   | H - 0PE 413  |", 0

    F_selection1 db 10, 9, "| A - FS 1  | B - FS 2  | C - CA 501  | D - CA 502 |", 0
    F2_selection1 db 10, 9, "| A - CA 503  | B - ED 421 |", 0

    totalUnits db "|             |                                                                    TOTAL UNITS|  ", 0
    totalUnitsBorder db "                                      |", 10, 0


    inputSubjects1 dd offset F_Subj1, offset F_Subj2, offset F_Subj3, offset F_Subj4, offset F_Subj5, offset F_Subj6, offset F_Subj7, offset F_Subj8
    inputSubjects2 dd offset S_Subj1, offset S_Subj2, offset S_Subj3, offset S_Subj4, offset S_Subj5, offset S_Subj6, offset S_Subj7, offset S_Subj8
    inputSubjects3 dd offset Sum_Subj1, offset Sum_Subj2, offset Sum_Subj3
    inputSubjects4 dd offset SY2_F_Subj1, offset SY2_F_Subj2, offset SY2_F_Subj3, offset SY2_F_Subj4, offset SY2_F_Subj5, offset SY2_F_Subj6, offset SY2_F_Subj7, offset SY2_F_Subj8, offset SY2_F_Subj9
    inputSubjects5 dd offset SY2_S_Subj1, offset SY2_S_Subj2, offset SY2_S_Subj3, offset SY2_S_Subj4, offset SY2_S_Subj5, offset SY2_S_Subj6, offset SY2_S_Subj7, offset SY2_S_Subj8, offset SY2_S_Subj9
    inputSubjects6 dd offset SY2_Sum_Subj1, offset SY2_Sum_Subj2, offset SY2_Sum_Subj3
    inputSubjects7 dd offset SY3_F_Subj1, offset SY3_F_Subj2, offset SY3_F_Subj3, offset SY3_F_Subj4, offset SY3_F_Subj5, offset SY3_F_Subj6, offset SY3_F_Subj7, offset SY3_F_Subj8, offset SY3_F_Subj9
    inputSubjects8 dd offset SY3_S_Subj1, offset SY3_S_Subj2, offset SY3_S_Subj3, offset SY3_S_Subj4, offset SY3_S_Subj5, offset SY3_S_Subj6, offset SY3_S_Subj7, offset SY3_S_Subj8
    inputSubjects9 dd offset SY4_F_Subj1, offset SY4_F_Subj2, offset SY4_F_Subj3, offset SY4_F_Subj4
    inputSubjects10 dd offset SY4_S_Subj1, offset SY4_S_Subj2

    addSubject db 10, "[1] Add Another Subject", 10, 0
    enrollCourse db "[2] Submit Enrollment", 10, 0
    return db 10, "[1] Return", 10, 0
    again db 10, "[1] Enroll new student", 10, 0
    exits db "[2] Exit", 10, 0
    pick db "Select: ", 0
    congrats db 10, 10, 9, 9, 9, 9,9,9, "YOU ARE OFFICIALLY ENROLLED!", 0
    congrats2 db 10, 9, 9, 9, 9,9, "Welcome to the UNIVERSITY OF MINDANAO!", 0
    logout db 10, 10, 9, 9, 9, 9,9,9,9, "Student Account Logged Out.", 0

    tempoSub db 100 dup(?)

    year11 db "Year/Semester   :   1st Year/ 1st Semester", 0
    year12 db "Year/Semester   :   1st Year/ 2nd Semester", 0
    year13 db "Year/Semester   :   1st Year/ Summer", 0
    year21 db "Year/Semester   :   2nd Year/ 1st Semester", 0
    year22 db "Year/Semester   :   2nd Year/ 2nd Semester", 0
    year23 db "Year/Semester   :   2nd Year/ Summer", 0
    year31 db "Year/Semester   :   3rd Year/ 1st Semester", 0
    year32 db "Year/Semester   :   3rd Year/ 2nd Semester", 0
    year41 db "Year/Semester   :   4th Year/ 1st Semester", 0
    year42 db "Year/Semester   :   4th Year/ 2nd Semester", 0

    
    selSubject db 100 dup(?)
    blank db 0 dup(?)
    options db 100 dup(?)
    fullname db 100 dup (?)
    dummy db 100 dup (?)
    yearlevel db 100 dup (?)
    semester db 2 dup(?)
    index dd 0
    subS11 dd 6, 3, 3, 3, 3, 3, 2, 3
    subS12 dd 6, 3, 3, 3, 3, 3, 2, 3
    subSS1 dd 3, 3, 3
    subS21 dd 3, 3, 3, 3, 3, 3, 2, 3, 3
    subS22 dd 3, 3, 3, 3, 3, 3, 2, 3, 3
    subSS2 dd 3, 3, 3
    subS31 dd 3, 3, 3, 3, 3, 3, 3, 3, 3
    subS32 dd 3, 3, 3, 3, 3, 3, 2, 3
    subS41 dd 3, 3, 5, 5
    subS42 dd 5, 6

    totalUnitsEnrolled dd 0
    tempTotalUnitsEnrolled db 100 dup(?)
    invalidInputMsg db 10, 10, 9, "INVALID! Please enter the valid subject letter.", 10, 0
    limitedUnitsMsg db 10, 10, 9, "MAX UNITS REACHED! Enter subject letters again.", 10, 0
    duplicateMsg db 10, 10, 9, "Error: Subject already enrolled!", 0