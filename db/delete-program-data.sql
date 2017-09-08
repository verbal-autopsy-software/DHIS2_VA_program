-- Get all event IDs
CREATE OR REPLACE VIEW va_events_VIEW AS
  SELECT programstageinstanceid
  FROM programstageinstance
  WHERE programstageid = (SELECT programstageid FROM programstage
                            WHERE programid IN (SELECT programid FROM program WHERE uid = 'sv91bCroFFx'));
  
-- delete events and their data values
DELETE FROM trackedentitydatavalueaudit WHERE programstageinstanceid IN (SELECT * FROM va_events_VIEW);
DELETE FROM trackedentitydatavalue WHERE programstageinstanceid IN (SELECT * FROM va_events_VIEW);
DELETE FROM programstageinstance_messageconversation WHERE programstageinstanceid IN (SELECT * FROM va_events_VIEW);
DELETE FROM programstageinstancecomments WHERE programstageinstanceid IN (SELECT * FROM va_events_VIEW);
DELETE FROM programstageinstance WHERE programstageinstanceid IN (SELECT * FROM va_events_VIEW);
DROP VIEW va_events_VIEW;
