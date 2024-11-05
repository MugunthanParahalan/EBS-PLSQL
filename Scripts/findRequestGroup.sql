/* Query to find the request group of a responsibility */

select frg.request_group_name , frg.request_group_code 
from fnd_request_groups frg ,
     fnd_responsibility_vl frv
where frg.request_group_id = frv.request_group_id
and frv.responsibility_name = :RESP_NAME;

/*PLACEHOLDER
:RESP_NAME - Name of the responsibility
*/
