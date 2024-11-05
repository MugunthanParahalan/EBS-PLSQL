/* Query to list all responsibilities that are assigned to the user */

select frt.responsibility_name as "Responsibility", 
       frt.description as "Description",
       (select user_name from fnd_user where user_id = furg.created_by) as "Assigned By", 
       (select user_name from fnd_user where user_id = furg.last_updated_by) as "Last Updated By"
from fnd_user_resp_groups_direct furg,
     fnd_responsibility_tl frt,
     fnd_user fu
where furg.user_id = fu.user_id
and furg.responsibility_id = frt.responsibility_id
and sysdate between furg.start_date and nvl(furg.end_date , sysdate+1)
and frt.language = 'US'
and fu.user_name = :USERNAME;


/* PLACEHOLDER
:USERNAME - Username as in fnd_user table
*/
