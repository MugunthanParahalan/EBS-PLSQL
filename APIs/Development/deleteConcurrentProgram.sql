/*Deletes a Concurrent Program*/

BEGIN
fnd_program.delete_program(:PROGRAM_SHORT_NAME , :APPLICATION_NAME);
COMMIT;
END;

/*
Placeholders

:PROGRAM_SHORT_NAME - Short name of the concurrent program to be deleted
:APPLICATION_NAME - Applcation name on which the concurrent Program is registered. (Eg. Projects , Receivables etc)

*/
