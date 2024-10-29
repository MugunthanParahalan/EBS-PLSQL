/* Standard EBS API to reset password */

/** Placeholders 

:USERNAME - Username from fnd_user table
:NEWPASSWORD - Password to be reset

 **/


DECLARE
    v_username varchar2(100) := :USERNAME;
    v_password varchar2(100) := :NEWPASSWORD;
    v_result boolean;

BEGIN
    
    --Leveraging fnd_user_pkg to change password 
    v_result := fnd_user_pkg.ChangePassword (username => v_username, 
                                             newpassword => v_password 
                                             );
                                              
    IF v_result THEN
        dbms_output.put_line('Password reset Successfully for the user '||v_username);
        COMMIT;
    ELSE
        dbms_output.put_line('Unable to reset password for the user '||v_username||' due to '||SQLCODE||' '||SUBSTR(SQLERRM, 1, 100));
        ROLLBACK;
    END IF;
END;


