-- Get all program stage instance ids
CREATE OR REPLACE VIEW stages_VIEW AS
  SELECT programstageinstanceid
  FROM programstageinstance
  WHERE programstageid = (SELECT programstageid FROM programstage
                            WHERE programid IN (SELECT programid FROM program WHERE uid = 'nrEVPTOQoze'));

-- delete events and their data values
DELETE FROM trackedentitydatavalueaudit WHERE programstageinstanceid IN (SELECT * FROM stages_VIEW);
DELETE FROM trackedentitydatavalue WHERE programstageinstanceid IN (SELECT * FROM stages_VIEW);
DELETE FROM programstageinstance_messageconversation WHERE programstageinstanceid IN (SELECT * FROM stages_VIEW);
DELETE FROM programstageinstancecomments WHERE programstageinstanceid IN (SELECT * FROM stages_VIEW);
DELETE FROM programstageinstance WHERE programstageinstanceid IN (SELECT * FROM stages_VIEW);
DROP VIEW stages_VIEW;

-- get program id
CREATE OR REPLACE VIEW program_id_VIEW AS
	SELECT programid FROM program WHERE uid = 'nrEVPTOQoze';
	
-- get tracked entity & program instance id   
SELECT trackedentityinstanceid INTO entity_instance_ids FROM programinstance WHERE programid IN (SELECT * FROM program_id_VIEW);
SELECT programinstanceid INTO program_instance_ids FROM programinstance WHERE programid IN (SELECT * FROM program_id_VIEW);
	
-- delete entity attributes
DELETE FROM trackedentityattributevalue WHERE trackedentityinstanceid IN (SELECT * FROM entity_instance_ids); 
DELETE FROM trackedentityattributevalueaudit WHERE trackedentityinstanceid IN (SELECT * FROM entity_instance_ids); 

-- delete program enrollments
DELETE FROM programinstance_messageconversation WHERE programinstanceid IN (SELECT * FROM program_instance_ids);
DELETE FROM programinstanceaudit WHERE programinstanceid IN (SELECT * FROM program_instance_ids); 
DELETE FROM programinstancecomments WHERE programinstanceid IN (SELECT * FROM program_instance_ids);
DELETE FROM programinstance WHERE programid IN (SELECT * FROM program_id_VIEW); 

-- delete entity instances
DELETE FROM trackedentityprogramowner WHERE trackedentityinstanceid IN (SELECT * FROM entity_instance_ids); 
DELETE FROM trackedentityinstance WHERE trackedentityinstanceid IN (SELECT * FROM entity_instance_ids);  

-- drop support tables
DROP TABLE program_instance_ids;
DROP TABLE entity_instance_ids;
DROP VIEW program_id_VIEW;