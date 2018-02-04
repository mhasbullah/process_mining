###############THE BEST 3-FEB-2017##################
SELECT l.id, l.timecreated, 
l.objectid AS module_id,
l.action AS module_action, 
l.target AS module_name, 
l.COMPONENT,
l.EVENTNAME,
REPLACE(l.EVENTNAME,'\\','_') AS EVENTNAME_2,
FROM_UNIXTIME(l.timecreated) as TIMESTAMP,
U.USERNAME AS `USERNAME`,
CONCAT_WS(' ', l.action, l.target, l.COMPONENT) AS `STUDENT_EVENT`
FROM mdl_logstore_standard_log AS l
LEFT JOIN MDL_USER AS U ON U.ID = l.USERID 
WHERE (FROM_UNIXTIME(l.timecreated) >= '2017-01-01 00:00:00' and FROM_UNIXTIME(l.timecreated) <= '2018-12-31 00:00:00')
####Course ID
AND  l.courseid = 2
order by l.timecreated desc;
#########################################