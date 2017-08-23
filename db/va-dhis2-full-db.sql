--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attribute; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE attribute (
    attributeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    valuetype character varying(50) NOT NULL,
    mandatory boolean NOT NULL,
    isunique boolean,
    dataelementattribute boolean NOT NULL,
    dataelementgroupattribute boolean,
    indicatorattribute boolean NOT NULL,
    indicatorgroupattribute boolean,
    datasetattribute boolean,
    organisationunitattribute boolean NOT NULL,
    organisationunitgroupattribute boolean,
    organisationunitgroupsetattribute boolean,
    userattribute boolean NOT NULL,
    usergroupattribute boolean,
    programattribute boolean,
    programstageattribute boolean,
    trackedentityattribute boolean,
    trackedentityattributeattribute boolean,
    categoryoptionattribute boolean,
    categoryoptiongroupattribute boolean,
    documentattribute boolean,
    optionattribute boolean,
    optionsetattribute boolean,
    constantattribute boolean,
    legendsetattribute boolean,
    programindicatorattribute boolean,
    sqlviewattribute boolean,
    sectionattribute boolean,
    categoryoptioncomboattribute boolean,
    sortorder integer,
    optionsetid integer
);


--
-- Name: attributetranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE attributetranslations (
    attributeid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: attributevalue; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE attributevalue (
    attributevalueid integer NOT NULL,
    created timestamp without time zone,
    lastupdated timestamp without time zone,
    value text,
    attributeid integer NOT NULL
);


--
-- Name: categories_categoryoptions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categories_categoryoptions (
    categoryid integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptionid integer NOT NULL
);


--
-- Name: categorycombo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categorycombo (
    categorycomboid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    datadimensiontype character varying(255) NOT NULL,
    skiptotal boolean NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: categorycombos_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categorycombos_categories (
    categoryid integer,
    sort_order integer NOT NULL,
    categorycomboid integer NOT NULL
);


--
-- Name: categorycombos_optioncombos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categorycombos_optioncombos (
    categoryoptioncomboid integer NOT NULL,
    categorycomboid integer NOT NULL
);


--
-- Name: categorycombotranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categorycombotranslations (
    categorycomboid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: categorycombousergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categorycombousergroupaccesses (
    categorycomboid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: categorydimension; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categorydimension (
    categorydimensionid integer NOT NULL,
    categoryid integer
);


--
-- Name: categorydimension_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categorydimension_items (
    categorydimensionid integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptionid integer NOT NULL
);


--
-- Name: categoryoption_organisationunits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categoryoption_organisationunits (
    organisationunitid integer NOT NULL,
    categoryoptionid integer NOT NULL
);


--
-- Name: categoryoptioncombo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categoryoptioncombo (
    categoryoptioncomboid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name text,
    ignoreapproval boolean
);


--
-- Name: categoryoptioncomboattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categoryoptioncomboattributevalues (
    categoryoptioncomboid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: categoryoptioncombos_categoryoptions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categoryoptioncombos_categoryoptions (
    categoryoptionid integer NOT NULL,
    categoryoptioncomboid integer NOT NULL
);


--
-- Name: categoryoptioncombotranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categoryoptioncombotranslations (
    categoryoptioncomboid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: categoryoptiongroup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categoryoptiongroup (
    categoryoptiongroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    datadimensiontype character varying(255),
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: categoryoptiongroupattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categoryoptiongroupattributevalues (
    categoryoptiongroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: categoryoptiongroupmembers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categoryoptiongroupmembers (
    categoryoptiongroupid integer NOT NULL,
    categoryoptionid integer NOT NULL
);


--
-- Name: categoryoptiongroupset; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categoryoptiongroupset (
    categoryoptiongroupsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    datadimension boolean NOT NULL,
    datadimensiontype character varying(255),
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: categoryoptiongroupsetmembers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categoryoptiongroupsetmembers (
    categoryoptiongroupid integer NOT NULL,
    categoryoptiongroupsetid integer NOT NULL,
    sort_order integer NOT NULL
);


--
-- Name: categoryoptiongroupsettranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categoryoptiongroupsettranslations (
    categoryoptiongroupsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: categoryoptiongroupsetusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categoryoptiongroupsetusergroupaccesses (
    categoryoptiongroupsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: categoryoptiongrouptranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categoryoptiongrouptranslations (
    categoryoptiongroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: categoryoptiongroupusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categoryoptiongroupusergroupaccesses (
    categoryoptiongroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: categoryoptiontranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categoryoptiontranslations (
    categoryoptionid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: chart; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chart (
    chartid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    domainaxislabel character varying(255),
    rangeaxislabel character varying(255),
    type character varying(40) NOT NULL,
    series character varying(255),
    category character varying(255),
    hidelegend boolean,
    regressiontype character varying(40) NOT NULL,
    hidetitle boolean,
    hidesubtitle boolean,
    targetlinevalue double precision,
    targetlinelabel character varying(255),
    baselinevalue double precision,
    baselinelabel character varying(255),
    relativeperiodsid integer,
    userorganisationunit boolean,
    userorganisationunitchildren boolean,
    userorganisationunitgrandchildren boolean,
    aggregationtype character varying(40),
    completedonly boolean,
    title character varying(255),
    subtitle character varying(255),
    showdata boolean,
    hideemptyrows boolean,
    rangeaxismaxvalue double precision,
    rangeaxisminvalue double precision,
    rangeaxissteps integer,
    rangeaxisdecimals integer,
    sortorder integer,
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: chart_categorydimensions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chart_categorydimensions (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    categorydimensionid integer NOT NULL
);


--
-- Name: chart_categoryoptiongroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chart_categoryoptiongroups (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptiongroupid integer NOT NULL
);


--
-- Name: chart_datadimensionitems; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chart_datadimensionitems (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    datadimensionitemid integer NOT NULL
);


--
-- Name: chart_dataelementgroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chart_dataelementgroups (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    dataelementgroupid integer NOT NULL
);


--
-- Name: chart_filters; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chart_filters (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    filter character varying(255)
);


--
-- Name: chart_itemorgunitgroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chart_itemorgunitgroups (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


--
-- Name: chart_organisationunits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chart_organisationunits (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    organisationunitid integer NOT NULL
);


--
-- Name: chart_orgunitgroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chart_orgunitgroups (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


--
-- Name: chart_orgunitlevels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chart_orgunitlevels (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitlevel integer
);


--
-- Name: chart_periods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chart_periods (
    chartid integer NOT NULL,
    sort_order integer NOT NULL,
    periodid integer NOT NULL
);


--
-- Name: charttranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE charttranslations (
    chartid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: chartusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chartusergroupaccesses (
    chartid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: color; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE color (
    colorid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    color character varying(255)
);


--
-- Name: colorset; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE colorset (
    colorsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL
);


--
-- Name: colorset_colors; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE colorset_colors (
    colorsetid integer NOT NULL,
    sort_order integer NOT NULL,
    colorid integer NOT NULL
);


--
-- Name: colorsettranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE colorsettranslations (
    colorsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: colortranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE colortranslations (
    colorid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: completedatasetregistration; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE completedatasetregistration (
    datasetid integer NOT NULL,
    periodid integer NOT NULL,
    sourceid integer NOT NULL,
    attributeoptioncomboid integer NOT NULL,
    date timestamp without time zone,
    storedby character varying(255)
);


--
-- Name: configuration; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE configuration (
    configurationid integer NOT NULL,
    systemid character varying(255),
    feedbackrecipientsid integer,
    offlineorgunitlevelid integer,
    infrastructuralindicatorsid integer,
    infrastructuraldataelementsid integer,
    infrastructuralperiodtypeid integer,
    selfregistrationrole integer,
    selfregistrationorgunit integer
);


--
-- Name: configuration_corswhitelist; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE configuration_corswhitelist (
    configurationid integer NOT NULL,
    corswhitelist character varying(255)
);


--
-- Name: constant; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE constant (
    constantid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    description text,
    value double precision NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: constantattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE constantattributevalues (
    constantid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: constanttranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE constanttranslations (
    colorid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: constantusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE constantusergroupaccesses (
    constantid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: dashboard; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dashboard (
    dashboardid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    userid integer,
    externalaccess boolean,
    publicaccess character varying(8)
);


--
-- Name: dashboard_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dashboard_items (
    dashboardid integer NOT NULL,
    sort_order integer NOT NULL,
    dashboarditemid integer NOT NULL
);


--
-- Name: dashboarditem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dashboarditem (
    dashboarditemid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    chartid integer,
    eventchartid integer,
    mapid integer,
    reporttable integer,
    eventreport integer,
    messages boolean,
    appkey character varying(255),
    shape character varying(50)
);


--
-- Name: dashboarditem_reports; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dashboarditem_reports (
    dashboarditemid integer NOT NULL,
    sort_order integer NOT NULL,
    reportid integer NOT NULL
);


--
-- Name: dashboarditem_resources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dashboarditem_resources (
    dashboarditemid integer NOT NULL,
    sort_order integer NOT NULL,
    resourceid integer NOT NULL
);


--
-- Name: dashboarditem_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dashboarditem_users (
    dashboarditemid integer NOT NULL,
    sort_order integer NOT NULL,
    userid integer NOT NULL
);


--
-- Name: dashboarditemtranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dashboarditemtranslations (
    dashboarditemid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: dashboardtranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dashboardtranslations (
    dashboardid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: dashboardusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dashboardusergroupaccesses (
    dashboardid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: dataapproval; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataapproval (
    dataapprovalid integer NOT NULL,
    dataapprovallevelid integer NOT NULL,
    workflowid integer NOT NULL,
    periodid integer NOT NULL,
    organisationunitid integer NOT NULL,
    attributeoptioncomboid integer NOT NULL,
    accepted boolean NOT NULL,
    created timestamp without time zone NOT NULL,
    creator integer NOT NULL
);


--
-- Name: dataapprovallevel; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataapprovallevel (
    dataapprovallevelid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    level integer NOT NULL,
    orgunitlevel integer NOT NULL,
    categoryoptiongroupsetid integer,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: dataapprovalleveltranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataapprovalleveltranslations (
    dataapprovallevelid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: dataapprovallevelusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataapprovallevelusergroupaccesses (
    dataapprovallevelid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: dataapprovalworkflow; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataapprovalworkflow (
    workflowid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    periodtypeid integer NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: dataapprovalworkflowlevels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataapprovalworkflowlevels (
    workflowid integer NOT NULL,
    dataapprovallevelid integer NOT NULL
);


--
-- Name: dataapprovalworkflowtranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataapprovalworkflowtranslations (
    workflowid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: dataapprovalworkflowusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataapprovalworkflowusergroupaccesses (
    workflowid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: datadimensionitem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE datadimensionitem (
    datadimensionitemid integer NOT NULL,
    indicatorid integer,
    dataelementid integer,
    dataelementoperandid integer,
    datasetid integer,
    metric character varying(50),
    programindicatorid integer,
    programdataelementid integer,
    programattributeid integer
);


--
-- Name: dataelement; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelement (
    dataelementid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    description text,
    formname character varying(230),
    valuetype character varying(50) NOT NULL,
    domaintype character varying(255) NOT NULL,
    aggregationtype character varying(50) NOT NULL,
    categorycomboid integer NOT NULL,
    url character varying(255),
    zeroissignificant boolean NOT NULL,
    optionsetid integer,
    commentoptionsetid integer,
    legendsetid integer,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: dataelementaggregationlevels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementaggregationlevels (
    dataelementid integer NOT NULL,
    sort_order integer NOT NULL,
    aggregationlevel integer
);


--
-- Name: dataelementattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementattributevalues (
    dataelementid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: dataelementcategory; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementcategory (
    categoryid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    datadimensiontype character varying(255) NOT NULL,
    datadimension boolean NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: dataelementcategoryoption; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementcategoryoption (
    categoryoptionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    startdate date,
    enddate date,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: dataelementcategoryoptionattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementcategoryoptionattributevalues (
    categoryoptionid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: dataelementcategoryoptionusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementcategoryoptionusergroupaccesses (
    categoryoptionid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: dataelementcategorytranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementcategorytranslations (
    categoryid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: dataelementcategoryusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementcategoryusergroupaccesses (
    categoryid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: dataelementgroup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementgroup (
    dataelementgroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: dataelementgroupattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementgroupattributevalues (
    dataelementgroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: dataelementgroupmembers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementgroupmembers (
    dataelementgroupid integer NOT NULL,
    dataelementid integer NOT NULL
);


--
-- Name: dataelementgroupset; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementgroupset (
    dataelementgroupsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    compulsory boolean,
    datadimension boolean NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: dataelementgroupsetmembers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementgroupsetmembers (
    dataelementgroupid integer NOT NULL,
    dataelementgroupsetid integer NOT NULL,
    sort_order integer NOT NULL
);


--
-- Name: dataelementgroupsettranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementgroupsettranslations (
    dataelementgroupsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: dataelementgroupsetusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementgroupsetusergroupaccesses (
    dataelementgroupsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: dataelementgrouptranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementgrouptranslations (
    dataelementgroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: dataelementgroupusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementgroupusergroupaccesses (
    dataelementgroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: dataelementoperand; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementoperand (
    dataelementoperandid integer NOT NULL,
    dataelementid integer,
    categoryoptioncomboid integer
);


--
-- Name: dataelementtranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementtranslations (
    dataelementid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: dataelementusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataelementusergroupaccesses (
    dataelementid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: dataentryform; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataentryform (
    dataentryformid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(160) NOT NULL,
    style character varying(40),
    htmlcode text,
    format integer
);


--
-- Name: dataentryformtranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataentryformtranslations (
    dataentryformid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: dataset; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dataset (
    datasetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    description text,
    periodtypeid integer NOT NULL,
    categorycomboid integer NOT NULL,
    dataentryform integer,
    mobile boolean NOT NULL,
    version integer,
    expirydays integer,
    timelydays integer,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    notifycompletinguser boolean,
    workflowid integer,
    openfutureperiods integer,
    fieldcombinationrequired boolean,
    validcompleteonly boolean,
    novaluerequirescomment boolean,
    skipoffline boolean,
    dataelementdecoration boolean,
    renderastabs boolean,
    renderhorizontally boolean,
    legendsetid integer,
    userid integer,
    publicaccess character varying(8),
    notificationrecipients integer
);


--
-- Name: datasetattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE datasetattributevalues (
    datasetid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: datasetelement; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE datasetelement (
    datasetelementid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    datasetid integer,
    dataelementid integer NOT NULL,
    categorycomboid integer
);


--
-- Name: datasetindicators; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE datasetindicators (
    datasetid integer NOT NULL,
    indicatorid integer NOT NULL
);


--
-- Name: datasetoperands; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE datasetoperands (
    datasetid integer NOT NULL,
    dataelementoperandid integer NOT NULL
);


--
-- Name: datasetsectiontranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE datasetsectiontranslations (
    sectionid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: datasetsource; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE datasetsource (
    datasetid integer NOT NULL,
    sourceid integer NOT NULL
);


--
-- Name: datasettranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE datasettranslations (
    datasetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: datasetusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE datasetusergroupaccesses (
    datasetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: datastatistics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE datastatistics (
    statisticsid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    chartviews double precision,
    mapviews double precision,
    reporttableviews double precision,
    eventreportviews double precision,
    eventchartviews double precision,
    dashboardviews double precision,
    datasetreportviews double precision,
    active_users integer,
    totalviews double precision,
    charts double precision,
    maps double precision,
    reporttables double precision,
    eventreports double precision,
    eventcharts double precision,
    dashboards double precision,
    indicators double precision,
    datavalues double precision,
    users integer
);


--
-- Name: datastatisticsevent; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE datastatisticsevent (
    eventid integer NOT NULL,
    eventtype character varying,
    "timestamp" timestamp without time zone,
    username character varying(255),
    favoriteuid character varying(255)
);


--
-- Name: datavalue; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE datavalue (
    dataelementid integer NOT NULL,
    periodid integer NOT NULL,
    sourceid integer NOT NULL,
    categoryoptioncomboid integer NOT NULL,
    attributeoptioncomboid integer NOT NULL,
    value character varying(50000),
    storedby character varying(255),
    created timestamp without time zone,
    lastupdated timestamp without time zone,
    comment character varying(50000),
    followup boolean,
    deleted boolean NOT NULL
);


--
-- Name: datavalueaudit; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE datavalueaudit (
    datavalueauditid integer NOT NULL,
    dataelementid integer NOT NULL,
    periodid integer NOT NULL,
    organisationunitid integer NOT NULL,
    categoryoptioncomboid integer NOT NULL,
    attributeoptioncomboid integer NOT NULL,
    value character varying(50000),
    created timestamp without time zone,
    modifiedby character varying(100),
    audittype character varying(100) NOT NULL
);


--
-- Name: document; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE document (
    documentid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    url text NOT NULL,
    external boolean NOT NULL,
    contenttype character varying(255),
    attachment boolean,
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: documentattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE documentattributevalues (
    documentid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: documenttranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE documenttranslations (
    documentid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: documentusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE documentusergroupaccesses (
    documentid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: eventchart; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventchart (
    eventchartid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    relativeperiodsid integer,
    userorganisationunit boolean,
    userorganisationunitchildren boolean,
    userorganisationunitgrandchildren boolean,
    programid integer NOT NULL,
    programstageid integer,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    dataelementvaluedimensionid integer,
    attributevaluedimensionid integer,
    aggregationtype character varying(40),
    completedonly boolean,
    title character varying(255),
    subtitle character varying(255),
    type character varying(40) NOT NULL,
    showdata boolean,
    hideemptyrows boolean,
    hidenadata boolean,
    rangeaxismaxvalue double precision,
    rangeaxisminvalue double precision,
    rangeaxissteps integer,
    rangeaxisdecimals integer,
    outputtype character varying(30),
    collapsedatadimensions boolean,
    domainaxislabel character varying(255),
    rangeaxislabel character varying(255),
    hidelegend boolean,
    hidetitle boolean,
    hidesubtitle boolean,
    regressiontype character varying(40) NOT NULL,
    targetlinevalue double precision,
    targetlinelabel character varying(255),
    baselinevalue double precision,
    baselinelabel character varying(255),
    sortorder integer,
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: eventchart_attributedimensions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventchart_attributedimensions (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityattributedimensionid integer NOT NULL
);


--
-- Name: eventchart_columns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventchart_columns (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


--
-- Name: eventchart_dataelementdimensions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventchart_dataelementdimensions (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentitydataelementdimensionid integer NOT NULL
);


--
-- Name: eventchart_filters; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventchart_filters (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


--
-- Name: eventchart_itemorgunitgroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventchart_itemorgunitgroups (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


--
-- Name: eventchart_organisationunits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventchart_organisationunits (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    organisationunitid integer NOT NULL
);


--
-- Name: eventchart_orgunitgroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventchart_orgunitgroups (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


--
-- Name: eventchart_orgunitlevels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventchart_orgunitlevels (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitlevel integer
);


--
-- Name: eventchart_periods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventchart_periods (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    periodid integer NOT NULL
);


--
-- Name: eventchart_programindicatordimensions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventchart_programindicatordimensions (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityprogramindicatordimensionid integer NOT NULL
);


--
-- Name: eventchart_rows; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventchart_rows (
    eventchartid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


--
-- Name: eventcharttranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventcharttranslations (
    eventchartid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: eventchartusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventchartusergroupaccesses (
    eventchartid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: eventreport; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventreport (
    eventreportid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    relativeperiodsid integer,
    userorganisationunit boolean,
    userorganisationunitchildren boolean,
    userorganisationunitgrandchildren boolean,
    programid integer NOT NULL,
    programstageid integer,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    dataelementvaluedimensionid integer,
    attributevaluedimensionid integer,
    aggregationtype character varying(40),
    completedonly boolean,
    title character varying(255),
    datatype character varying(40),
    rowtotals boolean,
    coltotals boolean,
    rowsubtotals boolean,
    colsubtotals boolean,
    hideemptyrows boolean,
    hidenadata boolean,
    showhierarchy boolean,
    outputtype character varying(30),
    collapsedatadimensions boolean,
    showdimensionlabels boolean,
    digitgroupseparator character varying(40),
    displaydensity character varying(40),
    fontsize character varying(40),
    sortorder integer,
    toplimit integer,
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: eventreport_attributedimensions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventreport_attributedimensions (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityattributedimensionid integer NOT NULL
);


--
-- Name: eventreport_columns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventreport_columns (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


--
-- Name: eventreport_dataelementdimensions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventreport_dataelementdimensions (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentitydataelementdimensionid integer NOT NULL
);


--
-- Name: eventreport_filters; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventreport_filters (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


--
-- Name: eventreport_itemorgunitgroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventreport_itemorgunitgroups (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


--
-- Name: eventreport_organisationunits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventreport_organisationunits (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    organisationunitid integer NOT NULL
);


--
-- Name: eventreport_orgunitgroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventreport_orgunitgroups (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


--
-- Name: eventreport_orgunitlevels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventreport_orgunitlevels (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitlevel integer
);


--
-- Name: eventreport_periods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventreport_periods (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    periodid integer NOT NULL
);


--
-- Name: eventreport_programindicatordimensions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventreport_programindicatordimensions (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityprogramindicatordimensionid integer NOT NULL
);


--
-- Name: eventreport_rows; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventreport_rows (
    eventreportid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


--
-- Name: eventreporttranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventreporttranslations (
    eventreportid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: eventreportusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE eventreportusergroupaccesses (
    eventreportid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: expression; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE expression (
    expressionid integer NOT NULL,
    description character varying(255),
    expression text,
    missingvaluestrategy character varying(100) NOT NULL
);


--
-- Name: expressiondataelement; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE expressiondataelement (
    expressionid integer NOT NULL,
    dataelementid integer NOT NULL
);


--
-- Name: expressionsampleelement; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE expressionsampleelement (
    expressionid integer NOT NULL,
    dataelementid integer NOT NULL
);


--
-- Name: externalfileresource; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE externalfileresource (
    externalfileresourceid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    accesstoken character varying(255),
    expires timestamp without time zone,
    fileresourceid integer NOT NULL
);


--
-- Name: externalmaplayer; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE externalmaplayer (
    externalmaplayerid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    attribution text,
    url text NOT NULL,
    legendseturl text,
    maplayerposition bytea NOT NULL,
    layers text,
    imageformat bytea NOT NULL,
    mapservice bytea NOT NULL,
    legendsetid integer,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: externalmaplayerusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE externalmaplayerusergroupaccesses (
    externalmaplayerid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: fileresource; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE fileresource (
    fileresourceid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    contenttype character varying(255) NOT NULL,
    contentlength bigint NOT NULL,
    contentmd5 character varying(32) NOT NULL,
    storagekey character varying(1024) NOT NULL,
    isassigned boolean NOT NULL,
    storagestatus character varying(40),
    domain character varying(40),
    userid integer
);


--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: i18nlocale; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE i18nlocale (
    i18nlocaleid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(250) NOT NULL,
    locale character varying(15) NOT NULL
);


--
-- Name: incomingsms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE incomingsms (
    id integer NOT NULL,
    originator character varying(255) NOT NULL,
    encoding integer NOT NULL,
    sentdate timestamp without time zone NOT NULL,
    receiveddate timestamp without time zone NOT NULL,
    text character varying(255),
    gatewayid character varying(255) NOT NULL,
    status integer NOT NULL,
    parsed boolean,
    statusmessage character varying(255)
);


--
-- Name: indicator; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicator (
    indicatorid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    description text,
    annualized boolean NOT NULL,
    decimals integer,
    indicatortypeid integer NOT NULL,
    numerator text NOT NULL,
    numeratordescription text,
    denominator text NOT NULL,
    denominatordescription text,
    url character varying(255),
    legendsetid integer,
    aggregateexportcategoryoptioncombo character varying(255),
    aggregateexportattributeoptioncombo character varying(255),
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: indicatorattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicatorattributevalues (
    indicatorid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: indicatorgroup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicatorgroup (
    indicatorgroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: indicatorgroupattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicatorgroupattributevalues (
    indicatorgroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: indicatorgroupmembers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicatorgroupmembers (
    indicatorgroupid integer NOT NULL,
    indicatorid integer NOT NULL
);


--
-- Name: indicatorgroupset; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicatorgroupset (
    indicatorgroupsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    compulsory boolean,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: indicatorgroupsetmembers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicatorgroupsetmembers (
    indicatorgroupid integer NOT NULL,
    indicatorgroupsetid integer NOT NULL,
    sort_order integer NOT NULL
);


--
-- Name: indicatorgroupsettranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicatorgroupsettranslations (
    indicatorgroupsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: indicatorgroupsetusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicatorgroupsetusergroupaccesses (
    indicatorgroupsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: indicatorgrouptranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicatorgrouptranslations (
    indicatorgroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: indicatorgroupusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicatorgroupusergroupaccesses (
    indicatorgroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: indicatortranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicatortranslations (
    indicatorid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: indicatortype; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicatortype (
    indicatortypeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    indicatorfactor integer NOT NULL,
    indicatornumber boolean
);


--
-- Name: indicatortypetranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicatortypetranslations (
    indicatortypeid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: indicatorusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE indicatorusergroupaccesses (
    indicatorid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: intepretation_likedby; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE intepretation_likedby (
    interpretationid integer NOT NULL,
    userid integer NOT NULL
);


--
-- Name: interpretation; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE interpretation (
    interpretationid integer NOT NULL,
    uid character varying(11) NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    reporttableid integer,
    chartid integer,
    mapid integer,
    eventreportid integer,
    eventchartid integer,
    datasetid integer,
    periodid integer,
    organisationunitid integer,
    interpretationtext text,
    created timestamp without time zone NOT NULL,
    likes integer,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: interpretation_comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE interpretation_comments (
    interpretationid integer NOT NULL,
    sort_order integer NOT NULL,
    interpretationcommentid integer NOT NULL
);


--
-- Name: interpretationcomment; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE interpretationcomment (
    interpretationcommentid integer NOT NULL,
    uid character varying(11),
    lastupdated timestamp without time zone NOT NULL,
    commenttext text,
    userid integer NOT NULL,
    created timestamp without time zone NOT NULL
);


--
-- Name: interpretationusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE interpretationusergroupaccesses (
    interpretationid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: keyjsonvalue; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE keyjsonvalue (
    keyjsonvalueid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    namespace character varying(255) NOT NULL,
    namespacekey character varying(255) NOT NULL,
    value text,
    encrypted_value character varying(255),
    encrypted boolean
);


--
-- Name: legendsetattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE legendsetattributevalues (
    legendsetid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: legendsetusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE legendsetusergroupaccesses (
    maplegendsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: lockexception; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE lockexception (
    lockexceptionid integer NOT NULL,
    organisationunitid integer,
    periodid integer,
    datasetid integer
);


--
-- Name: map; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE map (
    mapid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    longitude double precision,
    latitude double precision,
    zoom integer,
    basemap character varying(255),
    title character varying(255),
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: maplegend; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE maplegend (
    maplegendid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    startvalue double precision,
    endvalue double precision,
    color character varying(255),
    image character varying(255)
);


--
-- Name: maplegendset; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE maplegendset (
    maplegendsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    symbolizer character varying(255),
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: maplegendsetmaplegend; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE maplegendsetmaplegend (
    legendsetid integer NOT NULL,
    maplegendid integer NOT NULL
);


--
-- Name: maplegendsettranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE maplegendsettranslations (
    maplegendsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: maplegendtranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE maplegendtranslations (
    maplegendid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: mapmapviews; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mapmapviews (
    mapid integer NOT NULL,
    sort_order integer NOT NULL,
    mapviewid integer NOT NULL
);


--
-- Name: mapusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mapusergroupaccesses (
    mapid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: mapview; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mapview (
    mapviewid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    description text,
    layer character varying(255) NOT NULL,
    relativeperiodsid integer,
    userorganisationunit boolean,
    userorganisationunitchildren boolean,
    userorganisationunitgrandchildren boolean,
    aggregationtype character varying(40),
    programid integer,
    programstageid integer,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    method integer,
    classes integer,
    colorlow character varying(255),
    colorhigh character varying(255),
    colorscale character varying(255),
    legendsetid integer,
    radiuslow integer,
    radiushigh integer,
    opacity double precision,
    orgunitgroupsetid integer,
    arearadius integer,
    hidden boolean,
    labels boolean,
    labelfontsize character varying(255),
    labelfontweight character varying(255),
    labelfontstyle character varying(255),
    labelfontcolor character varying(255),
    eventclustering boolean,
    eventpointcolor character varying(255),
    eventpointradius integer,
    config text
);


--
-- Name: mapview_attributedimensions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mapview_attributedimensions (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentityattributedimensionid integer NOT NULL
);


--
-- Name: mapview_columns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mapview_columns (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


--
-- Name: mapview_datadimensionitems; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mapview_datadimensionitems (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    datadimensionitemid integer NOT NULL
);


--
-- Name: mapview_dataelementdimensions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mapview_dataelementdimensions (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentitydataelementdimensionid integer NOT NULL
);


--
-- Name: mapview_itemorgunitgroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mapview_itemorgunitgroups (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


--
-- Name: mapview_organisationunits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mapview_organisationunits (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    organisationunitid integer NOT NULL
);


--
-- Name: mapview_orgunitlevels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mapview_orgunitlevels (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitlevel integer
);


--
-- Name: mapview_periods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mapview_periods (
    mapviewid integer NOT NULL,
    sort_order integer NOT NULL,
    periodid integer NOT NULL
);


--
-- Name: mapviewtranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mapviewtranslations (
    mapviewid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: message; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE message (
    messageid integer NOT NULL,
    uid character varying(11),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    messagetext text,
    internal boolean,
    metadata character varying(255),
    userid integer
);


--
-- Name: messageconversation; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE messageconversation (
    messageconversationid integer NOT NULL,
    uid character varying(11),
    messagecount integer,
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    subject character varying(255) NOT NULL,
    priority character varying(255),
    status character varying(255),
    lastsenderid integer,
    lastmessage timestamp without time zone,
    userid integer
);


--
-- Name: messageconversation_messages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE messageconversation_messages (
    messageconversationid integer NOT NULL,
    sort_order integer NOT NULL,
    messageid integer NOT NULL
);


--
-- Name: messageconversation_usermessages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE messageconversation_usermessages (
    messageconversationid integer NOT NULL,
    usermessageid integer NOT NULL
);


--
-- Name: metadataversion; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE metadataversion (
    versionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    versiontype character varying(50),
    importdate timestamp without time zone,
    hashcode character varying(50) NOT NULL
);


--
-- Name: minmaxdataelement; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE minmaxdataelement (
    minmaxdataelementid integer NOT NULL,
    sourceid integer,
    dataelementid integer,
    categoryoptioncomboid integer,
    minimumvalue integer NOT NULL,
    maximumvalue integer NOT NULL,
    generatedvalue boolean NOT NULL
);


--
-- Name: oauth2client; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oauth2client (
    oauth2clientid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    cid character varying(230) NOT NULL,
    secret character varying(512) NOT NULL
);


--
-- Name: oauth2clientgranttypes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oauth2clientgranttypes (
    oauth2clientid integer NOT NULL,
    sort_order integer NOT NULL,
    granttype character varying(255)
);


--
-- Name: oauth2clientredirecturis; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oauth2clientredirecturis (
    oauth2clientid integer NOT NULL,
    sort_order integer NOT NULL,
    redirecturi character varying(255)
);


--
-- Name: oauth_access_token; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oauth_access_token (
    token_id character varying(256),
    token bytea,
    authentication_id character varying(256) NOT NULL,
    user_name character varying(256),
    client_id character varying(256),
    authentication bytea,
    refresh_token character varying(256)
);


--
-- Name: oauth_code; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oauth_code (
    code character varying(256),
    authentication bytea
);


--
-- Name: oauth_refresh_token; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oauth_refresh_token (
    token_id character varying(256),
    token bytea,
    authentication bytea
);


--
-- Name: objecttranslation; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE objecttranslation (
    objecttranslationid integer NOT NULL,
    locale character varying(15) NOT NULL,
    property character varying(50) NOT NULL,
    value text NOT NULL
);


--
-- Name: optionattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optionattributevalues (
    optionvalueid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: optiongroup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optiongroup (
    optiongroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: optiongroupattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optiongroupattributevalues (
    optiongroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: optiongroupmembers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optiongroupmembers (
    optiongroupid integer NOT NULL,
    optionid integer NOT NULL
);


--
-- Name: optiongroupset; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optiongroupset (
    optiongroupsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    datadimension boolean NOT NULL,
    optionsetid integer,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: optiongroupsetmembers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optiongroupsetmembers (
    optiongroupsetid integer NOT NULL,
    sort_order integer NOT NULL,
    optiongroupid integer NOT NULL
);


--
-- Name: optiongroupsettranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optiongroupsettranslations (
    optiongroupsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: optiongroupsetusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optiongroupsetusergroupaccesses (
    optiongroupsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: optiongrouptranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optiongrouptranslations (
    optiongroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: optiongroupusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optiongroupusergroupaccesses (
    optiongroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: optionset; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optionset (
    optionsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    valuetype character varying(50) NOT NULL,
    version integer,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: optionsetattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optionsetattributevalues (
    optionsetid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: optionsettranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optionsettranslations (
    optionsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: optionsetusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optionsetusergroupaccesses (
    optionsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: optionvalue; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optionvalue (
    optionvalueid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(230),
    name character varying(230) NOT NULL,
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    optionsetid integer,
    sort_order integer
);


--
-- Name: optionvaluetranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optionvaluetranslations (
    optionvalueid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: organisationunit; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organisationunit (
    organisationunitid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50) NOT NULL,
    parentid integer,
    path character varying(255),
    hierarchylevel integer,
    description text,
    openingdate date NOT NULL,
    closeddate date,
    comment text,
    featuretype character varying(50),
    coordinates text,
    url character varying(255),
    contactperson character varying(255),
    address character varying(255),
    email character varying(150),
    phonenumber character varying(150),
    userid integer
);


--
-- Name: organisationunitattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organisationunitattributevalues (
    organisationunitid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: organisationunittranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organisationunittranslations (
    organisationunitid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: orgunitgroup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orgunitgroup (
    orgunitgroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    symbol character varying(255),
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: orgunitgroupattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orgunitgroupattributevalues (
    orgunitgroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: orgunitgroupmembers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orgunitgroupmembers (
    organisationunitid integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


--
-- Name: orgunitgroupset; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orgunitgroupset (
    orgunitgroupsetid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    compulsory boolean NOT NULL,
    datadimension boolean NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: orgunitgroupsetattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orgunitgroupsetattributevalues (
    orgunitgroupsetid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: orgunitgroupsetmembers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orgunitgroupsetmembers (
    orgunitgroupid integer NOT NULL,
    orgunitgroupsetid integer NOT NULL
);


--
-- Name: orgunitgroupsettranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orgunitgroupsettranslations (
    orgunitgroupsetid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: orgunitgroupsetusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orgunitgroupsetusergroupaccesses (
    orgunitgroupsetid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: orgunitgrouptranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orgunitgrouptranslations (
    orgunitgroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: orgunitgroupusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orgunitgroupusergroupaccesses (
    orgunitgroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: orgunitlevel; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orgunitlevel (
    orgunitlevelid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    level integer NOT NULL,
    offlinelevels integer
);


--
-- Name: orgunitleveltranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orgunitleveltranslations (
    orgunitlevelid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: outbound_sms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE outbound_sms (
    id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    message character varying(500),
    status integer NOT NULL,
    sender character varying(255)
);


--
-- Name: outbound_sms_recipients; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE outbound_sms_recipients (
    outbound_sms_id integer NOT NULL,
    elt text
);


--
-- Name: period; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE period (
    periodid integer NOT NULL,
    periodtypeid integer,
    startdate date NOT NULL,
    enddate date NOT NULL
);


--
-- Name: periodtype; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE periodtype (
    periodtypeid integer NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: predictor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE predictor (
    predictorid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    generatorexpressionid integer NOT NULL,
    generatoroutput integer NOT NULL,
    generatoroutputcombo integer,
    skiptestexpressionid integer,
    periodtypeid integer NOT NULL,
    sequentialsamplecount integer NOT NULL,
    annualsamplecount integer NOT NULL,
    sequentialskipcount integer
);


--
-- Name: predictororgunitlevels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE predictororgunitlevels (
    predictorid integer NOT NULL,
    orgunitlevelid integer NOT NULL
);


--
-- Name: program; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE program (
    programid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    description text,
    version integer,
    enrollmentdatelabel text,
    incidentdatelabel text,
    type character varying(255) NOT NULL,
    displayincidentdate boolean,
    onlyenrollonce boolean,
    skipoffline boolean NOT NULL,
    displayfrontpagelist boolean,
    usefirststageduringregistration boolean,
    capturecoordinates boolean,
    expirydays integer,
    completeeventsexpirydays integer,
    expiryperiodtypeid integer,
    ignoreoverdueevents boolean,
    selectenrollmentdatesinfuture boolean,
    selectincidentdatesinfuture boolean,
    relationshiptext character varying(255),
    relationshiptypeid integer,
    relationshipfroma boolean,
    relatedprogramid integer,
    dataentrymethod boolean,
    categorycomboid integer NOT NULL,
    trackedentityid integer,
    dataentryformid integer,
    workflowid integer,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: program_attributes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE program_attributes (
    programtrackedentityattributeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    programid integer,
    trackedentityattributeid integer,
    displayinlist boolean,
    mandatory boolean,
    allowfuturedate boolean,
    sort_order integer
);


--
-- Name: program_criteria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE program_criteria (
    programid integer NOT NULL,
    validationcriteriaid integer NOT NULL
);


--
-- Name: program_organisationunits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE program_organisationunits (
    organisationunitid integer NOT NULL,
    programid integer NOT NULL
);


--
-- Name: program_userroles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE program_userroles (
    userroleid integer NOT NULL,
    programid integer NOT NULL
);


--
-- Name: programattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programattributevalues (
    programid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: programdataelement; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programdataelement (
    programdataelementid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    programid integer NOT NULL,
    dataelementid integer NOT NULL
);


--
-- Name: programdataelementtranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programdataelementtranslations (
    programdataelementid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: programexpression; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programexpression (
    programexpressionid integer NOT NULL,
    description character varying(255),
    expression text
);


--
-- Name: programindicator; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programindicator (
    programindicatorid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(255),
    description text,
    programid integer NOT NULL,
    expression text,
    filter text,
    aggregationtype character varying(40),
    decimals integer,
    legendsetid integer,
    aggregateexportcategoryoptioncombo character varying(255),
    aggregateexportattributeoptioncombo character varying(255),
    displayinform boolean,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: programindicatorattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programindicatorattributevalues (
    programindicatorid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: programindicatorgroup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programindicatorgroup (
    programindicatorgroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: programindicatorgroupattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programindicatorgroupattributevalues (
    programindicatorgroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: programindicatorgroupmembers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programindicatorgroupmembers (
    programindicatorgroupid integer NOT NULL,
    programindicatorid integer NOT NULL
);


--
-- Name: programindicatorgrouptranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programindicatorgrouptranslations (
    programindicatorgroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: programindicatorgroupusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programindicatorgroupusergroupaccesses (
    programindicatorgroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: programindicatortranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programindicatortranslations (
    programindicatorid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: programindicatorusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programindicatorusergroupaccesses (
    programindicatorid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: programinstance; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programinstance (
    programinstanceid integer NOT NULL,
    uid character varying(11),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    incidentdate timestamp without time zone,
    enrollmentdate timestamp without time zone NOT NULL,
    enddate timestamp without time zone,
    followup boolean,
    completedby character varying(255),
    longitude double precision,
    latitude double precision,
    status character varying(50),
    trackedentityinstanceid integer,
    programid integer NOT NULL,
    organisationunitid integer
);


--
-- Name: programinstance_messageconversation; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programinstance_messageconversation (
    programinstanceid integer NOT NULL,
    sort_order integer NOT NULL,
    messageconversationid integer NOT NULL
);


--
-- Name: programinstancecomments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programinstancecomments (
    programinstanceid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentitycommentid integer NOT NULL
);


--
-- Name: programmessage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programmessage (
    id integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    text character varying(500) NOT NULL,
    subject character varying(200),
    processeddate timestamp without time zone,
    messagestatus character varying(50),
    trackedentityinstanceid integer,
    organisationunitid integer,
    programinstanceid integer,
    programstageinstanceid integer
);


--
-- Name: programmessage_deliverychannels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programmessage_deliverychannels (
    programmessagedeliverychannelsid integer NOT NULL,
    deliverychannel character varying(255)
);


--
-- Name: programmessage_emailaddresses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programmessage_emailaddresses (
    programmessageemailaddressid integer NOT NULL,
    email text
);


--
-- Name: programmessage_phonenumbers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programmessage_phonenumbers (
    programmessagephonenumberid integer NOT NULL,
    phonenumber text
);


--
-- Name: programmessagetranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programmessagetranslations (
    id integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: programnotificationtemplate; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programnotificationtemplate (
    programnotificationtemplateid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    relativescheduleddays integer,
    usergroupid integer,
    subjecttemplate character varying(100),
    messagetemplate text NOT NULL,
    notificationtrigger character varying(255),
    notificationrecipienttype character varying(255),
    programstageid integer,
    programid integer
);


--
-- Name: programnotificationtemplate_deliverychannel; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programnotificationtemplate_deliverychannel (
    programnotificationtemplatedeliverychannelid integer NOT NULL,
    deliverychannel character varying(255)
);


--
-- Name: programrule; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programrule (
    programruleid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description character varying(255),
    programid integer NOT NULL,
    programstageid integer,
    rulecondition text,
    priority integer
);


--
-- Name: programruleaction; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programruleaction (
    programruleactionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    programruleid integer,
    actiontype character varying(255) NOT NULL,
    dataelementid integer,
    trackedentityattributeid integer,
    programindicatorid integer,
    programstagesectionid integer,
    programstageid integer,
    location character varying(255),
    content text,
    data text
);


--
-- Name: programruletranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programruletranslations (
    programruleid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: programrulevariable; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programrulevariable (
    programrulevariableid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    programid integer NOT NULL,
    sourcetype character varying(255) NOT NULL,
    trackedentityattributeid integer,
    dataelementid integer,
    usecodeforoptionset boolean,
    programstageid integer
);


--
-- Name: programstage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programstage (
    programstageid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230),
    description text,
    mindaysfromstart integer NOT NULL,
    programid integer,
    repeatable boolean NOT NULL,
    dataentryformid integer,
    standardinterval integer,
    executiondatelabel character varying(255),
    autogenerateevent boolean,
    validcompleteonly boolean,
    displaygenerateeventbox boolean,
    capturecoordinates boolean,
    generatedbyenrollmentdate boolean,
    blockentryform boolean,
    remindcompleted boolean,
    allowgeneratenextvisit boolean,
    openafterenrollment boolean,
    reportdatetouse character varying(255),
    pregenerateuid boolean,
    hideduedate boolean,
    sort_order integer,
    periodtypeid integer
);


--
-- Name: programstageattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programstageattributevalues (
    programstageid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: programstagedataelement; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programstagedataelement (
    programstagedataelementid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    programstageid integer,
    dataelementid integer,
    compulsory boolean NOT NULL,
    allowprovidedelsewhere boolean,
    sort_order integer,
    displayinreports boolean,
    allowfuturedate boolean,
    programstagesectionid integer,
    section_sort_order integer
);


--
-- Name: programstageinstance; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programstageinstance (
    programstageinstanceid integer NOT NULL,
    uid character varying(11),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    programinstanceid integer NOT NULL,
    programstageid integer NOT NULL,
    attributeoptioncomboid integer,
    storedby character varying(255),
    duedate timestamp without time zone,
    executiondate timestamp without time zone,
    organisationunitid integer,
    status character varying(25) NOT NULL,
    longitude double precision,
    latitude double precision,
    completedby character varying(255),
    completeddate timestamp without time zone
);


--
-- Name: programstageinstance_messageconversation; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programstageinstance_messageconversation (
    programstageinstanceid integer NOT NULL,
    sort_order integer NOT NULL,
    messageconversationid integer NOT NULL
);


--
-- Name: programstageinstancecomments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programstageinstancecomments (
    programstageinstanceid integer NOT NULL,
    sort_order integer NOT NULL,
    trackedentitycommentid integer NOT NULL
);


--
-- Name: programstagesection; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programstagesection (
    programstagesectionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    programstageid integer,
    sortorder integer NOT NULL
);


--
-- Name: programstagesection_programindicators; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programstagesection_programindicators (
    programstagesectionid integer NOT NULL,
    sort_order integer NOT NULL,
    programindicatorid integer NOT NULL
);


--
-- Name: programstagesectiontranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programstagesectiontranslations (
    programstagesectionid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: programstagetranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programstagetranslations (
    programstageid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: programtranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programtranslations (
    programid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: programusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programusergroupaccesses (
    programid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: pushanalysis; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pushanalysis (
    pushanalysisid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(255) NOT NULL,
    title character varying(255),
    message text,
    enabled boolean NOT NULL,
    lastrun timestamp without time zone,
    schedulingdayoffrequency integer,
    schedulingfrequency bytea,
    dashboard integer NOT NULL
);


--
-- Name: pushanalysisrecipientusergroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pushanalysisrecipientusergroups (
    usergroupid integer NOT NULL,
    elt integer NOT NULL
);


--
-- Name: relationship; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE relationship (
    relationshipid integer NOT NULL,
    trackedentityinstanceaid integer NOT NULL,
    relationshiptypeid integer NOT NULL,
    trackedentityinstancebid integer NOT NULL
);


--
-- Name: relationshiptype; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE relationshiptype (
    relationshiptypeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    a_is_to_b character varying(255) NOT NULL,
    b_is_to_a character varying(255) NOT NULL
);


--
-- Name: relationshiptypetranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE relationshiptypetranslations (
    relationshiptypeid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: relativeperiods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE relativeperiods (
    relativeperiodsid integer NOT NULL,
    thismonth boolean,
    lastmonth boolean,
    thisbimonth boolean,
    lastbimonth boolean,
    thisquarter boolean,
    lastquarter boolean,
    thissixmonth boolean,
    lastsixmonth boolean,
    monthsthisyear boolean,
    quartersthisyear boolean,
    thisyear boolean,
    monthslastyear boolean,
    quarterslastyear boolean,
    lastyear boolean,
    last5years boolean,
    last12months boolean,
    last6months boolean,
    last3months boolean,
    last6bimonths boolean,
    last4quarters boolean,
    last2sixmonths boolean,
    thisfinancialyear boolean,
    lastfinancialyear boolean,
    last5financialyears boolean,
    thisweek boolean,
    lastweek boolean,
    last4weeks boolean,
    last12weeks boolean,
    last52weeks boolean
);


--
-- Name: report; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE report (
    reportid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    type character varying(50),
    designcontent text,
    reporttableid integer,
    relativeperiodsid integer,
    paramreportingmonth boolean,
    paramorganisationunit boolean,
    cachestrategy character varying(40),
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: reporttable; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttable (
    reporttableid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    regression boolean,
    cumulative boolean,
    relativeperiodsid integer,
    paramreportingmonth boolean,
    paramgrandparentorganisationunit boolean,
    paramparentorganisationunit boolean,
    paramorganisationunit boolean,
    sortorder integer,
    toplimit integer,
    rowtotals boolean,
    coltotals boolean,
    rowsubtotals boolean,
    colsubtotals boolean,
    hideemptyrows boolean,
    aggregationtype character varying(40),
    completedonly boolean,
    title character varying(255),
    digitgroupseparator character varying(40),
    displaydensity character varying(40),
    fontsize character varying(40),
    userorganisationunit boolean,
    userorganisationunitchildren boolean,
    userorganisationunitgrandchildren boolean,
    legendsetid integer,
    legenddisplaystyle character varying(40),
    showhierarchy boolean,
    showdimensionlabels boolean,
    skiprounding boolean,
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: reporttable_categorydimensions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttable_categorydimensions (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    categorydimensionid integer NOT NULL
);


--
-- Name: reporttable_categoryoptiongroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttable_categoryoptiongroups (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    categoryoptiongroupid integer NOT NULL
);


--
-- Name: reporttable_columns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttable_columns (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


--
-- Name: reporttable_datadimensionitems; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttable_datadimensionitems (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    datadimensionitemid integer NOT NULL
);


--
-- Name: reporttable_dataelementgroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttable_dataelementgroups (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    dataelementgroupid integer NOT NULL
);


--
-- Name: reporttable_filters; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttable_filters (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


--
-- Name: reporttable_itemorgunitgroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttable_itemorgunitgroups (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


--
-- Name: reporttable_organisationunits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttable_organisationunits (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    organisationunitid integer NOT NULL
);


--
-- Name: reporttable_orgunitgroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttable_orgunitgroups (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitgroupid integer NOT NULL
);


--
-- Name: reporttable_orgunitlevels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttable_orgunitlevels (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    orgunitlevel integer
);


--
-- Name: reporttable_periods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttable_periods (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    periodid integer NOT NULL
);


--
-- Name: reporttable_rows; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttable_rows (
    reporttableid integer NOT NULL,
    sort_order integer NOT NULL,
    dimension character varying(255)
);


--
-- Name: reporttabletranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttabletranslations (
    reporttableid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: reporttableusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttableusergroupaccesses (
    reporttableid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: reporttranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporttranslations (
    reportid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: reportusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reportusergroupaccesses (
    reportid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: section; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE section (
    sectionid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    datasetid integer NOT NULL,
    sortorder integer NOT NULL
);


--
-- Name: sectionattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sectionattributevalues (
    sectionid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: sectiondataelements; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sectiondataelements (
    sectionid integer NOT NULL,
    sort_order integer NOT NULL,
    dataelementid integer NOT NULL
);


--
-- Name: sectiongreyedfields; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sectiongreyedfields (
    sectionid integer NOT NULL,
    dataelementoperandid integer NOT NULL
);


--
-- Name: sectionindicators; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sectionindicators (
    sectionid integer NOT NULL,
    sort_order integer NOT NULL,
    indicatorid integer NOT NULL
);


--
-- Name: smscodes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE smscodes (
    smscodeid integer NOT NULL,
    code character varying(255),
    formula text,
    compulsory boolean,
    dataelementid integer,
    trackedentityattributeid integer,
    optionid integer
);


--
-- Name: smscommandcodes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE smscommandcodes (
    id integer NOT NULL,
    codeid integer NOT NULL
);


--
-- Name: smscommands; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE smscommands (
    smscommandid integer NOT NULL,
    name text,
    parser text,
    parsertype integer,
    separatorkey text,
    codeseparator text,
    defaultmessage text,
    receivedmessage text,
    wrongformatmessage text,
    nousermessage text,
    morethanoneorgunitmessage text,
    successmessage text,
    currentperiodusedforreporting boolean,
    completenessmethod integer,
    datasetid integer,
    usergroupid integer,
    programid integer,
    programstageid integer
);


--
-- Name: smscommandspecialcharacters; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE smscommandspecialcharacters (
    smscommandid integer NOT NULL,
    specialcharacterid integer NOT NULL
);


--
-- Name: smsspecialcharacter; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE smsspecialcharacter (
    specialcharacterid integer NOT NULL,
    name text,
    value text
);


--
-- Name: sqlview; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sqlview (
    sqlviewid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    sqlquery text NOT NULL,
    type character varying(40),
    cachestrategy character varying(40),
    externalaccess boolean,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: sqlviewattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sqlviewattributevalues (
    sqlviewid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: sqlviewusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sqlviewusergroupaccesses (
    sqlviewid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: systemsetting; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE systemsetting (
    systemsettingid integer NOT NULL,
    name character varying(255) NOT NULL,
    value bytea
);


--
-- Name: trackedentity; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentity (
    trackedentityid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text
);


--
-- Name: trackedentityattribute; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentityattribute (
    trackedentityattributeid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    shortname character varying(50),
    description text,
    valuetype character varying(36) NOT NULL,
    aggregationtype character varying(40) NOT NULL,
    trackedentityattributegroupid integer,
    optionsetid integer,
    trackedentityid integer,
    legendsetid integer,
    inherit boolean,
    expression character varying(255),
    displayonvisitschedule boolean,
    sortorderinvisitschedule integer,
    displayinlistnoprogram boolean,
    sortorderinlistnoprogram integer,
    confidential boolean,
    uniquefield boolean,
    generated boolean,
    pattern character varying(255),
    orgunitscope boolean,
    programscope boolean,
    searchscope character varying(40),
    userid integer,
    publicaccess character varying(8),
    sort_order integer
);


--
-- Name: trackedentityattributeattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentityattributeattributevalues (
    trackedentityattributeid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: trackedentityattributedimension; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentityattributedimension (
    trackedentityattributedimensionid integer NOT NULL,
    trackedentityattributeid integer,
    legendsetid integer,
    filter character varying(255)
);


--
-- Name: trackedentityattributegroup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentityattributegroup (
    trackedentityattributegroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    sortorder integer
);


--
-- Name: trackedentityattributegrouptranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentityattributegrouptranslations (
    trackedentityattributegroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: trackedentityattributereservedvalue; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentityattributereservedvalue (
    trackedentityattributereservedvalueid integer NOT NULL,
    trackedentityattributeid integer,
    trackedentityinstanceid integer,
    created timestamp without time zone,
    expirydate timestamp without time zone,
    value character varying(50000)
);


--
-- Name: trackedentityattributetranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentityattributetranslations (
    trackedentityattributeid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: trackedentityattributeusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentityattributeusergroupaccesses (
    trackedentityattributeid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: trackedentityattributevalue; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentityattributevalue (
    trackedentityinstanceid integer NOT NULL,
    trackedentityattributeid integer NOT NULL,
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    value character varying(50000),
    encryptedvalue character varying(50000)
);


--
-- Name: trackedentityattributevalueaudit; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentityattributevalueaudit (
    trackedentityattributevalueauditid integer NOT NULL,
    trackedentityinstanceid integer,
    trackedentityattributeid integer,
    value character varying(50000),
    encryptedvalue character varying(50000),
    created timestamp without time zone,
    modifiedby character varying(255),
    audittype character varying(100) NOT NULL
);


--
-- Name: trackedentityattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentityattributevalues (
    trackedentityid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: trackedentitycomment; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentitycomment (
    trackedentitycommentid integer NOT NULL,
    commenttext text,
    createddate timestamp without time zone,
    creator character varying(255)
);


--
-- Name: trackedentitydataelementdimension; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentitydataelementdimension (
    trackedentitydataelementdimensionid integer NOT NULL,
    dataelementid integer,
    legendsetid integer,
    filter character varying(255)
);


--
-- Name: trackedentitydatavalue; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentitydatavalue (
    programstageinstanceid integer NOT NULL,
    dataelementid integer NOT NULL,
    value character varying(50000),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    providedelsewhere boolean,
    storedby character varying(255)
);


--
-- Name: trackedentitydatavalueaudit; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentitydatavalueaudit (
    trackedentitydatavalueauditid integer NOT NULL,
    programstageinstanceid integer,
    dataelementid integer,
    value character varying(50000),
    created timestamp without time zone,
    providedelsewhere boolean,
    modifiedby character varying(255),
    audittype character varying(100) NOT NULL
);


--
-- Name: trackedentityinstance; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentityinstance (
    trackedentityinstanceid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    inactive boolean,
    representativeid integer,
    organisationunitid integer NOT NULL,
    trackedentityid integer
);


--
-- Name: trackedentityprogramindicatordimension; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentityprogramindicatordimension (
    trackedentityprogramindicatordimensionid integer NOT NULL,
    programindicatorid integer,
    legendsetid integer,
    filter character varying(255)
);


--
-- Name: trackedentitytranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackedentitytranslations (
    trackedentityid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: userapps; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE userapps (
    userinfoid integer NOT NULL,
    sort_order integer NOT NULL,
    app character varying(255)
);


--
-- Name: userattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE userattributevalues (
    userinfoid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: userdatavieworgunits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE userdatavieworgunits (
    userinfoid integer NOT NULL,
    organisationunitid integer NOT NULL
);


--
-- Name: usergroup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usergroup (
    usergroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: usergroupaccess; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usergroupaccess (
    usergroupaccessid integer NOT NULL,
    access character varying(255),
    usergroupid integer
);


--
-- Name: usergroupattributevalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usergroupattributevalues (
    usergroupid integer NOT NULL,
    attributevalueid integer NOT NULL
);


--
-- Name: usergroupmanaged; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usergroupmanaged (
    managedbygroupid integer NOT NULL,
    managedgroupid integer NOT NULL
);


--
-- Name: usergroupmembers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usergroupmembers (
    userid integer NOT NULL,
    usergroupid integer NOT NULL
);


--
-- Name: usergrouptranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usergrouptranslations (
    usergroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: usergroupusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usergroupusergroupaccesses (
    usergroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: userinfo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE userinfo (
    userinfoid integer NOT NULL,
    uid character varying(11),
    code character varying(50),
    lastupdated timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL,
    surname character varying(160) NOT NULL,
    firstname character varying(160) NOT NULL,
    email character varying(160),
    phonenumber character varying(80),
    jobtitle character varying(160),
    introduction text,
    gender character varying(50),
    birthday date,
    nationality character varying(160),
    employer character varying(160),
    education text,
    interests text,
    languages text,
    lastcheckedinterpretations timestamp without time zone
);


--
-- Name: userkeyjsonvalue; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE userkeyjsonvalue (
    userkeyjsonvalueid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    userid integer NOT NULL,
    namespace character varying(255) NOT NULL,
    userkey character varying(255) NOT NULL,
    value text,
    encrypted_value character varying(255),
    encrypted boolean
);


--
-- Name: usermembership; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usermembership (
    userinfoid integer NOT NULL,
    organisationunitid integer NOT NULL
);


--
-- Name: usermessage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usermessage (
    usermessageid integer NOT NULL,
    usermessagekey character varying(255),
    userid integer NOT NULL,
    isread boolean NOT NULL,
    isfollowup boolean
);


--
-- Name: userrole; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE userrole (
    userroleid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description character varying(255),
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: userroleauthorities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE userroleauthorities (
    userroleid integer NOT NULL,
    authority character varying(255)
);


--
-- Name: userroledataset; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE userroledataset (
    userroleid integer NOT NULL,
    datasetid integer NOT NULL
);


--
-- Name: userrolemembers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE userrolemembers (
    userid integer NOT NULL,
    userroleid integer NOT NULL
);


--
-- Name: userroletranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE userroletranslations (
    userroleid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: userroleusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE userroleusergroupaccesses (
    userroleid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    userid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    creatoruserid integer,
    username character varying(255) NOT NULL,
    password character varying(60),
    externalauth boolean,
    openid text,
    ldapid text,
    passwordlastupdated timestamp without time zone,
    lastlogin timestamp without time zone,
    restoretoken character varying(255),
    restorecode character varying(255),
    restoreexpiry timestamp without time zone,
    selfregistered boolean,
    invitation boolean,
    disabled boolean
);


--
-- Name: users_catdimensionconstraints; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users_catdimensionconstraints (
    userid integer NOT NULL,
    dataelementcategoryid integer NOT NULL
);


--
-- Name: users_cogsdimensionconstraints; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users_cogsdimensionconstraints (
    userid integer NOT NULL,
    categoryoptiongroupsetid integer NOT NULL
);


--
-- Name: usersetting; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usersetting (
    userinfoid integer NOT NULL,
    name character varying(255) NOT NULL,
    value bytea
);


--
-- Name: userteisearchorgunits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE userteisearchorgunits (
    userinfoid integer NOT NULL,
    organisationunitid integer NOT NULL
);


--
-- Name: validationcriteria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE validationcriteria (
    validationcriteriaid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description character varying(255),
    property character varying(255),
    operator integer NOT NULL,
    value bytea
);


--
-- Name: validationcriteriatranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE validationcriteriatranslations (
    validationcriteriaid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: validationrule; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE validationrule (
    validationruleid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    instruction text,
    importance character varying(50),
    operator character varying(255) NOT NULL,
    leftexpressionid integer,
    rightexpressionid integer,
    periodtypeid integer NOT NULL
);


--
-- Name: validationrulegroup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE validationrulegroup (
    validationrulegroupid integer NOT NULL,
    uid character varying(11) NOT NULL,
    code character varying(50),
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    name character varying(230) NOT NULL,
    description text,
    alertbyorgunits boolean,
    userid integer,
    publicaccess character varying(8)
);


--
-- Name: validationrulegroupmembers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE validationrulegroupmembers (
    validationgroupid integer NOT NULL,
    validationruleid integer NOT NULL
);


--
-- Name: validationrulegrouptranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE validationrulegrouptranslations (
    validationrulegroupid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: validationrulegroupusergroupaccesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE validationrulegroupusergroupaccesses (
    validationrulegroupid integer NOT NULL,
    usergroupaccessid integer NOT NULL
);


--
-- Name: validationrulegroupusergroupstoalert; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE validationrulegroupusergroupstoalert (
    validationgroupid integer NOT NULL,
    usergroupid integer NOT NULL
);


--
-- Name: validationruletranslations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE validationruletranslations (
    validationruleid integer NOT NULL,
    objecttranslationid integer NOT NULL
);


--
-- Name: version; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE version (
    versionid integer NOT NULL,
    versionkey character varying(230) NOT NULL,
    versionvalue character varying(255)
);


--
-- Data for Name: attribute; Type: TABLE DATA; Schema: public; Owner: -
--

COPY attribute (attributeid, uid, code, created, lastupdated, name, valuetype, mandatory, isunique, dataelementattribute, dataelementgroupattribute, indicatorattribute, indicatorgroupattribute, datasetattribute, organisationunitattribute, organisationunitgroupattribute, organisationunitgroupsetattribute, userattribute, usergroupattribute, programattribute, programstageattribute, trackedentityattribute, trackedentityattributeattribute, categoryoptionattribute, categoryoptiongroupattribute, documentattribute, optionattribute, optionsetattribute, constantattribute, legendsetattribute, programindicatorattribute, sqlviewattribute, sectionattribute, categoryoptioncomboattribute, sortorder, optionsetid) FROM stdin;
\.


--
-- Data for Name: attributetranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY attributetranslations (attributeid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: attributevalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY attributevalue (attributevalueid, created, lastupdated, value, attributeid) FROM stdin;
\.


--
-- Data for Name: categories_categoryoptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categories_categoryoptions (categoryid, sort_order, categoryoptionid) FROM stdin;
13	1	12
\.


--
-- Data for Name: categorycombo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categorycombo (categorycomboid, uid, code, created, lastupdated, name, datadimensiontype, skiptotal, userid, publicaccess) FROM stdin;
14	bjDvmb4bfuf	default	2017-07-04 13:42:44.223	2017-07-04 13:42:44.227	default	DISAGGREGATION	f	\N	--------
\.


--
-- Data for Name: categorycombos_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categorycombos_categories (categoryid, sort_order, categorycomboid) FROM stdin;
13	1	14
\.


--
-- Data for Name: categorycombos_optioncombos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categorycombos_optioncombos (categoryoptioncomboid, categorycomboid) FROM stdin;
15	14
\.


--
-- Data for Name: categorycombotranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categorycombotranslations (categorycomboid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: categorycombousergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categorycombousergroupaccesses (categorycomboid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: categorydimension; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categorydimension (categorydimensionid, categoryid) FROM stdin;
\.


--
-- Data for Name: categorydimension_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categorydimension_items (categorydimensionid, sort_order, categoryoptionid) FROM stdin;
\.


--
-- Data for Name: categoryoption_organisationunits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoryoption_organisationunits (organisationunitid, categoryoptionid) FROM stdin;
\.


--
-- Data for Name: categoryoptioncombo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoryoptioncombo (categoryoptioncomboid, uid, code, created, lastupdated, name, ignoreapproval) FROM stdin;
15	HllvX50cXC0	default	2017-07-04 13:42:44.225	2017-07-04 13:42:44.225	default	f
\.


--
-- Data for Name: categoryoptioncomboattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoryoptioncomboattributevalues (categoryoptioncomboid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: categoryoptioncombos_categoryoptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoryoptioncombos_categoryoptions (categoryoptionid, categoryoptioncomboid) FROM stdin;
12	15
\.


--
-- Data for Name: categoryoptioncombotranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoryoptioncombotranslations (categoryoptioncomboid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoryoptiongroup (categoryoptiongroupid, uid, code, created, lastupdated, name, shortname, datadimensiontype, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoryoptiongroupattributevalues (categoryoptiongroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupmembers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoryoptiongroupmembers (categoryoptiongroupid, categoryoptionid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoryoptiongroupset (categoryoptiongroupsetid, uid, code, created, lastupdated, name, description, datadimension, datadimensiontype, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupsetmembers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoryoptiongroupsetmembers (categoryoptiongroupid, categoryoptiongroupsetid, sort_order) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupsettranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoryoptiongroupsettranslations (categoryoptiongroupsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoryoptiongroupsetusergroupaccesses (categoryoptiongroupsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongrouptranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoryoptiongrouptranslations (categoryoptiongroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: categoryoptiongroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoryoptiongroupusergroupaccesses (categoryoptiongroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: categoryoptiontranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY categoryoptiontranslations (categoryoptionid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: chart; Type: TABLE DATA; Schema: public; Owner: -
--

COPY chart (chartid, uid, code, created, lastupdated, name, description, domainaxislabel, rangeaxislabel, type, series, category, hidelegend, regressiontype, hidetitle, hidesubtitle, targetlinevalue, targetlinelabel, baselinevalue, baselinelabel, relativeperiodsid, userorganisationunit, userorganisationunitchildren, userorganisationunitgrandchildren, aggregationtype, completedonly, title, subtitle, showdata, hideemptyrows, rangeaxismaxvalue, rangeaxisminvalue, rangeaxissteps, rangeaxisdecimals, sortorder, externalaccess, userid, publicaccess) FROM stdin;
908	mc8B9ek0TgH	\N	2017-07-06 22:09:39.966	2017-07-06 22:09:39.966	Avg Age in Years	\N	\N	\N	LINE	dx	pe	f	NONE	f	f	\N	\N	\N	\N	909	f	f	f	DEFAULT	f	\N	\N	t	f	\N	\N	\N	\N	0	f	46	rw------
\.


--
-- Data for Name: chart_categorydimensions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY chart_categorydimensions (chartid, sort_order, categorydimensionid) FROM stdin;
\.


--
-- Data for Name: chart_categoryoptiongroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY chart_categoryoptiongroups (chartid, sort_order, categoryoptiongroupid) FROM stdin;
\.


--
-- Data for Name: chart_datadimensionitems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY chart_datadimensionitems (chartid, sort_order, datadimensionitemid) FROM stdin;
908	0	907
\.


--
-- Data for Name: chart_dataelementgroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY chart_dataelementgroups (chartid, sort_order, dataelementgroupid) FROM stdin;
\.


--
-- Data for Name: chart_filters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY chart_filters (chartid, sort_order, filter) FROM stdin;
908	0	ou
\.


--
-- Data for Name: chart_itemorgunitgroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY chart_itemorgunitgroups (chartid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: chart_organisationunits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY chart_organisationunits (chartid, sort_order, organisationunitid) FROM stdin;
908	0	49
\.


--
-- Data for Name: chart_orgunitgroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY chart_orgunitgroups (chartid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: chart_orgunitlevels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY chart_orgunitlevels (chartid, sort_order, orgunitlevel) FROM stdin;
\.


--
-- Data for Name: chart_periods; Type: TABLE DATA; Schema: public; Owner: -
--

COPY chart_periods (chartid, sort_order, periodid) FROM stdin;
\.


--
-- Data for Name: charttranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY charttranslations (chartid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: chartusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY chartusergroupaccesses (chartid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: color; Type: TABLE DATA; Schema: public; Owner: -
--

COPY color (colorid, uid, code, created, lastupdated, name, color) FROM stdin;
\.


--
-- Data for Name: colorset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY colorset (colorsetid, uid, code, created, lastupdated, name) FROM stdin;
\.


--
-- Data for Name: colorset_colors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY colorset_colors (colorsetid, sort_order, colorid) FROM stdin;
\.


--
-- Data for Name: colorsettranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY colorsettranslations (colorsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: colortranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY colortranslations (colorid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: completedatasetregistration; Type: TABLE DATA; Schema: public; Owner: -
--

COPY completedatasetregistration (datasetid, periodid, sourceid, attributeoptioncomboid, date, storedby) FROM stdin;
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: -
--

COPY configuration (configurationid, systemid, feedbackrecipientsid, offlineorgunitlevelid, infrastructuralindicatorsid, infrastructuraldataelementsid, infrastructuralperiodtypeid, selfregistrationrole, selfregistrationorgunit) FROM stdin;
17	c3e74eeb-dbd3-471f-a693-1708ad57f793	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: configuration_corswhitelist; Type: TABLE DATA; Schema: public; Owner: -
--

COPY configuration_corswhitelist (configurationid, corswhitelist) FROM stdin;
\.


--
-- Data for Name: constant; Type: TABLE DATA; Schema: public; Owner: -
--

COPY constant (constantid, uid, code, created, lastupdated, name, shortname, description, value, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: constantattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY constantattributevalues (constantid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: constanttranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY constanttranslations (colorid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: constantusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY constantusergroupaccesses (constantid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dashboard; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dashboard (dashboardid, uid, code, created, lastupdated, name, userid, externalaccess, publicaccess) FROM stdin;
895	qESvusRZUSS	\N	2017-07-06 22:06:39.918	2017-07-06 22:18:05.748	Verbal Autopsy	46	f	r-------
\.


--
-- Data for Name: dashboard_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dashboard_items (dashboardid, sort_order, dashboarditemid) FROM stdin;
895	0	920
895	1	910
895	2	896
\.


--
-- Data for Name: dashboarditem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dashboarditem (dashboarditemid, uid, code, created, lastupdated, chartid, eventchartid, mapid, reporttable, eventreport, messages, appkey, shape) FROM stdin;
896	M8ECXvCC08V	\N	2017-07-06 22:06:50.484	2017-07-06 22:06:53.576	\N	\N	\N	\N	893	\N	\N	FULL_WIDTH
910	fMlApYxw1l3	\N	2017-07-06 22:09:47.846	2017-07-06 22:09:47.846	908	\N	\N	\N	\N	\N	\N	\N
920	emTKZAfvKrk	\N	2017-07-06 22:12:05.002	2017-07-06 22:12:13.062	\N	918	\N	\N	\N	\N	\N	DOUBLE_WIDTH
\.


--
-- Data for Name: dashboarditem_reports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dashboarditem_reports (dashboarditemid, sort_order, reportid) FROM stdin;
\.


--
-- Data for Name: dashboarditem_resources; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dashboarditem_resources (dashboarditemid, sort_order, resourceid) FROM stdin;
\.


--
-- Data for Name: dashboarditem_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dashboarditem_users (dashboarditemid, sort_order, userid) FROM stdin;
\.


--
-- Data for Name: dashboarditemtranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dashboarditemtranslations (dashboarditemid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dashboardtranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dashboardtranslations (dashboardid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dashboardusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dashboardusergroupaccesses (dashboardid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataapproval; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataapproval (dataapprovalid, dataapprovallevelid, workflowid, periodid, organisationunitid, attributeoptioncomboid, accepted, created, creator) FROM stdin;
\.


--
-- Data for Name: dataapprovallevel; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataapprovallevel (dataapprovallevelid, uid, code, created, lastupdated, name, level, orgunitlevel, categoryoptiongroupsetid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: dataapprovalleveltranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataapprovalleveltranslations (dataapprovallevelid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataapprovallevelusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataapprovallevelusergroupaccesses (dataapprovallevelid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataapprovalworkflow; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataapprovalworkflow (workflowid, uid, code, created, lastupdated, name, periodtypeid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: dataapprovalworkflowlevels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataapprovalworkflowlevels (workflowid, dataapprovallevelid) FROM stdin;
\.


--
-- Data for Name: dataapprovalworkflowtranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataapprovalworkflowtranslations (workflowid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataapprovalworkflowusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataapprovalworkflowusergroupaccesses (workflowid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: datadimensionitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datadimensionitem (datadimensionitemid, indicatorid, dataelementid, dataelementoperandid, datasetid, metric, programindicatorid, programdataelementid, programattributeid) FROM stdin;
907	\N	\N	\N	\N	\N	\N	906	\N
\.


--
-- Data for Name: dataelement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelement (dataelementid, uid, code, created, lastupdated, name, shortname, description, formname, valuetype, domaintype, aggregationtype, categorycomboid, url, zeroissignificant, optionsetid, commentoptionsetid, legendsetid, userid, publicaccess) FROM stdin;
86	htm6PixLJNy	VA-01	2017-07-04 16:30:38.329	2017-07-04 16:30:38.329	VA-01-Verbal Autopsy ID	VA ID	The ID from the Verbal Autopsy conducted	Verbal Autopsy ID	TEXT	TRACKER	NONE	14	\N	f	\N	\N	\N	46	rw------
88	mwSaVq64k7j	VA-03	2017-07-04 16:30:38.329	2017-07-04 16:30:38.329	VA-03-Date of Birth	DoB	Date of birth (if known)	Date of Birth	DATE	TRACKER	AVERAGE	14	\N	f	\N	\N	\N	46	rw------
89	oPAg4MA0880	VA-04	2017-07-04 16:30:38.329	2017-07-04 16:30:38.329	VA-04-Age (in Years)	Age	Age of person in years	Age (in Years)	NUMBER	TRACKER	AVERAGE	14	\N	t	\N	\N	\N	46	rw------
90	F4XGdOBvWww	VA-05	2017-07-04 16:30:38.329	2017-07-04 16:30:38.329	VA-05-Most probable Cause of Death	Cause of Death	Most probable Cause of Death determined by Verbal Autopsy	Most probable Cause of Death	TEXT	TRACKER	NONE	14	\N	f	63	\N	\N	46	rw------
91	XLHIBoLtjGt	VA-06	2017-07-04 16:30:38.329	2017-07-04 16:30:38.329	VA-06-Verbal Autopsy metadata	VA metadata	SQLite file holding VA raw data	Verbal Autopsy metadata	FILE_RESOURCE	TRACKER	NONE	14	\N	f	\N	\N	\N	46	rw------
87	hi7qRC4SMMk	VA-02	2017-07-04 16:30:38.329	2017-07-05 15:11:24.528	VA-02-Sex	Sex	Sex of the patient (male or female)	Sex	TEXT	TRACKER	NONE	14	\N	f	71	\N	\N	46	rw------
\.


--
-- Data for Name: dataelementaggregationlevels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementaggregationlevels (dataelementid, sort_order, aggregationlevel) FROM stdin;
\.


--
-- Data for Name: dataelementattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementattributevalues (dataelementid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: dataelementcategory; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementcategory (categoryid, uid, code, created, lastupdated, name, datadimensiontype, datadimension, userid, publicaccess) FROM stdin;
13	GLevLNI9wkl	default	2017-07-04 13:42:44.22	2017-07-04 13:42:44.273	default	DISAGGREGATION	f	\N	--------
\.


--
-- Data for Name: dataelementcategoryoption; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementcategoryoption (categoryoptionid, uid, code, created, lastupdated, name, shortname, startdate, enddate, userid, publicaccess) FROM stdin;
12	xYerKDKCefk	default	2017-07-04 13:42:44.203	2017-07-04 13:42:44.23	default	default	\N	\N	\N	--------
\.


--
-- Data for Name: dataelementcategoryoptionattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementcategoryoptionattributevalues (categoryoptionid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: dataelementcategoryoptionusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementcategoryoptionusergroupaccesses (categoryoptionid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataelementcategorytranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementcategorytranslations (categoryid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataelementcategoryusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementcategoryusergroupaccesses (categoryid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataelementgroup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementgroup (dataelementgroupid, uid, code, created, lastupdated, name, shortname, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: dataelementgroupattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementgroupattributevalues (dataelementgroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupmembers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementgroupmembers (dataelementgroupid, dataelementid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementgroupset (dataelementgroupsetid, uid, code, created, lastupdated, name, description, compulsory, datadimension, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: dataelementgroupsetmembers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementgroupsetmembers (dataelementgroupid, dataelementgroupsetid, sort_order) FROM stdin;
\.


--
-- Data for Name: dataelementgroupsettranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementgroupsettranslations (dataelementgroupsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementgroupsetusergroupaccesses (dataelementgroupsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataelementgrouptranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementgrouptranslations (dataelementgroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataelementgroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementgroupusergroupaccesses (dataelementgroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataelementoperand; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementoperand (dataelementoperandid, dataelementid, categoryoptioncomboid) FROM stdin;
\.


--
-- Data for Name: dataelementtranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementtranslations (dataelementid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataelementusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementusergroupaccesses (dataelementid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: dataentryform; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataentryform (dataentryformid, uid, code, created, lastupdated, name, style, htmlcode, format) FROM stdin;
\.


--
-- Data for Name: dataentryformtranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataentryformtranslations (dataentryformid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: dataset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataset (datasetid, uid, code, created, lastupdated, name, shortname, description, periodtypeid, categorycomboid, dataentryform, mobile, version, expirydays, timelydays, startdate, enddate, notifycompletinguser, workflowid, openfutureperiods, fieldcombinationrequired, validcompleteonly, novaluerequirescomment, skipoffline, dataelementdecoration, renderastabs, renderhorizontally, legendsetid, userid, publicaccess, notificationrecipients) FROM stdin;
\.


--
-- Data for Name: datasetattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datasetattributevalues (datasetid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: datasetelement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datasetelement (datasetelementid, uid, code, created, lastupdated, datasetid, dataelementid, categorycomboid) FROM stdin;
\.


--
-- Data for Name: datasetindicators; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datasetindicators (datasetid, indicatorid) FROM stdin;
\.


--
-- Data for Name: datasetoperands; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datasetoperands (datasetid, dataelementoperandid) FROM stdin;
\.


--
-- Data for Name: datasetsectiontranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datasetsectiontranslations (sectionid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: datasetsource; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datasetsource (datasetid, sourceid) FROM stdin;
\.


--
-- Data for Name: datasettranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datasettranslations (datasetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: datasetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datasetusergroupaccesses (datasetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: datastatistics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datastatistics (statisticsid, uid, code, created, lastupdated, chartviews, mapviews, reporttableviews, eventreportviews, eventchartviews, dashboardviews, datasetreportviews, active_users, totalviews, charts, maps, reporttables, eventreports, eventcharts, dashboards, indicators, datavalues, users) FROM stdin;
105	jnTIF06TOUd	\N	2017-07-05 02:00:00.092	2017-07-05 02:00:00.092	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
116	D6l1QHXzPXi	\N	2017-07-06 02:00:00.024	2017-07-06 02:00:00.024	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
929	nhYki03tmZ8	\N	2017-07-07 02:00:00.018	2017-07-07 02:00:00.018	7	\N	2	2	16	\N	\N	0	27	1	0	0	1	1	1	0	0	2
931	OVZ1nJIy2aP	\N	2017-07-08 02:00:00.032	2017-07-08 02:00:00.032	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
932	s4pWixxwlLT	\N	2017-07-09 02:00:00.023	2017-07-09 02:00:00.023	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
933	kIwKqlvaYqO	\N	2017-07-10 02:00:00.023	2017-07-10 02:00:00.023	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
934	ZsqTDc0Idav	\N	2017-07-11 02:00:00.01	2017-07-11 02:00:00.01	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
937	aAGsCKI1MoL	\N	2017-07-12 02:00:00.024	2017-07-12 02:00:00.024	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
938	kwisAwnOgss	\N	2017-07-13 02:00:00.021	2017-07-13 02:00:00.021	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
939	QgmMt9Fzd3b	\N	2017-07-14 02:00:00.016	2017-07-14 02:00:00.016	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
940	NTNAuORMuM2	\N	2017-07-15 02:00:00.021	2017-07-15 02:00:00.021	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
941	riEXz1tRVwa	\N	2017-07-16 02:00:00.017	2017-07-16 02:00:00.017	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
942	yqM7nYx64AG	\N	2017-07-17 02:00:00.026	2017-07-17 02:00:00.026	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
943	KES2nmVFbPa	\N	2017-07-18 02:00:00.028	2017-07-18 02:00:00.028	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
944	LP8Zg96qIiJ	\N	2017-07-19 02:00:00.029	2017-07-19 02:00:00.029	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
945	TNZDEOxE3z8	\N	2017-07-20 02:00:00.032	2017-07-20 02:00:00.032	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
946	pPH4DzXq2O5	\N	2017-07-21 02:00:00.027	2017-07-21 02:00:00.027	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
947	aGkY7lb9YEQ	\N	2017-07-22 02:00:00.029	2017-07-22 02:00:00.029	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
948	jrOPK9yYZHC	\N	2017-07-23 02:00:00.03	2017-07-23 02:00:00.03	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
949	BjpoDRkmVYl	\N	2017-07-24 02:00:00.025	2017-07-24 02:00:00.025	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
950	IgBhqTtlIDi	\N	2017-07-25 02:00:00.014	2017-07-25 02:00:00.014	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
951	miZEoQhzyf2	\N	2017-07-26 02:00:00.025	2017-07-26 02:00:00.025	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
952	WAHvkQgxUlH	\N	2017-07-27 02:00:00.022	2017-07-27 02:00:00.022	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
953	edT1MoAJ805	\N	2017-07-28 02:00:00.026	2017-07-28 02:00:00.026	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
954	Edmj3fKIQeq	\N	2017-07-29 02:00:00.017	2017-07-29 02:00:00.017	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
955	WqfcHzdeBP9	\N	2017-07-30 02:00:00.021	2017-07-30 02:00:00.021	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
956	AGieES3WXYr	\N	2017-07-31 02:00:00.019	2017-07-31 02:00:00.019	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
957	WsFudkGYyHh	\N	2017-08-01 02:00:00.025	2017-08-01 02:00:00.025	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
958	JW4JSWDiJ7Q	\N	2017-08-02 02:00:00.016	2017-08-02 02:00:00.016	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
959	L3HfuDrkKyj	\N	2017-08-03 02:00:00.031	2017-08-03 02:00:00.031	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
960	kHnOPrxBk3L	\N	2017-08-04 02:00:00.017	2017-08-04 02:00:00.017	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
961	nh7ujaOxxik	\N	2017-08-05 02:00:00.019	2017-08-05 02:00:00.019	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
962	uNaYFl0781I	\N	2017-08-06 02:00:00.012	2017-08-06 02:00:00.012	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
963	SRSocaNUMdv	\N	2017-08-07 02:00:00.025	2017-08-07 02:00:00.025	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
964	FyYZIbuggA7	\N	2017-08-08 02:00:00.019	2017-08-08 02:00:00.019	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
965	eXOkHVYIkzZ	\N	2017-08-09 02:00:00.022	2017-08-09 02:00:00.022	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
966	i68v7SvBwKF	\N	2017-08-10 02:00:00.015	2017-08-10 02:00:00.015	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
967	wiUT9yoBCoW	\N	2017-08-11 02:00:00.024	2017-08-11 02:00:00.024	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
968	b6Ly5O1Q5MF	\N	2017-08-12 02:00:00.02	2017-08-12 02:00:00.02	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
969	tL76PqZBQqb	\N	2017-08-13 02:00:00.013	2017-08-13 02:00:00.013	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
970	i7EncIpXaYQ	\N	2017-08-14 02:00:00.019	2017-08-14 02:00:00.019	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
971	BgmZYUuhqTE	\N	2017-08-15 02:00:00.022	2017-08-15 02:00:00.022	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
972	vMmLd0ekIu6	\N	2017-08-16 02:00:00.017	2017-08-16 02:00:00.017	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
973	BkDVepBSPPV	\N	2017-08-17 02:00:00.014	2017-08-17 02:00:00.014	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
984	WDGL0QGEjr1	\N	2017-08-18 02:00:00.014	2017-08-18 02:00:00.014	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
985	VzhG4Lbcf5f	\N	2017-08-19 02:00:00.02	2017-08-19 02:00:00.02	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
986	IrbOGHyweDf	\N	2017-08-20 02:00:00.016	2017-08-20 02:00:00.016	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
987	mhin1GdJqY6	\N	2017-08-21 02:00:00.027	2017-08-21 02:00:00.027	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
988	gFd3aINhxTF	\N	2017-08-22 02:00:00.029	2017-08-22 02:00:00.029	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
989	GibYvfnyxAv	\N	2017-08-23 02:00:00.017	2017-08-23 02:00:00.017	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	0	0	0	0	0	0	2
\.


--
-- Data for Name: datastatisticsevent; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datastatisticsevent (eventid, eventtype, "timestamp", username, favoriteuid) FROM stdin;
238	REPORT_TABLE_VIEW	2017-07-06 18:13:10.164	admin	\N
239	REPORT_TABLE_VIEW	2017-07-06 18:13:18.611	admin	\N
640	EVENT_REPORT_VIEW	2017-07-06 18:27:31.681	admin	\N
641	EVENT_REPORT_VIEW	2017-07-06 18:27:39.562	admin	\N
897	EVENT_CHART_VIEW	2017-07-06 22:07:13.599	admin	\N
898	EVENT_CHART_VIEW	2017-07-06 22:07:46.899	admin	\N
899	CHART_VIEW	2017-07-06 22:08:16.387	admin	\N
900	CHART_VIEW	2017-07-06 22:08:30.177	admin	\N
901	CHART_VIEW	2017-07-06 22:08:38.439	admin	\N
902	CHART_VIEW	2017-07-06 22:08:46.051	admin	\N
903	CHART_VIEW	2017-07-06 22:09:22.723	admin	\N
904	CHART_VIEW	2017-07-06 22:09:25.923	admin	\N
905	CHART_VIEW	2017-07-06 22:09:34.24	admin	\N
911	EVENT_CHART_VIEW	2017-07-06 22:10:29.45	admin	\N
912	EVENT_CHART_VIEW	2017-07-06 22:10:41.492	admin	\N
913	EVENT_CHART_VIEW	2017-07-06 22:10:47.262	admin	\N
914	EVENT_CHART_VIEW	2017-07-06 22:10:56.423	admin	\N
915	EVENT_CHART_VIEW	2017-07-06 22:11:09.717	admin	\N
916	EVENT_CHART_VIEW	2017-07-06 22:11:17.631	admin	\N
921	EVENT_CHART_VIEW	2017-07-06 22:13:31.295	admin	MeoOYaxIOvK
922	EVENT_CHART_VIEW	2017-07-06 22:14:36.243	admin	\N
923	EVENT_CHART_VIEW	2017-07-06 22:14:49.636	admin	\N
924	EVENT_CHART_VIEW	2017-07-06 22:15:10.71	admin	\N
925	EVENT_CHART_VIEW	2017-07-06 22:15:15.903	admin	\N
926	EVENT_CHART_VIEW	2017-07-06 22:15:23.515	admin	\N
927	EVENT_CHART_VIEW	2017-07-06 22:15:34.072	admin	\N
928	EVENT_CHART_VIEW	2017-07-06 22:15:40.362	admin	\N
\.


--
-- Data for Name: datavalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datavalue (dataelementid, periodid, sourceid, categoryoptioncomboid, attributeoptioncomboid, value, storedby, created, lastupdated, comment, followup, deleted) FROM stdin;
\.


--
-- Data for Name: datavalueaudit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datavalueaudit (datavalueauditid, dataelementid, periodid, organisationunitid, categoryoptioncomboid, attributeoptioncomboid, value, created, modifiedby, audittype) FROM stdin;
\.


--
-- Data for Name: document; Type: TABLE DATA; Schema: public; Owner: -
--

COPY document (documentid, uid, code, created, lastupdated, name, url, external, contenttype, attachment, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: documentattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY documentattributevalues (documentid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: documenttranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY documenttranslations (documentid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: documentusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY documentusergroupaccesses (documentid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: eventchart; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventchart (eventchartid, uid, code, created, lastupdated, name, description, relativeperiodsid, userorganisationunit, userorganisationunitchildren, userorganisationunitgrandchildren, programid, programstageid, startdate, enddate, dataelementvaluedimensionid, attributevaluedimensionid, aggregationtype, completedonly, title, subtitle, type, showdata, hideemptyrows, hidenadata, rangeaxismaxvalue, rangeaxisminvalue, rangeaxissteps, rangeaxisdecimals, outputtype, collapsedatadimensions, domainaxislabel, rangeaxislabel, hidelegend, hidetitle, hidesubtitle, regressiontype, targetlinevalue, targetlinelabel, baselinevalue, baselinelabel, sortorder, externalaccess, userid, publicaccess) FROM stdin;
918	MeoOYaxIOvK	\N	2017-07-06 22:11:54.928	2017-07-06 22:11:54.928	Cause of Death stacked last 12 months	\N	919	f	f	f	92	93	\N	\N	\N	\N	\N	f	\N	\N	STACKED_COLUMN	t	f	f	\N	\N	\N	\N	EVENT	f	\N	\N	f	f	f	NONE	\N	\N	\N	\N	0	f	46	rw------
\.


--
-- Data for Name: eventchart_attributedimensions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventchart_attributedimensions (eventchartid, sort_order, trackedentityattributedimensionid) FROM stdin;
\.


--
-- Data for Name: eventchart_columns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventchart_columns (eventchartid, sort_order, dimension) FROM stdin;
918	0	F4XGdOBvWww
\.


--
-- Data for Name: eventchart_dataelementdimensions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventchart_dataelementdimensions (eventchartid, sort_order, trackedentitydataelementdimensionid) FROM stdin;
918	0	917
\.


--
-- Data for Name: eventchart_filters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventchart_filters (eventchartid, sort_order, dimension) FROM stdin;
918	0	ou
\.


--
-- Data for Name: eventchart_itemorgunitgroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventchart_itemorgunitgroups (eventchartid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: eventchart_organisationunits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventchart_organisationunits (eventchartid, sort_order, organisationunitid) FROM stdin;
918	0	49
\.


--
-- Data for Name: eventchart_orgunitgroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventchart_orgunitgroups (eventchartid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: eventchart_orgunitlevels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventchart_orgunitlevels (eventchartid, sort_order, orgunitlevel) FROM stdin;
\.


--
-- Data for Name: eventchart_periods; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventchart_periods (eventchartid, sort_order, periodid) FROM stdin;
\.


--
-- Data for Name: eventchart_programindicatordimensions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventchart_programindicatordimensions (eventchartid, sort_order, trackedentityprogramindicatordimensionid) FROM stdin;
\.


--
-- Data for Name: eventchart_rows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventchart_rows (eventchartid, sort_order, dimension) FROM stdin;
918	0	pe
\.


--
-- Data for Name: eventcharttranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventcharttranslations (eventchartid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: eventchartusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventchartusergroupaccesses (eventchartid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: eventreport; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventreport (eventreportid, uid, code, created, lastupdated, name, description, relativeperiodsid, userorganisationunit, userorganisationunitchildren, userorganisationunitgrandchildren, programid, programstageid, startdate, enddate, dataelementvaluedimensionid, attributevaluedimensionid, aggregationtype, completedonly, title, datatype, rowtotals, coltotals, rowsubtotals, colsubtotals, hideemptyrows, hidenadata, showhierarchy, outputtype, collapsedatadimensions, showdimensionlabels, digitgroupseparator, displaydensity, fontsize, sortorder, toplimit, externalaccess, userid, publicaccess) FROM stdin;
893	EIL392U1sF8	\N	2017-07-06 22:05:59.964	2017-07-06 22:05:59.964	VA Events Last 12 months	\N	894	f	f	f	92	93	\N	\N	\N	\N	\N	f	\N	EVENTS	f	t	f	t	f	f	f	\N	f	t	SPACE	NORMAL	NORMAL	0	0	f	46	rw------
\.


--
-- Data for Name: eventreport_attributedimensions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventreport_attributedimensions (eventreportid, sort_order, trackedentityattributedimensionid) FROM stdin;
\.


--
-- Data for Name: eventreport_columns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventreport_columns (eventreportid, sort_order, dimension) FROM stdin;
893	0	pe
893	1	ou
893	2	htm6PixLJNy
893	3	hi7qRC4SMMk
893	4	mwSaVq64k7j
893	5	oPAg4MA0880
893	6	F4XGdOBvWww
893	7	XLHIBoLtjGt
\.


--
-- Data for Name: eventreport_dataelementdimensions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventreport_dataelementdimensions (eventreportid, sort_order, trackedentitydataelementdimensionid) FROM stdin;
893	0	887
893	1	888
893	2	889
893	3	890
893	4	891
893	5	892
\.


--
-- Data for Name: eventreport_filters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventreport_filters (eventreportid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: eventreport_itemorgunitgroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventreport_itemorgunitgroups (eventreportid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: eventreport_organisationunits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventreport_organisationunits (eventreportid, sort_order, organisationunitid) FROM stdin;
893	0	51
\.


--
-- Data for Name: eventreport_orgunitgroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventreport_orgunitgroups (eventreportid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: eventreport_orgunitlevels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventreport_orgunitlevels (eventreportid, sort_order, orgunitlevel) FROM stdin;
\.


--
-- Data for Name: eventreport_periods; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventreport_periods (eventreportid, sort_order, periodid) FROM stdin;
\.


--
-- Data for Name: eventreport_programindicatordimensions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventreport_programindicatordimensions (eventreportid, sort_order, trackedentityprogramindicatordimensionid) FROM stdin;
\.


--
-- Data for Name: eventreport_rows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventreport_rows (eventreportid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: eventreporttranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventreporttranslations (eventreportid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: eventreportusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY eventreportusergroupaccesses (eventreportid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: expression; Type: TABLE DATA; Schema: public; Owner: -
--

COPY expression (expressionid, description, expression, missingvaluestrategy) FROM stdin;
\.


--
-- Data for Name: expressiondataelement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY expressiondataelement (expressionid, dataelementid) FROM stdin;
\.


--
-- Data for Name: expressionsampleelement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY expressionsampleelement (expressionid, dataelementid) FROM stdin;
\.


--
-- Data for Name: externalfileresource; Type: TABLE DATA; Schema: public; Owner: -
--

COPY externalfileresource (externalfileresourceid, uid, code, created, lastupdated, accesstoken, expires, fileresourceid) FROM stdin;
\.


--
-- Data for Name: externalmaplayer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY externalmaplayer (externalmaplayerid, uid, code, created, lastupdated, name, attribution, url, legendseturl, maplayerposition, layers, imageformat, mapservice, legendsetid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: externalmaplayerusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY externalmaplayerusergroupaccesses (externalmaplayerid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: fileresource; Type: TABLE DATA; Schema: public; Owner: -
--

COPY fileresource (fileresourceid, uid, code, created, lastupdated, name, contenttype, contentlength, contentmd5, storagekey, isassigned, storagestatus, domain, userid) FROM stdin;
108	IjmqTYdr41h	\N	2017-07-05 15:10:45.073	2017-07-05 15:10:49.23	dataelements.csv	application/vnd.ms-excel	977	2c34ec65c97b7edf51f22e10d131039a	dataValue/147e7af4-d655-4911-85bf-86f434f43781	t	STORED	DATA_VALUE	46
440	Sj7ENSpxmgx	\N	2017-07-06 18:26:04.097	2017-07-06 18:26:36.622	210a071e-d517-499a-9c23-67d32d4e994c.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/d8c987a1-a1e8-4467-b634-790793e22aad	t	STORED	DATA_VALUE	46
451	RHL7gc4AUkY	\N	2017-07-06 18:26:07.14	2017-07-06 18:26:36.715	84b8542c-11e4-44ef-9b5e-f63f6aea3e16.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/8f1df8ae-4fa4-4e4d-a2ba-a94e0de397a7	t	STORED	DATA_VALUE	46
441	qXhYY9ZdBXs	\N	2017-07-06 18:26:04.334	2017-07-06 18:26:36.641	907899cc-14c9-48a8-bb1a-7472b9ceb8f5.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/cba5d8c1-8d73-437d-9175-29c192dd7d78	t	STORED	DATA_VALUE	46
442	Qx5mfVwQNcS	\N	2017-07-06 18:26:04.641	2017-07-06 18:26:36.653	2ea544c9-66fb-4f7d-b080-71e06792db68.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/17f504d2-01c7-43d8-ba38-97b9b7932960	t	STORED	DATA_VALUE	46
443	s7kXyejtQd7	\N	2017-07-06 18:26:04.947	2017-07-06 18:26:36.66	de66430a-4ee0-46f0-9754-0b43ac1a7aa7.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/cf576630-024f-4fa6-a376-a32eaf6ebbbf	t	STORED	DATA_VALUE	46
457	vdUul9g5awN	\N	2017-07-06 18:26:08.882	2017-07-06 18:26:36.753	20811de0-54a2-44e9-957a-bf0403df76a1.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/8dcd0c4c-30f0-4f4e-9eca-6673b2f52e66	t	STORED	DATA_VALUE	46
467	PuRxrmYF0CG	\N	2017-07-06 18:26:11.674	2017-07-06 18:26:36.813	59769f15-3c21-47ca-a458-e19b0fb21227.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/0b1b9e4a-68ce-4d5f-a732-2ca99b50632a	t	STORED	DATA_VALUE	46
481	xuSxwRSXqZp	\N	2017-07-06 18:26:15.711	2017-07-06 18:26:36.907	00dc6fcb-33d8-4f6d-b871-751528deb1f0.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/d99d5b4e-0718-435c-8c16-d674477b4f9f	t	STORED	DATA_VALUE	46
482	uyZbe2qGp2d	\N	2017-07-06 18:26:15.938	2017-07-06 18:26:36.914	cb57f9b9-b69b-4cb0-860f-c46f2ef0fc17.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/e471699b-3d9f-4b77-9587-f9c7d69bf3e1	t	STORED	DATA_VALUE	46
694	THuJaOYHYKz	\N	2017-07-06 18:41:37.614	2017-07-06 18:42:08.412	f2682bd7-535b-4edb-aca7-3f16536aca3b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/82213c00-4592-4d5a-94d0-1eca60ff29af	t	STORED	DATA_VALUE	46
267	mWYYWe3JIMe	\N	2017-07-06 18:24:53.606	2017-07-06 18:25:19.443	9de34473-1d95-4862-9040-6eb265279570.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f51eea7c-ba5c-490c-8fbc-87390f0da7e6	t	STORED	DATA_VALUE	46
687	iji5Rqv5u4G	\N	2017-07-06 18:41:35.771	2017-07-06 18:42:08.353	bb225117-ae44-414f-af1d-d3d3e72203f0.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/1ee31d66-d1b2-4abd-8c7a-5a92ba15765b	t	STORED	DATA_VALUE	46
458	s13T0B5CPRp	\N	2017-07-06 18:26:09.123	2017-07-06 18:26:36.759	21f78457-fbc9-467b-95d3-613a35fa14d8.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/95f37aed-8e0b-4b41-8000-093086d2b774	t	STORED	DATA_VALUE	46
476	BTWnJw7cRjz	\N	2017-07-06 18:26:14.067	2017-07-06 18:26:36.87	0c097e16-d5f6-4619-820c-b5dc24c29ac4.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/27592264-7cac-4e8a-99bc-c9b4b2c2efbb	t	STORED	DATA_VALUE	46
477	V0iM4MAIY7U	\N	2017-07-06 18:26:14.401	2017-07-06 18:26:36.877	78c47139-6373-4edc-908f-10d022ad436e.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/5410ed1c-0aca-44d2-947e-1c2e167356af	t	STORED	DATA_VALUE	46
478	O9TQpEDQC6C	\N	2017-07-06 18:26:14.692	2017-07-06 18:26:36.885	988e51d8-2031-49da-8b95-71a721f4e8cb.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/834d6409-c07f-428e-b1f1-b5dedfd94732	t	STORED	DATA_VALUE	46
479	i4LSgNtU5ds	\N	2017-07-06 18:26:15.02	2017-07-06 18:26:36.893	bebc2d18-db98-489b-8b00-1ca4a927b97f.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/d4744021-41da-46b7-82b1-edbe1973146d	t	STORED	DATA_VALUE	46
480	zZFsV8JYzCe	\N	2017-07-06 18:26:15.302	2017-07-06 18:26:36.901	39373552-bd18-498b-82f3-1e68d99d4bea.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/38ebfed1-90e7-4d58-b57b-0e5ca0dc5bfa	t	STORED	DATA_VALUE	46
490	oZQAA5JV2ED	\N	2017-07-06 18:26:18.154	2017-07-06 18:26:36.975	3ff7090e-87a4-4344-b449-7fc56efbc8ba.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/91f92652-6f3b-4780-9226-7673f67549d4	t	STORED	DATA_VALUE	46
491	DwS3266rBtO	\N	2017-07-06 18:26:18.338	2017-07-06 18:26:36.983	7e851806-542c-453a-95b9-3b736f7fe548.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/953a18ec-3f6f-4138-86d3-3f2bd775027a	t	STORED	DATA_VALUE	46
492	nws8JSFirm3	\N	2017-07-06 18:26:18.535	2017-07-06 18:26:36.988	3e0eaf31-48fe-4410-b068-f0b192c41730.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/b4aee5ef-8ceb-4bc9-8a37-2ae5903fca5d	t	STORED	DATA_VALUE	46
493	bG8t4KbZrz9	\N	2017-07-06 18:26:18.844	2017-07-06 18:26:37.042	6cc91999-ddce-4d66-b0cb-95a2f17898c7.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/83f48d30-bd7b-4232-9a40-149ad72fae09	t	STORED	DATA_VALUE	46
494	vMgrPxsIWAt	\N	2017-07-06 18:26:19.059	2017-07-06 18:26:37.054	6d884dff-55e2-416b-96aa-79c1d2f3760c.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/999e0527-27df-4cb0-9ccd-62fafaf9e35a	t	STORED	DATA_VALUE	46
689	x4d9eBNFnQU	\N	2017-07-06 18:41:36.28	2017-07-06 18:42:08.379	b1dbdd2d-6377-419c-be7a-bc44125f6684.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/cc286f65-e2f8-4227-be18-3fbff95159ea	t	STORED	DATA_VALUE	46
269	iW6fm060hZ2	\N	2017-07-06 18:24:54.08	2017-07-06 18:25:19.462	0dc8d328-010c-4eb4-b028-47daca2f589d.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/c08bfef9-2409-4ec6-a7de-e897972cef90	t	STORED	DATA_VALUE	46
323	D51c6ihJo3a	\N	2017-07-06 18:25:09.364	2017-07-06 18:25:19.855	124d0072-6563-49cd-9f4c-0cfe234eaf4d.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/8f76aa67-6e4b-4cc2-9995-ce3cffc0f574	t	STORED	DATA_VALUE	46
495	x0jFMk95F2K	\N	2017-07-06 18:26:19.376	2017-07-06 18:26:37.064	8cbfdf02-395a-4d96-834c-2632f4d31c88.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/36e10694-9fc1-47ad-9c6b-632674c38af9	t	STORED	DATA_VALUE	46
496	zTlSa1INIUn	\N	2017-07-06 18:26:19.668	2017-07-06 18:26:37.075	4202dd1c-1ad3-4d3c-bfa4-9f65aa90c7c7.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/ed5a449e-bc8d-45a6-8397-e2065d4ec850	t	STORED	DATA_VALUE	46
497	Qm2Wqk64IkB	\N	2017-07-06 18:26:19.855	2017-07-06 18:26:37.089	c239f261-4ba0-4aa7-9ea8-2157ce0714b3.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/83fc7192-372d-4790-ab1a-b4e32d1b1c89	t	STORED	DATA_VALUE	46
498	SLqRkprq9Q0	\N	2017-07-06 18:26:20.064	2017-07-06 18:26:37.095	1c2f00d0-6417-4ff0-bdee-90d5081c45ff.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/2cea8d3b-ef96-4142-b0da-1962bc2e990f	t	STORED	DATA_VALUE	46
499	TNcoYHs2VFa	\N	2017-07-06 18:26:20.285	2017-07-06 18:26:37.103	175b9f2f-0d2a-47f7-932e-2fe1ca42e1d6.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/a34c573c-b177-46ae-ae3e-3f997e63ee02	t	STORED	DATA_VALUE	46
500	OaKRyCfwqJW	\N	2017-07-06 18:26:20.534	2017-07-06 18:26:37.109	e6d811cf-a46f-4d7e-baed-94822dcfbaeb.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/76d974b2-39ef-445f-bab5-95bb52e24d64	t	STORED	DATA_VALUE	46
501	eIuauFCvMRa	\N	2017-07-06 18:26:20.777	2017-07-06 18:26:37.115	3e282abd-e7f2-4763-acc9-95770e06b4e3.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/729ffc02-d40a-48ff-b7b1-d4d2f3e31392	t	STORED	DATA_VALUE	46
502	U1oSPhAdMdm	\N	2017-07-06 18:26:21.037	2017-07-06 18:26:37.121	00d64e10-d50d-4f89-a2a4-01f17a3d24bb.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/569e2f3e-975b-46d0-b521-79be6816add5	t	STORED	DATA_VALUE	46
503	TbnZK8Yx6PH	\N	2017-07-06 18:26:21.272	2017-07-06 18:26:37.127	c87da8d0-8b62-4b70-b598-04801d6b7e66.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/fb53efaf-2828-455e-bcf9-b154b5fee93a	t	STORED	DATA_VALUE	46
504	g3z2S5fjzKO	\N	2017-07-06 18:26:21.548	2017-07-06 18:26:37.133	2fcc996f-19a0-4bd2-a8d5-dfc4c19be49d.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/e34ecf51-10ba-4941-9c03-a6b70f90289c	t	STORED	DATA_VALUE	46
505	bSi7TUH8LjV	\N	2017-07-06 18:26:21.853	2017-07-06 18:26:37.139	d6b110a9-57ef-48ab-99f1-f5b5554fc366.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/fdf71b0e-8068-4302-9545-950f1dbc8ab2	t	STORED	DATA_VALUE	46
506	G9m5QHm9WKQ	\N	2017-07-06 18:26:22.147	2017-07-06 18:26:37.145	7e291572-a0e1-4529-a168-80507ac160d8.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/36950457-f5f8-4431-83f0-fc59ead5eaea	t	STORED	DATA_VALUE	46
507	Nv35xQEDGL9	\N	2017-07-06 18:26:22.385	2017-07-06 18:26:37.15	7f0e1d69-952a-4fac-8e88-ed95c856e480.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/08bf33e4-1931-40c5-b867-cb89a46ec141	t	STORED	DATA_VALUE	46
508	u3fsH6e77hO	\N	2017-07-06 18:26:22.639	2017-07-06 18:26:37.156	6848371f-dfeb-41a3-9297-98dd069a245c.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f0c2896d-aea1-45f6-a891-8114f062946f	t	STORED	DATA_VALUE	46
509	xmFmXW8zwte	\N	2017-07-06 18:26:22.972	2017-07-06 18:26:37.164	07dd9eae-7dd5-451a-8dbc-7da3127c5384.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/825aadac-7677-4972-a6f6-2929f5ddf58e	t	STORED	DATA_VALUE	46
510	weDoN5IFtVM	\N	2017-07-06 18:26:23.197	2017-07-06 18:26:37.17	986b3e07-e5ca-454d-903a-68303c2b3662.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/5315036c-7105-4f2b-873e-bea72f00359a	t	STORED	DATA_VALUE	46
511	rplD1xHCKmr	\N	2017-07-06 18:26:23.422	2017-07-06 18:26:37.176	7a3ed8d3-814f-4207-acb3-4357ea13dba5.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/38fdc781-9a9b-46d6-8434-047ef9bf55c3	t	STORED	DATA_VALUE	46
512	aZIV38sbhi4	\N	2017-07-06 18:26:23.705	2017-07-06 18:26:37.185	33967ce7-df0b-4ef8-a9d0-6640a4050043.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f26924a0-4cae-413e-aeea-a9c4b7924ca1	t	STORED	DATA_VALUE	46
513	YvBzFvFIOew	\N	2017-07-06 18:26:24.012	2017-07-06 18:26:37.19	6782e954-7d2a-4f49-a4b7-d939b302e173.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/3219891b-b0de-412c-ae44-08db68f83350	t	STORED	DATA_VALUE	46
514	saCBOHxOy88	\N	2017-07-06 18:26:24.298	2017-07-06 18:26:37.197	fad955b8-52ce-4dd9-83bf-48dd31862dad.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/13e6b6e9-a19d-4254-acef-50277bad14fe	t	STORED	DATA_VALUE	46
515	MMartt6Bld4	\N	2017-07-06 18:26:24.527	2017-07-06 18:26:37.204	bf549663-a841-4302-84c2-f892b9da597b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/5f6b8ca2-2487-460d-adb9-92278ab9bd8b	t	STORED	DATA_VALUE	46
516	O5B2juYev41	\N	2017-07-06 18:26:24.764	2017-07-06 18:26:37.21	e826ddad-5acb-4671-9eb3-b532b60602e5.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/bca80994-8ee8-49bc-9b06-38c5a816b682	t	STORED	DATA_VALUE	46
714	DCaYGtlLKGw	\N	2017-07-06 18:41:43.562	2017-07-06 18:42:08.52	43758cc5-8e73-415a-ac92-5c17c149a19a.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/ccd3c166-86d1-4eed-8a5d-ab857d75b7a0	t	STORED	DATA_VALUE	46
444	RJhsj8GpHe8	\N	2017-07-06 18:26:05.278	2017-07-06 18:26:36.668	4ed6c201-ffd5-4500-864f-ac67ec9f9cf8.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/69120251-1cb1-479b-8589-b1e2d1052e2f	t	STORED	DATA_VALUE	46
445	qlB6TPMh4lQ	\N	2017-07-06 18:26:05.525	2017-07-06 18:26:36.674	819fdead-63fd-42e1-bae0-63469bfd0cfe.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/316cce1b-972c-4ccc-aee3-7a22f63fd032	t	STORED	DATA_VALUE	46
446	GLU5n1xHdJu	\N	2017-07-06 18:26:05.785	2017-07-06 18:26:36.682	c4431502-2ada-4a75-be6f-34bdf60e2818.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/e52a6296-9fdb-42aa-95a5-61116d9b6ebe	t	STORED	DATA_VALUE	46
447	DAOZQrpBXl5	\N	2017-07-06 18:26:06.062	2017-07-06 18:26:36.689	90ffb0d9-d68c-42a8-933f-25f22f7b3270.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/8a86a2e7-95f2-4b63-b617-d5f968b2d015	t	STORED	DATA_VALUE	46
448	uCWgsMiF6l2	\N	2017-07-06 18:26:06.279	2017-07-06 18:26:36.695	67a86f23-b2aa-4f4a-acf7-35deba7f6df9.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/dc783107-6b9c-4d70-bca7-56149c905fd2	t	STORED	DATA_VALUE	46
449	a1jVEjBe4wU	\N	2017-07-06 18:26:06.598	2017-07-06 18:26:36.702	1d8591b4-66cb-461c-ba7e-d86abc7721ad.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f78a9232-150d-40c5-94f7-b0d375a4a260	t	STORED	DATA_VALUE	46
450	Qna6gK6JVdW	\N	2017-07-06 18:26:06.911	2017-07-06 18:26:36.709	9245d5d4-71bf-448a-9eae-099053a5f57a.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/047d8566-61fb-46e6-bf59-6034533eade3	t	STORED	DATA_VALUE	46
452	yM7ZuruAaXx	\N	2017-07-06 18:26:07.416	2017-07-06 18:26:36.721	8f6904ca-92f1-45e4-a149-8af6db75f4c3.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/0b00149c-086f-4b87-b494-870fbaaa728e	t	STORED	DATA_VALUE	46
240	fUtMsHpUWEG	\N	2017-07-06 18:24:45.826	2017-07-06 18:25:19.182	f761465d-27f5-406b-97dd-ffaa0476a07c.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f0b449a4-b2ee-4da9-a2f2-22946b49f848	t	STORED	DATA_VALUE	46
241	qGLnWdtwPuP	\N	2017-07-06 18:24:46.078	2017-07-06 18:25:19.204	85e5692f-503d-434a-b72b-e3edf44552b3.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/b522b9b4-8312-452a-8fb6-67dfc8d3595d	t	STORED	DATA_VALUE	46
242	GANhLTB3Muw	\N	2017-07-06 18:24:46.441	2017-07-06 18:25:19.237	927ec9f9-25d0-42ac-b0c8-783653feafc5.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/120d9464-ff4f-4a17-8cee-c357cd7a7dd9	t	STORED	DATA_VALUE	46
243	NnkynIh7EM7	\N	2017-07-06 18:24:46.728	2017-07-06 18:25:19.258	dfeb9e42-f6b7-4fb2-a192-f41fa22493b2.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/c962005d-0e84-4092-aee9-59b6b40f51f6	t	STORED	DATA_VALUE	46
245	nkXlNTwznco	\N	2017-07-06 18:24:47.349	2017-07-06 18:25:19.276	723ce2a5-222d-44d4-ba9b-5b5780cf7697.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/c7e1b7c5-b15b-4f19-85c2-ef5769d9284b	t	STORED	DATA_VALUE	46
246	ogYtH1np3og	\N	2017-07-06 18:24:47.65	2017-07-06 18:25:19.285	07b3ec26-cc79-4cce-b731-1bc132d3f394.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/fbef10f0-9e1c-4b5d-9a49-a3f811956505	t	STORED	DATA_VALUE	46
247	hQFDpKKwzSV	\N	2017-07-06 18:24:47.954	2017-07-06 18:25:19.294	0e158255-ff79-435f-91f2-8ad45d6b2144.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/7aa1233f-3927-44db-9465-f5c6ad4d46db	t	STORED	DATA_VALUE	46
248	KE72tBFAI5z	\N	2017-07-06 18:24:48.185	2017-07-06 18:25:19.302	0838cf93-22c4-4a93-aa96-b7d1cd0489c1.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/9de03866-c520-4a00-8c46-2328198bb5eb	t	STORED	DATA_VALUE	46
249	ZYAc2t33Ttb	\N	2017-07-06 18:24:48.477	2017-07-06 18:25:19.31	779c2dee-e913-4361-bc24-cc0a8c2e040e.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/63c5ab05-ee36-4d08-abbb-77c8f7805590	t	STORED	DATA_VALUE	46
250	BiK7nkMn8za	\N	2017-07-06 18:24:48.777	2017-07-06 18:25:19.321	8f93df52-4fa0-4fa9-a872-e907c2e17218.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/58a9839e-fe21-406a-9e3e-d1041f7460b2	t	STORED	DATA_VALUE	46
251	TJvAMJcGaC4	\N	2017-07-06 18:24:49.005	2017-07-06 18:25:19.329	969a2358-6fa0-4173-acc7-c69f39317361.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/39bf46b3-ff50-4c8d-ba28-75aea5165010	t	STORED	DATA_VALUE	46
252	tM19kcY9SCH	\N	2017-07-06 18:24:49.258	2017-07-06 18:25:19.336	528bfa9d-9852-4154-bddf-6d3d6b9c186d.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/732fe35d-d3f7-44ce-8cd7-daad9a80ab36	t	STORED	DATA_VALUE	46
253	HVzYWq1u9mj	\N	2017-07-06 18:24:49.567	2017-07-06 18:25:19.343	6b1acb53-0635-482f-b0b9-556a3d1c735c.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/25cf6585-6e3c-4cea-9c9c-e66339f37e97	t	STORED	DATA_VALUE	46
254	wcex9mzmVHg	\N	2017-07-06 18:24:49.873	2017-07-06 18:25:19.351	55343087-c2e8-4f93-bf44-6dfd3563b885.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/1dbd9c95-3d59-4f4a-b653-be93a52b5735	t	STORED	DATA_VALUE	46
255	GpieTnPd0wF	\N	2017-07-06 18:24:50.207	2017-07-06 18:25:19.359	1e3f2df4-e626-46bc-ba0b-892a71aba426.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/6cc948a9-6c9b-4631-bcc3-68985957e873	t	STORED	DATA_VALUE	46
256	lopFllVC5oF	\N	2017-07-06 18:24:50.45	2017-07-06 18:25:19.366	3862bb18-44d5-4f0d-8882-bd4fe4e7f5db.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f8b1024f-f071-4001-bc81-de151395c747	t	STORED	DATA_VALUE	46
257	yMfbWMd53MR	\N	2017-07-06 18:24:50.687	2017-07-06 18:25:19.373	558c40f3-9acd-471d-999f-beb009d910f1.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/8045c322-d62f-4876-a33a-e5e648d52e55	t	STORED	DATA_VALUE	46
258	MjBVigqqQ0s	\N	2017-07-06 18:24:51.047	2017-07-06 18:25:19.38	ca5068a0-0a1b-448f-a169-329713f8d3fe.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/1c984781-e927-4b90-9ee2-32fd3fcb4637	t	STORED	DATA_VALUE	46
259	uz8QaLW7nwH	\N	2017-07-06 18:24:51.284	2017-07-06 18:25:19.386	11212a6b-a421-41cf-899d-e93849b37945.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/2e9a155f-2cd3-4969-af63-9149f07fdd9e	t	STORED	DATA_VALUE	46
260	kiAUudindBs	\N	2017-07-06 18:24:51.54	2017-07-06 18:25:19.394	72a768d8-fd63-4842-b7ac-f51ba73abd24.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/baee6bcf-4a03-4dd2-a8a4-cd7b24ac8831	t	STORED	DATA_VALUE	46
261	ra6nBjyhF1e	\N	2017-07-06 18:24:51.843	2017-07-06 18:25:19.401	0ca20a93-de03-4435-ba66-4b20628d0295.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/102b126e-6486-458e-8216-9ea8c6641f4d	t	STORED	DATA_VALUE	46
262	SI6JgImEXPT	\N	2017-07-06 18:24:52.142	2017-07-06 18:25:19.407	a3404f05-e275-4941-acbe-2d646ea36eb9.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/7bb99989-61bc-4138-8a0b-27f55fb8b216	t	STORED	DATA_VALUE	46
263	cKeqWMUyl0L	\N	2017-07-06 18:24:52.464	2017-07-06 18:25:19.413	41502830-73b0-400c-b3a3-87ba33e50c89.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/d3435ce0-b6d3-46f5-876c-ecde909615d8	t	STORED	DATA_VALUE	46
264	deAGgMTWUwV	\N	2017-07-06 18:24:52.713	2017-07-06 18:25:19.419	1c678263-b211-4e28-957a-744e337e9e3c.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/fd3cfa1b-8b36-4977-9d35-fae9f8bbcc57	t	STORED	DATA_VALUE	46
265	mWSt5hiqOY3	\N	2017-07-06 18:24:52.969	2017-07-06 18:25:19.426	f6940342-80e1-4612-a57f-35a32c50ae33.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/97097042-3eb1-485d-81d0-8f7facded3dc	t	STORED	DATA_VALUE	46
266	m5iBJs11m8i	\N	2017-07-06 18:24:53.248	2017-07-06 18:25:19.436	dfadf166-02a1-4c4f-a765-c27ff0fc3103.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/95b7f6bf-1416-42ff-8d1a-fe6badbdb36c	t	STORED	DATA_VALUE	46
268	JsjDFYDVSD8	\N	2017-07-06 18:24:53.839	2017-07-06 18:25:19.454	b2173d48-7170-42d3-b140-6f4316445cd8.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/b639c6dd-a8ad-4b5c-baab-012d5baba0e6	t	STORED	DATA_VALUE	46
270	PYCPjJAZ9pd	\N	2017-07-06 18:24:54.406	2017-07-06 18:25:19.469	e053283e-d2a5-490a-9361-c6a4d3ac12be.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/e0badd4c-e7e4-4dde-97f7-0e9806f4ebab	t	STORED	DATA_VALUE	46
271	uYnHkXLrT18	\N	2017-07-06 18:24:54.655	2017-07-06 18:25:19.477	57dd2019-1536-4e9f-b844-f317531c8633.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/8836be97-faa9-4b42-a2a0-801cdc391044	t	STORED	DATA_VALUE	46
272	SZju7iQ54QJ	\N	2017-07-06 18:24:54.89	2017-07-06 18:25:19.486	26500181-5a42-49be-a19f-ebc9d07e57f0.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/808e30df-2fd0-4b76-ac94-902f6f2a2d07	t	STORED	DATA_VALUE	46
273	LSStgB0h07X	\N	2017-07-06 18:24:55.098	2017-07-06 18:25:19.492	89f4a554-3681-45d7-9e80-85437a650e9a.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/5e321c37-2d70-41cb-8fbb-ae1a55155876	t	STORED	DATA_VALUE	46
274	xVdoLDj0Yrn	\N	2017-07-06 18:24:55.439	2017-07-06 18:25:19.498	fc0f0745-65be-4e11-b2ae-f7b5526edc44.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/b5c99e5f-60d0-448c-9728-aa4ea9e90448	t	STORED	DATA_VALUE	46
275	gfAI0qnuCwG	\N	2017-07-06 18:24:55.762	2017-07-06 18:25:19.505	b3da0d0d-3fd5-4274-950d-6a7086a5c333.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/aaec5665-a095-4fe3-96c0-7033e4b2ec1c	t	STORED	DATA_VALUE	46
276	tb2hOUVIIrZ	\N	2017-07-06 18:24:56.044	2017-07-06 18:25:19.512	c2b18ed5-c235-4d5d-88fd-1f2c36b4f217.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/529d585f-5b64-4723-a11e-b244884dc5f8	t	STORED	DATA_VALUE	46
277	GeZ1Ow91GGc	\N	2017-07-06 18:24:56.331	2017-07-06 18:25:19.52	e49e4a23-917a-49d8-8575-04b7eab28a46.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/5294e2c8-c062-4ec8-8bc1-21ca64dc9bf8	t	STORED	DATA_VALUE	46
278	KmkzeTcd7ta	\N	2017-07-06 18:24:56.682	2017-07-06 18:25:19.527	2bd22077-efe1-4ed0-81a1-d308ff3a6379.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/e4d7ac4d-bd10-49c2-ad8c-468c117c66e9	t	STORED	DATA_VALUE	46
279	TcuCV2h3vRp	\N	2017-07-06 18:24:56.972	2017-07-06 18:25:19.534	cf7e7abe-30e3-4da1-b97b-37a9e34f7029.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/1cfb2460-4d85-4881-9246-3f01207a1405	t	STORED	DATA_VALUE	46
280	I9OCIX7Ix4O	\N	2017-07-06 18:24:57.284	2017-07-06 18:25:19.542	585dc3a1-2e9d-4785-92b9-47706da8b9b9.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/ff5cf423-45cc-47d6-a30e-5c9e67aa1367	t	STORED	DATA_VALUE	46
281	F3stImQ9JOA	\N	2017-07-06 18:24:57.579	2017-07-06 18:25:19.549	00d0a000-7aca-4d37-98c4-efacf904a0e7.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/075a50c2-b633-4190-b852-b1582f0cfbf2	t	STORED	DATA_VALUE	46
282	iVWVDciJ0bm	\N	2017-07-06 18:24:57.888	2017-07-06 18:25:19.556	3b86cb22-45a5-4f08-9e25-f24ae620e93b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/27d13210-369b-4312-83ad-e458b8a2405a	t	STORED	DATA_VALUE	46
283	Z5PabfeJOl6	\N	2017-07-06 18:24:58.179	2017-07-06 18:25:19.562	2220cb41-52ce-448c-a08a-ed96939c5ef8.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/ee1405b7-106d-4c4d-af40-791992d1158b	t	STORED	DATA_VALUE	46
284	n5meu8crJEG	\N	2017-07-06 18:24:58.502	2017-07-06 18:25:19.572	58ca0132-e134-4782-bb33-6f344cb9fcfc.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f80dbb8d-5fc7-42cd-8b08-cc4f67e34e11	t	STORED	DATA_VALUE	46
285	p4emEAG8FIV	\N	2017-07-06 18:24:58.818	2017-07-06 18:25:19.582	7d9e71f6-0261-4dbb-ad4f-a76830e534a8.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/ae89f83d-eefe-469c-a77c-8d0deebfbcc3	t	STORED	DATA_VALUE	46
286	qBGAUiUccjZ	\N	2017-07-06 18:24:59.074	2017-07-06 18:25:19.594	66a0d6df-42fd-4bbc-b95c-35e192c0d632.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/5e75c4bd-8480-4052-b732-1793a3e8910b	t	STORED	DATA_VALUE	46
287	kpZlRFXj3o0	\N	2017-07-06 18:24:59.403	2017-07-06 18:25:19.603	9af3361b-cff5-4ad9-a9b2-8e1769ef3886.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/40b52b09-6285-400f-98ae-cdd39ad3df4f	t	STORED	DATA_VALUE	46
288	CpPHRgzP2iN	\N	2017-07-06 18:24:59.641	2017-07-06 18:25:19.613	34a941b3-9281-4b45-8117-7186a0bcbcd1.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/10832362-a900-47cb-8af8-4b8a1e4c86ef	t	STORED	DATA_VALUE	46
289	fLWKM9AjqeU	\N	2017-07-06 18:24:59.925	2017-07-06 18:25:19.626	d69f9564-dc2a-4097-82d1-c1880cb58870.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/9c3be584-41e2-4385-bdaf-ff7369528d1f	t	STORED	DATA_VALUE	46
290	hvYIlOflFJh	\N	2017-07-06 18:25:00.235	2017-07-06 18:25:19.633	d8f79a84-4662-4cda-afbf-31fba9cac100.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/fd63af47-a326-4a82-9db7-8c5679168694	t	STORED	DATA_VALUE	46
291	efqUwxBRB7D	\N	2017-07-06 18:25:00.566	2017-07-06 18:25:19.645	7f895c4d-477e-46c2-a695-21fdbc61c20d.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/3f2c2edf-aaeb-4e68-986e-26708cd90bb3	t	STORED	DATA_VALUE	46
292	DSSyvnHqsvs	\N	2017-07-06 18:25:00.852	2017-07-06 18:25:19.653	deb24eda-5263-47dc-8fb9-065552fed58a.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/7c1ea235-e549-41b6-afd6-45fb8397b6d0	t	STORED	DATA_VALUE	46
293	vbfgSsgjMO6	\N	2017-07-06 18:25:01.166	2017-07-06 18:25:19.659	1286b5b2-4f3f-420a-9b7b-8ab76dd244d3.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/73a90c01-b7de-44bf-aeb5-fa50677a39de	t	STORED	DATA_VALUE	46
294	O0NY575SHUD	\N	2017-07-06 18:25:01.381	2017-07-06 18:25:19.664	c3a18ed5-e76b-40b1-9ee6-2377d2369fb9.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/aab67877-f51e-40c5-b90e-9ca25f654a20	t	STORED	DATA_VALUE	46
295	rbP6Uii9aVP	\N	2017-07-06 18:25:01.684	2017-07-06 18:25:19.673	482bdaf8-bd6f-4b07-8458-d4d831c1266b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/54aa387b-8594-485f-814b-4e8b2199dcc2	t	STORED	DATA_VALUE	46
296	yZZplCiByl5	\N	2017-07-06 18:25:02.019	2017-07-06 18:25:19.678	91f5aefe-8216-4c39-a5a0-52f41a04483b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/32f6c56f-a5d1-4bd9-8844-aaa5dbf2e51e	t	STORED	DATA_VALUE	46
297	OEMePDOtGbg	\N	2017-07-06 18:25:02.277	2017-07-06 18:25:19.683	07ed37d2-7d2e-4274-b39a-92362c92e9c6.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/3af1e600-c14d-4be9-8599-acace9d75316	t	STORED	DATA_VALUE	46
298	xRBFFiYLUW4	\N	2017-07-06 18:25:02.504	2017-07-06 18:25:19.688	2cc427ed-b436-47ef-8b4b-7b58981aaaf0.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/753e0e60-f431-4c00-b2e6-06e1181bcf64	t	STORED	DATA_VALUE	46
299	wTHrSjIFJ2m	\N	2017-07-06 18:25:02.8	2017-07-06 18:25:19.692	44063a6e-0a98-43ff-9ef5-f8a054acaf0b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/b9a6051c-9ec3-426b-8864-9ee45984f3ce	t	STORED	DATA_VALUE	46
300	lhlH6HVwW1b	\N	2017-07-06 18:25:03.107	2017-07-06 18:25:19.699	6d009131-d7f5-459e-a826-13457764400d.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/2eebc67f-3784-4707-a0ea-6cfe27afd25c	t	STORED	DATA_VALUE	46
301	cnZIlO1FrFR	\N	2017-07-06 18:25:03.292	2017-07-06 18:25:19.705	73f12add-6b5b-4da3-b100-4687037ae53b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/8db783fd-6d63-496b-a005-85def7a61486	t	STORED	DATA_VALUE	46
302	fVXI7sVVVHc	\N	2017-07-06 18:25:03.523	2017-07-06 18:25:19.712	a0955eef-b530-4548-9b1d-74e2065b5180.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/c3bd6f14-0dcb-481e-ad62-bdc9ec149cc9	t	STORED	DATA_VALUE	46
303	EWmWhYwq0nK	\N	2017-07-06 18:25:03.732	2017-07-06 18:25:19.717	be2847ab-431b-4908-bdde-657d222540ee.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/b2c51d48-d58d-45b5-8701-5d7cdfa43181	t	STORED	DATA_VALUE	46
304	u2dt9ElcFGb	\N	2017-07-06 18:25:04.04	2017-07-06 18:25:19.729	198a23e2-607a-4730-9c5b-d22bdb32c757.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/8809fccd-0ca2-451e-b81e-2695b465336c	t	STORED	DATA_VALUE	46
305	TrQDbWvQYqw	\N	2017-07-06 18:25:04.281	2017-07-06 18:25:19.743	03cc5e0c-0b90-482d-aa68-9ba3e25d7a0d.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/408fab07-ba32-4150-a2a4-76e0abf46ba5	t	STORED	DATA_VALUE	46
306	Qwv0QlBeB9K	\N	2017-07-06 18:25:04.527	2017-07-06 18:25:19.748	ada0e325-eac7-4095-94d9-1df857eb722b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/adb65071-235c-4d34-9d67-2d300742917b	t	STORED	DATA_VALUE	46
307	UH25VWDzWEH	\N	2017-07-06 18:25:04.861	2017-07-06 18:25:19.754	bda9266d-de6f-4a88-b280-17273aca494c.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/5b425819-a96b-4eb4-9923-facf81e20676	t	STORED	DATA_VALUE	46
308	cZsozOkwcnh	\N	2017-07-06 18:25:05.096	2017-07-06 18:25:19.76	69e35f4a-390d-4741-afaf-4d67c476ff9f.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f7da08bb-3221-4858-9d79-3a2ff7b913d7	t	STORED	DATA_VALUE	46
309	tkT18JsW01i	\N	2017-07-06 18:25:05.353	2017-07-06 18:25:19.767	8f29750c-81b0-4739-b060-22961bb2fd56.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/d75602d7-c1be-4703-91be-4be054699a6f	t	STORED	DATA_VALUE	46
310	I5YVWeBkow9	\N	2017-07-06 18:25:05.663	2017-07-06 18:25:19.772	30495abc-ae12-4001-9076-4031b7636a84.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/43209bd5-7b69-49fc-a4fd-92e9584fd176	t	STORED	DATA_VALUE	46
311	DxzZ1CfabUD	\N	2017-07-06 18:25:05.993	2017-07-06 18:25:19.778	570fc8c9-b7ce-4a76-a97f-e169f3dc8dd5.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/de00b796-87ba-4f10-89e8-b8fe81b662e8	t	STORED	DATA_VALUE	46
312	lfEZfQZq8tE	\N	2017-07-06 18:25:06.234	2017-07-06 18:25:19.784	a4ee1b81-5900-43b4-8c05-affd17cc1c9d.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f35f3de3-d82b-471c-aa7c-666ac78e7f5f	t	STORED	DATA_VALUE	46
313	aVlOfKd3SHe	\N	2017-07-06 18:25:06.486	2017-07-06 18:25:19.791	d444f765-5761-4325-b1bd-5197324d3736.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/df317e28-b882-411a-a11e-78dd097df137	t	STORED	DATA_VALUE	46
314	U4JP7TrSeHX	\N	2017-07-06 18:25:06.788	2017-07-06 18:25:19.797	fa38c09a-7250-4d79-8b24-e7c4164c34a5.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/92c71eae-e4b5-4e78-bce3-4f339aa64ae7	t	STORED	DATA_VALUE	46
315	P6wXjYsfboe	\N	2017-07-06 18:25:07.057	2017-07-06 18:25:19.802	8c6eda7c-aae4-43ff-bca6-cd2bbfde1bec.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/317ca3fc-abbd-403f-92e5-237ad22cd9bd	t	STORED	DATA_VALUE	46
316	DTBYzdlIzcy	\N	2017-07-06 18:25:07.314	2017-07-06 18:25:19.808	ec63e726-cf01-4b24-a7dd-3b09d2709bb0.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/cc634771-fbaa-4db9-9fad-ee431feacc6e	t	STORED	DATA_VALUE	46
317	dea3nPFrkl3	\N	2017-07-06 18:25:07.621	2017-07-06 18:25:19.816	4cfb9abf-6a98-4d40-bc73-71b738456d3b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/91e40894-2bcf-4f78-aa4b-0714e1729fdb	t	STORED	DATA_VALUE	46
318	zFUOpCLAnOk	\N	2017-07-06 18:25:07.912	2017-07-06 18:25:19.822	0f778871-c529-49d4-adf5-49ff746a7ee5.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/cb080afe-a224-4849-993f-d9f8bb6a9d42	t	STORED	DATA_VALUE	46
319	QAn8z8bsgAL	\N	2017-07-06 18:25:08.155	2017-07-06 18:25:19.827	f2069483-dbe1-43d3-9d5a-109b9c7111b7.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/a7974110-9175-4a9c-8c32-fd953eaf13cb	t	STORED	DATA_VALUE	46
320	oDZNTK2ZgIa	\N	2017-07-06 18:25:08.432	2017-07-06 18:25:19.836	bfe22c2b-b76a-4445-aae6-d5d1c11f92b7.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/3589e63f-8a21-465b-8b2c-fd55c8549a78	t	STORED	DATA_VALUE	46
321	E5IMun50mzx	\N	2017-07-06 18:25:08.737	2017-07-06 18:25:19.841	07f91b66-9ca9-451b-b13f-ce3cae9c0ec1.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/2255e71d-de18-42ba-8848-da831c7562ae	t	STORED	DATA_VALUE	46
322	Ko8NAICjiRf	\N	2017-07-06 18:25:09.033	2017-07-06 18:25:19.847	c38f8d50-9ff3-426c-9b45-43243a912e43.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/5a254af6-a043-476a-a900-0ce79ca46796	t	STORED	DATA_VALUE	46
324	mftJC8dOfkK	\N	2017-07-06 18:25:09.67	2017-07-06 18:25:19.861	6f7df664-ef11-4d2c-aa02-fd8afe11c9d8.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/450512a4-14a8-4449-ab03-d3757531190a	t	STORED	DATA_VALUE	46
325	qKTLat5JIdu	\N	2017-07-06 18:25:09.939	2017-07-06 18:25:19.867	af94c7a1-387a-477f-9a62-e32cea87fe69.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/fa207f50-0793-43e5-850e-d86579452f7f	t	STORED	DATA_VALUE	46
326	JAZ4hnnLOQd	\N	2017-07-06 18:25:10.269	2017-07-06 18:25:19.873	398dad93-7b76-4d88-8240-3ee1401a1bae.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/22970a1d-62f8-4350-b998-5ec53f61c779	t	STORED	DATA_VALUE	46
327	GukXNkkSnHS	\N	2017-07-06 18:25:10.466	2017-07-06 18:25:19.88	0d9a9698-b657-4bef-9c86-5bb7719f6f46.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/22742848-d6bc-45b8-801f-b4a0af5d4fe7	t	STORED	DATA_VALUE	46
328	fT7QHiOUjWq	\N	2017-07-06 18:25:10.798	2017-07-06 18:25:19.886	11aa1ce4-2021-47f4-92d2-fffe616ad454.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/db0c484a-ad8b-4417-9222-346ff379effe	t	STORED	DATA_VALUE	46
329	JKbp9OxDFgm	\N	2017-07-06 18:25:11.04	2017-07-06 18:25:19.893	08eda82a-4ebd-4623-ad6c-9d5fa7e45898.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/7db7b5e2-eecf-43ac-ad73-da0cb260b592	t	STORED	DATA_VALUE	46
330	ZcCsE6FtCzt	\N	2017-07-06 18:25:11.278	2017-07-06 18:25:19.9	4c9a7e19-178a-4ca9-a527-a2556e776599.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/1558f87b-7d1d-4195-99c0-44295f2fb410	t	STORED	DATA_VALUE	46
331	dvUgZQgrrS1	\N	2017-07-06 18:25:11.613	2017-07-06 18:25:19.907	837c6262-f108-4b28-9bf6-a019e57e5a13.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/006d0d08-07be-4815-b565-30058d2972ef	t	STORED	DATA_VALUE	46
332	BNiG32Fn2kN	\N	2017-07-06 18:25:11.889	2017-07-06 18:25:19.915	9f86c28e-af15-4986-acbd-c35ec0181fd4.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/e2df83d4-792b-4325-bf0f-5f525d82a47c	t	STORED	DATA_VALUE	46
333	WmIL4nsxxjZ	\N	2017-07-06 18:25:12.215	2017-07-06 18:25:19.921	60e2d909-ef38-420a-8bb2-160c9f2f806b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/ebc7a723-80e3-4671-84db-10b3aa112e4a	t	STORED	DATA_VALUE	46
334	jCmtVh55drN	\N	2017-07-06 18:25:12.531	2017-07-06 18:25:19.927	1c1d4a01-1002-41d5-8a97-05815d31147f.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/a1508a75-6ff9-4ed3-ab38-3e30ffb5e484	t	STORED	DATA_VALUE	46
335	MYZ37yGNMhQ	\N	2017-07-06 18:25:12.861	2017-07-06 18:25:19.934	d99fe9b2-3b2c-49c6-bf0f-ec6697423802.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/dbc0c684-88d2-4774-b548-4b8c0a972b4e	t	STORED	DATA_VALUE	46
336	vObxUMawzSS	\N	2017-07-06 18:25:13.113	2017-07-06 18:25:19.94	c46a4c86-cb15-44b3-a59e-8e7d7bc56983.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/02dc5346-4d73-4920-b960-b7156debed46	t	STORED	DATA_VALUE	46
337	PwJyPUkFptN	\N	2017-07-06 18:25:13.345	2017-07-06 18:25:19.947	208ab83f-8b89-4215-b645-a1038f1beca8.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/e6c9cdd1-e204-4863-ad98-fd09d3df62f2	t	STORED	DATA_VALUE	46
338	UpubkhgaYva	\N	2017-07-06 18:25:13.654	2017-07-06 18:25:19.955	e4f8ce34-2d09-4fba-b28c-9982782aea02.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/5ba21b3d-88eb-41af-b896-a61bcfb87a8a	t	STORED	DATA_VALUE	46
339	AWHDPegdOhw	\N	2017-07-06 18:25:13.896	2017-07-06 18:25:19.963	fe3759b4-3593-452b-b671-fad92df8c54f.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/d0a0cd5f-4f54-43a1-a9ba-79d699ebcc04	t	STORED	DATA_VALUE	46
453	YcYWPKQbHzU	\N	2017-07-06 18:26:07.722	2017-07-06 18:26:36.728	d678ebb4-31e4-46ae-afe2-b9202e0d1b35.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/aaa3f784-13f4-4c0f-b63c-e4cdb6ef5631	t	STORED	DATA_VALUE	46
454	W3j6BiPOrfY	\N	2017-07-06 18:26:08.029	2017-07-06 18:26:36.734	9bea01a4-095c-4879-b565-eef4da2c82a2.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/82fbd803-8ea2-4d53-aeff-c97b9c7d46ad	t	STORED	DATA_VALUE	46
455	rlcjZEgPBtn	\N	2017-07-06 18:26:08.273	2017-07-06 18:26:36.741	9d76cbf3-02c9-4eaf-b811-f5d5b24cd7b1.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/706b9df4-a98e-46c9-b33c-da4c24b1a040	t	STORED	DATA_VALUE	46
456	MtRiJeI8jgw	\N	2017-07-06 18:26:08.543	2017-07-06 18:26:36.748	fafb5f75-d326-4e4c-b7e2-b6e9dab8d5f5.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/effd1a2b-a062-4d8a-bb7f-7b426b128549	t	STORED	DATA_VALUE	46
459	gqtRqLCOq7t	\N	2017-07-06 18:26:09.353	2017-07-06 18:26:36.765	8dee34cf-0eda-41f6-9d96-e303fa8ff8d7.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/636ee1f8-39eb-4afb-9044-33ea77cb732d	t	STORED	DATA_VALUE	46
460	hb60x5CJ15v	\N	2017-07-06 18:26:09.667	2017-07-06 18:26:36.771	d12bef36-0c07-478a-acbe-ae97802248de.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/6c84acd5-f46e-44bc-a541-308891b001ac	t	STORED	DATA_VALUE	46
461	kqnXEOcFRoJ	\N	2017-07-06 18:26:09.973	2017-07-06 18:26:36.777	fc82bd77-217d-45d7-9091-2405f4551938.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/8127a0ad-0a1c-41e2-a551-c4e4d306d82a	t	STORED	DATA_VALUE	46
462	zTlS1139OPP	\N	2017-07-06 18:26:10.215	2017-07-06 18:26:36.782	ac8e5eb8-14b4-4274-aea8-2840586c1580.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/3d681a39-e283-414c-914f-9f1bdc487f8c	t	STORED	DATA_VALUE	46
463	hdDF1oAMCrT	\N	2017-07-06 18:26:10.478	2017-07-06 18:26:36.789	1b945cda-d165-4d0f-8196-c46af1971dbc.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f4580d83-f1da-4a5a-9482-8256ab79e0da	t	STORED	DATA_VALUE	46
464	zenwoO3aMsk	\N	2017-07-06 18:26:10.79	2017-07-06 18:26:36.794	8500350b-1634-4640-8aa5-d838b00a6111.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/3b936ca2-5025-4fe2-b6b6-d4ee438c9f93	t	STORED	DATA_VALUE	46
465	lgLUwUHVNrJ	\N	2017-07-06 18:26:11.112	2017-07-06 18:26:36.8	672e05aa-6215-48b5-bae5-eabc14176969.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/a105c4fa-b868-4362-871c-23136d4c42be	t	STORED	DATA_VALUE	46
466	eXZHFVsKiHJ	\N	2017-07-06 18:26:11.356	2017-07-06 18:26:36.807	b022e2bc-7513-4e2e-a5d5-80188cc1ddd8.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/93e49ee2-01a1-44ed-8960-fdfddaef9d90	t	STORED	DATA_VALUE	46
468	Fx9mBTGEaYH	\N	2017-07-06 18:26:11.914	2017-07-06 18:26:36.818	f8cf235b-a1aa-4f26-9e46-a2f17e6dfb17.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/5c792a79-bb6d-463e-9922-df5280edfd7a	t	STORED	DATA_VALUE	46
469	PwKoSMQ6EgG	\N	2017-07-06 18:26:12.212	2017-07-06 18:26:36.824	3f575c5a-ab4c-4cd2-95d7-5428871fd0ed.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/c36e0503-1790-49e1-ae02-54fcac24b425	t	STORED	DATA_VALUE	46
470	hxbDfp3EC8z	\N	2017-07-06 18:26:12.465	2017-07-06 18:26:36.83	9ac74385-b72a-4d4f-a48d-317e40727a23.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/92fd3aa4-608e-4a8c-a1d5-2c2c203b11f2	t	STORED	DATA_VALUE	46
471	EqEWt5NdmGa	\N	2017-07-06 18:26:12.692	2017-07-06 18:26:36.838	0b1d23db-0924-4f44-a2f5-96780e7d4b71.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/6edbf658-8237-4fd7-b38c-63ec8b200aec	t	STORED	DATA_VALUE	46
472	axAcJRTfKzq	\N	2017-07-06 18:26:12.952	2017-07-06 18:26:36.845	72ccbbb1-50df-4f5d-8955-2007854a4ac3.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/d477321d-8a2c-4724-a8eb-6ed524acc3f7	t	STORED	DATA_VALUE	46
473	ZNta0eHZ8Dy	\N	2017-07-06 18:26:13.213	2017-07-06 18:26:36.851	0f8cba50-f95b-4cf3-9bd2-dbe71d487aeb.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/e47ed534-912d-4cbb-8215-28bba0cc4383	t	STORED	DATA_VALUE	46
474	Rfr4QLNbo7i	\N	2017-07-06 18:26:13.44	2017-07-06 18:26:36.858	816bffd1-c18f-4f86-8aee-ee60dc2aa3b2.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/307d2b9e-7767-4a18-bb48-8d9a44db2bc5	t	STORED	DATA_VALUE	46
475	HBhvRe4u5uE	\N	2017-07-06 18:26:13.753	2017-07-06 18:26:36.864	44f95467-96f4-404b-b582-d7722e39f9a2.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/ea14949d-647b-4179-aa61-3095d00ba667	t	STORED	DATA_VALUE	46
483	LLO1GzSbvLE	\N	2017-07-06 18:26:16.163	2017-07-06 18:26:36.921	5f83e3ab-a1bf-429e-a909-6b9fe6a70939.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/d2164a95-3883-4200-bab7-7ca530b7ee8a	t	STORED	DATA_VALUE	46
484	lMxnvOcLMzB	\N	2017-07-06 18:26:16.424	2017-07-06 18:26:36.928	6a311001-cef8-44cc-8b9b-1d5b592976a1.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/230dc4c9-01dc-46e3-846a-63c855ccff64	t	STORED	DATA_VALUE	46
485	b8kqrNr1uEo	\N	2017-07-06 18:26:16.749	2017-07-06 18:26:36.934	4ffb4e09-c5e5-41ae-9754-b5941341f10b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/df17dcb6-0ada-4525-913b-581496cd09ea	t	STORED	DATA_VALUE	46
486	wfv3BFsIvFj	\N	2017-07-06 18:26:17.036	2017-07-06 18:26:36.941	88e8bf45-4a77-4618-bfa2-16cfe8338006.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/de7b4e3e-c219-4dcf-98c2-83df911fdab2	t	STORED	DATA_VALUE	46
487	IYFHizngWF7	\N	2017-07-06 18:26:17.317	2017-07-06 18:26:36.95	c6b10613-5c99-4e1f-8fc3-fb69a7d72c5b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/694c4ea5-cd04-485f-82c7-bae703afc8fd	t	STORED	DATA_VALUE	46
488	QXCNQlVkRyC	\N	2017-07-06 18:26:17.635	2017-07-06 18:26:36.958	ca5405c3-dc67-4a35-8b6e-5e0fae1a7ba0.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/ce8c8366-3fbe-407f-b97c-29efa4681514	t	STORED	DATA_VALUE	46
489	ORv9UC9bJq5	\N	2017-07-06 18:26:17.964	2017-07-06 18:26:36.966	2cc216a3-1824-4df4-87bf-32fe54004bc9.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/d8cae408-73d4-408c-9af0-08934decd360	t	STORED	DATA_VALUE	46
517	UTFtUjQS6Nt	\N	2017-07-06 18:26:25.022	2017-07-06 18:26:37.217	97664983-304b-4915-bc1d-20ee1de7531d.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/a4a44fe8-035b-474d-a673-14777f3ea7f3	t	STORED	DATA_VALUE	46
518	NQZ0qwQfCwh	\N	2017-07-06 18:26:25.251	2017-07-06 18:26:37.223	b64e45ff-6d70-4844-a4a0-07a0c64396c1.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/66d39879-e351-49f2-8326-7fcb1ef76767	t	STORED	DATA_VALUE	46
519	IfArklkS1nv	\N	2017-07-06 18:26:25.547	2017-07-06 18:26:37.229	b73a399b-4009-4ace-8b2c-52869793821d.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/29818fc8-7711-4815-8fe7-30c5d75633b2	t	STORED	DATA_VALUE	46
520	QWZxMaObP89	\N	2017-07-06 18:26:25.805	2017-07-06 18:26:37.235	cba813a3-de4a-467d-ae62-819be7dee7f3.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/c21b356c-e4d4-47c6-b3a4-94876ccaed99	t	STORED	DATA_VALUE	46
521	pFfkCSqckDc	\N	2017-07-06 18:26:26.011	2017-07-06 18:26:37.242	7fc91fb6-89f9-4cb0-980a-cc90194a20cd.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f3b8c60a-54ff-49e1-9cc4-1ef780c6908d	t	STORED	DATA_VALUE	46
522	RkK4m7ZEhAj	\N	2017-07-06 18:26:26.256	2017-07-06 18:26:37.248	f640df86-8c4c-4c28-b29d-1842b22c631c.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/17ed44ef-1f92-46a2-8c21-b6db5dd4031c	t	STORED	DATA_VALUE	46
523	RUzNrjf0Ujq	\N	2017-07-06 18:26:26.564	2017-07-06 18:26:37.254	f99388f3-a2ee-4391-b565-22051be41fde.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/1e5ad0a9-3962-4d0d-8536-a5135bd2b8c3	t	STORED	DATA_VALUE	46
524	THLA8FdNbZe	\N	2017-07-06 18:26:26.799	2017-07-06 18:26:37.26	10ac190c-3b4f-4815-b93f-8cea3499ee98.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/ff4e4a27-3a23-4d77-b39d-1bffa5bb6bed	t	STORED	DATA_VALUE	46
525	nMSEzSK6pLb	\N	2017-07-06 18:26:27.094	2017-07-06 18:26:37.266	c5e2321c-012f-400e-8330-5d7b5ca15498.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/32d3e5c6-e67d-4d8e-a4b5-3f9f1382a6f7	t	STORED	DATA_VALUE	46
526	M2JbMYBB9Gx	\N	2017-07-06 18:26:27.288	2017-07-06 18:26:37.273	3fcafabe-164d-4eda-b0db-3321705e9a06.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/63d7c1be-d5f8-4624-aeae-a6c0f46d154f	t	STORED	DATA_VALUE	46
527	iXq3xYuQNhw	\N	2017-07-06 18:26:27.567	2017-07-06 18:26:37.28	7fa66ef6-3296-40ea-a16b-6f7ec4177d94.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/679e48a7-52c9-42de-94a8-578ceb2de2ab	t	STORED	DATA_VALUE	46
528	NmrMlyZhBlL	\N	2017-07-06 18:26:27.939	2017-07-06 18:26:37.287	e6a51174-ecea-4b1b-926d-58f7dbf1fc54.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/a50fb067-c5e5-4aca-9af7-85a005a54d40	t	STORED	DATA_VALUE	46
529	kQ8u5EjxeCF	\N	2017-07-06 18:26:28.201	2017-07-06 18:26:37.295	bba97250-b479-43e1-a94b-07c9a69df383.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/aabc7297-7c0a-4382-80bd-207cfe51e157	t	STORED	DATA_VALUE	46
530	pIN35K8jxKT	\N	2017-07-06 18:26:28.513	2017-07-06 18:26:37.304	e8d8e467-074a-4719-97ea-26bba5d9c2e3.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/41a9b6b1-3298-479c-bf35-9e9c97d20013	t	STORED	DATA_VALUE	46
531	L3juenaq6Et	\N	2017-07-06 18:26:28.826	2017-07-06 18:26:37.32	7cbafa3d-acac-4272-a71c-23711fc35f7b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/46135090-55af-4e76-918b-fae21bd656b0	t	STORED	DATA_VALUE	46
532	mPr6rR2DgIn	\N	2017-07-06 18:26:29.132	2017-07-06 18:26:37.332	59e37c98-841f-4305-a459-186dcbd2f6dc.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/970595cb-d216-4ecb-b620-50f4736ba3f2	t	STORED	DATA_VALUE	46
533	LaExDNuUE72	\N	2017-07-06 18:26:29.418	2017-07-06 18:26:37.343	d3986ef8-1991-4ca5-a2f3-153d80c1ed45.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/3825b9ac-fa93-4521-84c1-5109f06866db	t	STORED	DATA_VALUE	46
534	Ewku5Ut7dzR	\N	2017-07-06 18:26:29.743	2017-07-06 18:26:37.354	dffc045b-a05d-4fd0-ad4c-1148cfee519b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/0432f445-77c0-4d9c-bdbb-1e84de8fa542	t	STORED	DATA_VALUE	46
535	Lxj5QEhUexu	\N	2017-07-06 18:26:30.053	2017-07-06 18:26:37.364	3fd9c45b-ddeb-42a5-8eef-32c437c3f02b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f76dc004-6e3b-4452-b1f1-409f9bf8b905	t	STORED	DATA_VALUE	46
536	MqnE8Hm2Rar	\N	2017-07-06 18:26:30.361	2017-07-06 18:26:37.374	d1859ffd-40ae-46a5-8b14-4dcba11b29a9.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/0be634b6-f648-4695-93e9-d45d0c526b29	t	STORED	DATA_VALUE	46
537	Cd2udtLhXfu	\N	2017-07-06 18:26:30.669	2017-07-06 18:26:37.383	2f548aec-f568-4d7b-a028-3f8567d181ac.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/70a7c725-c026-40ad-8a7d-ea11280446d1	t	STORED	DATA_VALUE	46
538	YpKNWFsRj0d	\N	2017-07-06 18:26:30.934	2017-07-06 18:26:37.393	b95c219b-ed1f-4b30-8431-033d74a6716f.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/6ebb5e59-c405-416f-97fb-6986504e2801	t	STORED	DATA_VALUE	46
539	iSgRJ1dg6gm	\N	2017-07-06 18:26:31.249	2017-07-06 18:26:37.403	3f223e98-2000-4b72-b545-dc33b7d60334.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/08c25ac4-4339-45d1-b15f-ea3f5c8705e0	t	STORED	DATA_VALUE	46
723	ohlrqDhnvdq	\N	2017-07-06 18:41:45.824	2017-07-06 18:42:08.58	5ceac502-d7d9-460d-bc04-e8134e9dc206.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/b38c3a0e-5e36-469f-b73c-bece501c748e	t	STORED	DATA_VALUE	46
744	n3u2KWoQd7d	\N	2017-07-06 18:41:51.291	2017-07-06 18:42:08.736	18307617-9e6b-40f5-82cd-496342ad5228.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/19f0a842-6a6c-4747-bf5f-5393aef5acee	t	STORED	DATA_VALUE	46
746	wF3WUXP79Am	\N	2017-07-06 18:41:51.837	2017-07-06 18:42:08.745	e393f598-8dcc-4705-961b-09f662cd8ff1.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/545ba32e-354f-46ee-82a6-af0eaa3f3e0f	t	STORED	DATA_VALUE	46
747	nR9eCbKm0Cq	\N	2017-07-06 18:41:52.092	2017-07-06 18:42:08.75	faab3552-a8ba-43f1-87af-9caa96ed4492.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/6e93e93f-c754-43b8-bce2-f21fcdcf413d	t	STORED	DATA_VALUE	46
751	k72LZ0tiJ4e	\N	2017-07-06 18:41:53.116	2017-07-06 18:42:08.772	cb6e1720-91a6-4ebb-960b-f14119ba2fb2.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/682afd58-e185-48e2-a203-efc0edab3b5b	t	STORED	DATA_VALUE	46
752	TVS4lcT2or2	\N	2017-07-06 18:41:53.38	2017-07-06 18:42:08.777	bb77f21c-0ab6-410e-9805-c6bf661bf902.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/5e3ff321-cedc-4b44-88ca-f078ac112f56	t	STORED	DATA_VALUE	46
753	WWPDwoCoXDG	\N	2017-07-06 18:41:53.693	2017-07-06 18:42:08.787	6df26443-3d8a-43e1-b42e-8c9f3c761bd2.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/4277480e-bc85-4d39-b60a-0061819a024b	t	STORED	DATA_VALUE	46
745	n4Dsm6LCnG1	\N	2017-07-06 18:41:51.554	2017-07-06 18:42:08.741	16d2ff67-33f4-4a1b-95c1-f8f7d28e23df.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/302f279b-c346-4fe4-8da7-602e701ce014	t	STORED	DATA_VALUE	46
688	nJB0bKLwJvx	\N	2017-07-06 18:41:36.03	2017-07-06 18:42:08.371	ac468995-767f-4e6a-9374-7115379bd3b2.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/05f95732-e95d-43a3-ba1e-841bb243563e	t	STORED	DATA_VALUE	46
690	soTLqovOOTJ	\N	2017-07-06 18:41:36.599	2017-07-06 18:42:08.383	c9db8025-6928-4684-86b9-cf3953ac89bb.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/c5cda9cc-5478-4f31-ab1a-d08b6dcb8c1b	t	STORED	DATA_VALUE	46
691	I6PqnXHKVFL	\N	2017-07-06 18:41:36.83	2017-07-06 18:42:08.394	5cc767ae-cf56-434f-8281-eaddb038ac18.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/ba692228-ec08-41be-83d6-8a3940a512ff	t	STORED	DATA_VALUE	46
692	aU4t1iGTvtB	\N	2017-07-06 18:41:37.069	2017-07-06 18:42:08.399	904784ba-47a7-40ae-ab4f-b34040dfbc1d.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/99649567-be23-4dfc-860b-7ba053d974f1	t	STORED	DATA_VALUE	46
693	XSWEyJDfVc4	\N	2017-07-06 18:41:37.314	2017-07-06 18:42:08.407	9be673f3-cd21-4c9c-a3c0-c16ade98d256.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/1f6553d6-127c-4098-93d2-4eba3dcfd94e	t	STORED	DATA_VALUE	46
695	N6r8LOYqH2K	\N	2017-07-06 18:41:37.916	2017-07-06 18:42:08.417	0c9300e8-6295-4a3c-91d1-34ea85bdd160.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/a8a5ff7f-d284-4781-a07a-3138dd22c754	t	STORED	DATA_VALUE	46
696	Knh850oehat	\N	2017-07-06 18:41:38.165	2017-07-06 18:42:08.421	995d00cd-0019-47b0-a539-6ef378bcfd64.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/a207e546-984e-4b18-877f-0611720760ef	t	STORED	DATA_VALUE	46
697	YiJ3JuyGmnH	\N	2017-07-06 18:41:38.441	2017-07-06 18:42:08.427	0ce9c863-1820-4bd2-93f8-1ea43a66e7da.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f8bca093-ae02-42db-97df-1c8fc8ae65f3	t	STORED	DATA_VALUE	46
698	GTgDOPTS0Yw	\N	2017-07-06 18:41:38.744	2017-07-06 18:42:08.432	044f8594-a3ea-4eff-8bd7-964b92cbd24b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/0e89250e-cbd0-4540-85dc-7daa06fd1d43	t	STORED	DATA_VALUE	46
699	AcWx7hGgKFV	\N	2017-07-06 18:41:39.043	2017-07-06 18:42:08.437	e0c930c0-6197-49b0-937a-7f0716f997ec.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/8fd0a2a3-7b08-4aa9-af1a-31f210ec5e31	t	STORED	DATA_VALUE	46
700	hY7AAATZ1pN	\N	2017-07-06 18:41:39.365	2017-07-06 18:42:08.443	d2692ff7-dad8-4e84-8cdb-aa18b86d0de3.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/2c685e6c-c52a-41db-8b66-0556c1d2f5ee	t	STORED	DATA_VALUE	46
701	O3EUvTkv5mp	\N	2017-07-06 18:41:39.676	2017-07-06 18:42:08.449	2b6d7730-ac38-4806-93ef-97454b994a1a.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/d893d422-52bf-4517-b651-db1997904b1c	t	STORED	DATA_VALUE	46
702	VDbeGLoVIJL	\N	2017-07-06 18:41:39.986	2017-07-06 18:42:08.454	82bcc56e-0351-4d13-8350-867bb5898647.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/27a37e9a-7751-4b67-acdb-2280aa1955dc	t	STORED	DATA_VALUE	46
703	kC4Vigw3xYF	\N	2017-07-06 18:41:40.214	2017-07-06 18:42:08.459	ba17654e-4763-4ab9-995d-d950be8c5a60.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/77dacb4e-6013-4834-afca-46538fc8876b	t	STORED	DATA_VALUE	46
704	LS4KTaPmGM6	\N	2017-07-06 18:41:40.45	2017-07-06 18:42:08.464	519971db-0065-4778-b96a-37db81c9cea9.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f761123e-1156-47c4-b948-95200c2a65f6	t	STORED	DATA_VALUE	46
705	skMgbJfjLRI	\N	2017-07-06 18:41:40.797	2017-07-06 18:42:08.47	abccd442-64f7-4e3f-b9f9-3193a64183d7.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/b31cb6d8-a48f-4422-90f0-e668a4a2dd50	t	STORED	DATA_VALUE	46
706	Cih9k2TMpxr	\N	2017-07-06 18:41:41.097	2017-07-06 18:42:08.475	f84e3fbc-cd01-40fb-a407-b8a83f453590.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/59b4b96f-2bb3-4c98-b001-243f38b0f816	t	STORED	DATA_VALUE	46
707	TfT2j3qoxoM	\N	2017-07-06 18:41:41.324	2017-07-06 18:42:08.48	f1485f59-ebf6-4d99-af8b-19ab55173a0f.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/619d9a37-3d83-4769-bade-63939fc4d658	t	STORED	DATA_VALUE	46
708	AreyNz0OAoe	\N	2017-07-06 18:41:41.581	2017-07-06 18:42:08.485	92236161-01fc-4ee5-940c-8edd8ce593ce.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/09538dd9-67be-43a4-b65e-888921cc5012	t	STORED	DATA_VALUE	46
709	zZRcvl213dS	\N	2017-07-06 18:41:41.809	2017-07-06 18:42:08.491	d32997a1-d3d9-4ac0-aa1c-ab504ac994d8.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f7ad68b0-6682-4ba8-b004-8c07443277c6	t	STORED	DATA_VALUE	46
710	WO0GcJCPgkx	\N	2017-07-06 18:41:42.158	2017-07-06 18:42:08.496	7eb557cc-4853-4e54-87b0-4569c38d64b5.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/6fe34f10-a776-4dff-bf75-ba78bb3e8176	t	STORED	DATA_VALUE	46
711	DJp3nMb7d0K	\N	2017-07-06 18:41:42.587	2017-07-06 18:42:08.502	3a5dfdab-84b5-490b-9027-ccc7dd94153c.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f040d036-dce4-43a3-b698-fb199fe5028a	t	STORED	DATA_VALUE	46
712	AvDsIWwe7CR	\N	2017-07-06 18:41:42.932	2017-07-06 18:42:08.509	57e67145-5414-4d3c-9c4d-5ea42533fbb0.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/70d56a3d-17cb-47f7-899a-718934c851a5	t	STORED	DATA_VALUE	46
713	M9CWVAXPe0K	\N	2017-07-06 18:41:43.154	2017-07-06 18:42:08.515	291b98eb-cc53-4502-9351-06c1851de59c.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/eeb969da-d649-4816-884b-da0c3fcab792	t	STORED	DATA_VALUE	46
715	OZsm3009RSJ	\N	2017-07-06 18:41:43.796	2017-07-06 18:42:08.526	e20fdb6a-c3f8-4334-8424-4dbd60cd2cec.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/4ed6fbd4-11a3-4044-9e67-38473bc2b350	t	STORED	DATA_VALUE	46
782	Pg3nQedjWh5	\N	2017-07-06 18:42:01.982	2017-07-06 18:42:08.966	f3df42a0-1c74-4de5-939b-a7cffa562a78.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/ba2f698e-2d3b-4df3-bebf-5e54aaed7398	t	STORED	DATA_VALUE	46
783	fMplRLsT6jB	\N	2017-07-06 18:42:02.297	2017-07-06 18:42:08.977	fead24a3-bfda-418e-a03f-94472505e0a9.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/2fc8f811-3aa3-4cf1-8744-03440447c953	t	STORED	DATA_VALUE	46
784	fwN6P7QGzRc	\N	2017-07-06 18:42:02.603	2017-07-06 18:42:08.983	45bddc86-e8fb-48d4-a603-7f802f52c225.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/551f2a47-063d-4f38-8099-6f5a6e228212	t	STORED	DATA_VALUE	46
716	fgVSCoG3uDk	\N	2017-07-06 18:41:44.078	2017-07-06 18:42:08.539	7a403ca3-2395-45db-93aa-415c60794130.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/9954fb46-98f1-4558-8f30-e0819b74ac3b	t	STORED	DATA_VALUE	46
717	T75L3sLnvdx	\N	2017-07-06 18:41:44.375	2017-07-06 18:42:08.545	8f13adee-014a-4962-b670-fdbf9a2e3902.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/0ce7ec5e-a973-4f5d-b8fa-898bea1373d0	t	STORED	DATA_VALUE	46
718	zah4sLzGWdV	\N	2017-07-06 18:41:44.636	2017-07-06 18:42:08.55	de528f12-89b6-400d-a831-582cbe245fb2.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/b4ebc9d8-248a-4bbe-b2aa-399bbd2324f1	t	STORED	DATA_VALUE	46
719	z4Z89X5ampv	\N	2017-07-06 18:41:44.874	2017-07-06 18:42:08.556	33dd4ad6-c8f0-4e1e-bde0-ef9ebb569750.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/c6842704-e60a-4429-850d-8cbc94dfb51f	t	STORED	DATA_VALUE	46
720	SmA6762G3AL	\N	2017-07-06 18:41:45.119	2017-07-06 18:42:08.562	7c60440b-f85b-410c-9783-79ad6ae2127d.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/c7e7087f-a993-48d3-b3a2-82a9ba3f7743	t	STORED	DATA_VALUE	46
721	OKjQGoVbufI	\N	2017-07-06 18:41:45.336	2017-07-06 18:42:08.568	ad5709ca-a77f-4a98-bc8c-ea67a2e2725a.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/e1de7b6a-f8a0-4705-bc5c-10249e0428c9	t	STORED	DATA_VALUE	46
722	Ip5sem36vw7	\N	2017-07-06 18:41:45.595	2017-07-06 18:42:08.574	4e50fd17-bac6-4cc7-945e-e6f317b6ac46.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/da053915-97f3-4963-9fc3-d0821411abd4	t	STORED	DATA_VALUE	46
724	vNMpFBOhtXX	\N	2017-07-06 18:41:46.116	2017-07-06 18:42:08.586	8ca1089c-475a-4053-90b6-4e62780219eb.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/bb44afcf-d830-480d-982d-d8cb443f0f61	t	STORED	DATA_VALUE	46
725	hx6FB0bfEGT	\N	2017-07-06 18:41:46.419	2017-07-06 18:42:08.592	5fee6ac6-d6a3-4dc3-af2a-6639ef853c6c.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/879f0c34-3538-4c7b-86f8-4c80b77c8563	t	STORED	DATA_VALUE	46
726	Ko6sKqrppSn	\N	2017-07-06 18:41:46.641	2017-07-06 18:42:08.598	12d983ac-e4b3-4481-b501-84308c5553cd.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/81652ae2-a2a8-4633-a838-24d4ed413b50	t	STORED	DATA_VALUE	46
727	dWlmkxY7sLS	\N	2017-07-06 18:41:46.865	2017-07-06 18:42:08.604	c644032b-6c0f-4ea3-9d2e-14aff9ee42fd.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/d0a276b5-ad45-471f-ab74-97312ed7d2fb	t	STORED	DATA_VALUE	46
728	RQXuDoeybw9	\N	2017-07-06 18:41:47.113	2017-07-06 18:42:08.611	7657eaad-743b-4b21-a62c-a56b1fe86e11.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/35521d51-ce31-4c00-b616-de4297e492e9	t	STORED	DATA_VALUE	46
729	LNqTFtK6rPK	\N	2017-07-06 18:41:47.346	2017-07-06 18:42:08.617	3187f9f4-ea3a-4b99-9281-25b952c4d780.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/2ab7c19b-9adb-4dd6-bd58-e185bd9db0be	t	STORED	DATA_VALUE	46
730	a6zyzEmGdHq	\N	2017-07-06 18:41:47.597	2017-07-06 18:42:08.624	a5bbd466-a660-485a-b143-2bd92fa7212f.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/643d23c8-e6e8-4fda-b34a-bcfaec8dcd06	t	STORED	DATA_VALUE	46
731	OFFep886Y4Q	\N	2017-07-06 18:41:47.865	2017-07-06 18:42:08.631	9874a7c2-070e-4949-b100-5e477909130d.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/05768129-1cea-47a4-87e2-cc1dce2ec0e5	t	STORED	DATA_VALUE	46
732	meiFCp9taRh	\N	2017-07-06 18:41:48.095	2017-07-06 18:42:08.637	2672e1b5-d867-4fd0-9604-6ae2af857487.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/6ac8959a-4a95-4b8f-8a61-6fe8a40788a5	t	STORED	DATA_VALUE	46
733	BRinpSCTTui	\N	2017-07-06 18:41:48.359	2017-07-06 18:42:08.644	9f603cc4-bea9-422e-9de2-d687ec6380b8.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/4b13c65c-3e92-4e21-a4c7-fbad24e4359c	t	STORED	DATA_VALUE	46
734	swx7myqnn11	\N	2017-07-06 18:41:48.694	2017-07-06 18:42:08.65	de77312b-b56d-4b8b-84ae-57e68733db84.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/98c57b26-1b46-4047-a885-33c310d96118	t	STORED	DATA_VALUE	46
735	ShH98xMd8ft	\N	2017-07-06 18:41:48.982	2017-07-06 18:42:08.657	48e9a1d7-630c-4a2e-952d-764da93c1e13.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/425700d0-4f8b-4d83-b5fc-9da0c27838ab	t	STORED	DATA_VALUE	46
736	pvYwTEs0ZXq	\N	2017-07-06 18:41:49.215	2017-07-06 18:42:08.664	9bb14aad-e544-4a73-a04e-cc2a2161da87.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/d7cc3fa9-3f38-4ca1-b46a-daff751aa35c	t	STORED	DATA_VALUE	46
737	q3PJwqFPPuL	\N	2017-07-06 18:41:49.478	2017-07-06 18:42:08.674	06dd30f5-cec0-4652-8463-9c7201207b4f.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/1a3000a8-a49b-42c6-820b-93797521098f	t	STORED	DATA_VALUE	46
738	zuzbd8kps44	\N	2017-07-06 18:41:49.777	2017-07-06 18:42:08.69	821af3be-6662-4881-b525-bfd3c43a8396.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/c01a8c66-447f-423b-a7ca-7c499db1f89e	t	STORED	DATA_VALUE	46
739	FsDz9NOx0MJ	\N	2017-07-06 18:41:50.002	2017-07-06 18:42:08.695	7aedf611-fb84-48de-8a02-36945bcceaec.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/289dca49-c7ed-4b74-bec8-1f2bad03151a	t	STORED	DATA_VALUE	46
740	ngCQIJdTdUx	\N	2017-07-06 18:41:50.319	2017-07-06 18:42:08.708	c311692a-3833-44cb-840d-de89aa63e2c6.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/d8632075-21f6-477e-89ad-dff51565e529	t	STORED	DATA_VALUE	46
741	C3ttgiBpGLt	\N	2017-07-06 18:41:50.564	2017-07-06 18:42:08.721	27beccf1-9af7-4797-bfab-1ae4de5ea2da.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/765178d7-c7cf-4fd3-b38f-68cdc180c18b	t	STORED	DATA_VALUE	46
742	ohSrk2k5iYk	\N	2017-07-06 18:41:50.823	2017-07-06 18:42:08.727	60b73fab-f0b5-4480-9afc-68ea6143c713.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/13d7167c-7bea-45fb-8cc3-eb496898f66e	t	STORED	DATA_VALUE	46
743	SLwqT6639M0	\N	2017-07-06 18:41:51.056	2017-07-06 18:42:08.731	4729c859-8e75-4c7f-a247-bae4551cc0a6.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/3f0ec0db-0166-461e-9c64-1935234170a8	t	STORED	DATA_VALUE	46
748	V04lda1BQtE	\N	2017-07-06 18:41:52.369	2017-07-06 18:42:08.755	c8879b39-326d-4a8b-acb3-a06e406317ae.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/4b641f28-6385-430f-a4e2-af1e5fe821d6	t	STORED	DATA_VALUE	46
749	etVK8S5vg9V	\N	2017-07-06 18:41:52.6	2017-07-06 18:42:08.761	d51c7844-ecec-4b06-870f-db66b7680b95.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/4b740736-b4a3-434b-909b-60a5c001b57f	t	STORED	DATA_VALUE	46
750	barwJIW1c3l	\N	2017-07-06 18:41:52.889	2017-07-06 18:42:08.766	3a819828-45d0-4157-b700-61c9df3fd0de.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/35d11edb-fd53-47e7-9f0a-8cb64b88dccf	t	STORED	DATA_VALUE	46
754	d3zM4LmRvNT	\N	2017-07-06 18:41:54.009	2017-07-06 18:42:08.792	3994072f-1dd1-4de6-9a24-4faf028a0eb3.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/ea0769d4-24e6-4a48-806d-911bf6c64774	t	STORED	DATA_VALUE	46
755	ugDv8L0Q3Bu	\N	2017-07-06 18:41:54.306	2017-07-06 18:42:08.798	5ccc2ec8-b5d5-4b80-b99c-16e110ba98e8.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/4dc466a0-6b45-4daf-bec1-630b15a49f5e	t	STORED	DATA_VALUE	46
756	Gmd0ALXZleE	\N	2017-07-06 18:41:54.538	2017-07-06 18:42:08.803	c704c3a4-b71c-4991-b25b-a56e4d11dd8d.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/0de5351a-470b-4910-9f4c-6a5a0c768e2a	t	STORED	DATA_VALUE	46
757	mAB6rYDvDy0	\N	2017-07-06 18:41:54.824	2017-07-06 18:42:08.809	6c3afbf1-4e64-42ea-82fb-d0f10aa942d2.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/32d2ba0b-72a9-45ce-9d9f-7068d331df88	t	STORED	DATA_VALUE	46
758	Jw53AJZrVAC	\N	2017-07-06 18:41:55.129	2017-07-06 18:42:08.816	42b136c9-f18e-4fcf-927f-b2d7e2aa4675.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/6d18bce0-d086-4ed0-9e44-b876facb6268	t	STORED	DATA_VALUE	46
759	CdiMS4tR8Hq	\N	2017-07-06 18:41:55.446	2017-07-06 18:42:08.823	8d30bc43-16e2-45b8-96fa-570b50fbd4cf.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/ee90deb7-7b39-4f68-bea4-f93a3ec37ddb	t	STORED	DATA_VALUE	46
760	ELsWsmidbMt	\N	2017-07-06 18:41:55.744	2017-07-06 18:42:08.829	8b9d65c8-faac-45a6-98bc-923fd6dca78d.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/517b1f62-5c4f-441d-a546-df60220cc009	t	STORED	DATA_VALUE	46
761	aoT7FnjghW2	\N	2017-07-06 18:41:55.982	2017-07-06 18:42:08.835	1463821f-2624-4c01-8e12-a47036e70d17.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/237df059-897a-4412-a782-0afb78224ff7	t	STORED	DATA_VALUE	46
762	M3JemRb3lfC	\N	2017-07-06 18:41:56.257	2017-07-06 18:42:08.842	d7b8c75d-cdc9-4a67-a0de-766adbd682dd.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/4218474e-8627-4866-b0ec-95fbcda91ef4	t	STORED	DATA_VALUE	46
763	zZVTzIEQkHr	\N	2017-07-06 18:41:56.509	2017-07-06 18:42:08.847	52fc426c-8711-4fc2-b0dd-d46ab538464b.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/69c52280-d812-4a2e-9d49-130fefea381a	t	STORED	DATA_VALUE	46
764	LX7D7ZhKBYD	\N	2017-07-06 18:41:56.753	2017-07-06 18:42:08.853	81209291-de9c-4b95-a90c-6dd49256c3ea.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/55aa8287-050f-4051-8ba1-c8ac55d28b9e	t	STORED	DATA_VALUE	46
765	ybfsiSEUSr8	\N	2017-07-06 18:41:57.076	2017-07-06 18:42:08.859	99cf9321-433c-44c2-ad7d-5ed2a3eb4290.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/c1c0d494-3515-4ee6-8a6d-b09689b4e4d7	t	STORED	DATA_VALUE	46
766	LZl2Z4yUBUg	\N	2017-07-06 18:41:57.383	2017-07-06 18:42:08.865	b3295dce-b65a-4f1d-8131-9e090931dfc6.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/cda70713-64d0-4f25-8311-480d1b94f9d3	t	STORED	DATA_VALUE	46
767	fdhYB61dGLc	\N	2017-07-06 18:41:57.683	2017-07-06 18:42:08.87	474e3a62-a615-4d83-9a9a-9c7bc479ea73.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/54b7fe54-dbc0-4931-a88e-f6be6afd1a87	t	STORED	DATA_VALUE	46
768	qdRP0fGOhnr	\N	2017-07-06 18:41:57.983	2017-07-06 18:42:08.875	43e09291-fe08-4083-815a-8391c9c4ffca.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/209465af-d909-4d1d-8d59-340021174120	t	STORED	DATA_VALUE	46
769	nlfhnxyyiiB	\N	2017-07-06 18:41:58.197	2017-07-06 18:42:08.881	632d91a3-6f28-4bc5-bb44-3c2e35ec03aa.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/8e73937e-9600-414d-8d53-39b1327cd619	t	STORED	DATA_VALUE	46
770	nNcPZHD3ef3	\N	2017-07-06 18:41:58.497	2017-07-06 18:42:08.886	470830a2-8fe0-4ed0-b55e-4f5db440fe7f.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/4dd5db81-d0b3-407b-8218-df8ecee004a7	t	STORED	DATA_VALUE	46
771	hr07p3948Ye	\N	2017-07-06 18:41:58.808	2017-07-06 18:42:08.893	48b874d7-43bd-4850-93dd-09acf75c9224.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f346a548-9b2d-408a-a323-1d4ca6f403aa	t	STORED	DATA_VALUE	46
772	xuKtKz33Bcn	\N	2017-07-06 18:41:59.012	2017-07-06 18:42:08.899	8f99b1d8-6b91-468e-8038-e803df318e00.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/822c8952-0305-4d91-b39c-a716d740366a	t	STORED	DATA_VALUE	46
773	flBwWH9Jm6L	\N	2017-07-06 18:41:59.329	2017-07-06 18:42:08.905	3fc9f7fe-c763-43da-8827-7e63e1b6669f.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/5822425d-94ec-48cb-913b-4f564a94a470	t	STORED	DATA_VALUE	46
774	RwsfwLwHJ95	\N	2017-07-06 18:41:59.641	2017-07-06 18:42:08.911	b256c7b3-c9ef-4e38-afc6-63b1d08438d7.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/4fb94d70-3320-4b5e-841e-3de72d64ee40	t	STORED	DATA_VALUE	46
775	E1ZbGLspLLp	\N	2017-07-06 18:41:59.941	2017-07-06 18:42:08.918	02128ece-04ce-48c5-ad30-ad6d6a1e9562.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/3b0f07d4-c828-4035-926f-54a89e554e8e	t	STORED	DATA_VALUE	46
776	xLdRFsnBFPy	\N	2017-07-06 18:42:00.274	2017-07-06 18:42:08.924	19c366dd-8ac9-4b79-978a-e1c112dadb5e.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/de99ba3d-b4ec-4832-8444-0fa5b281618a	t	STORED	DATA_VALUE	46
777	QT47Cvbx3rt	\N	2017-07-06 18:42:00.554	2017-07-06 18:42:08.93	df48e1cf-fd27-44b5-8c6d-9624c6f2a59c.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/a1fa62d0-0546-49a1-b58e-74a2e78fe816	t	STORED	DATA_VALUE	46
778	hmBcoFSiL4C	\N	2017-07-06 18:42:00.864	2017-07-06 18:42:08.939	a6c9c052-c771-4c02-b67b-6316a7b95968.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/98f81fa4-c9f8-4f5b-a68e-d58908191803	t	STORED	DATA_VALUE	46
779	Yi8wAwaxOKx	\N	2017-07-06 18:42:01.106	2017-07-06 18:42:08.945	8d865fda-550e-4809-b7e6-051716a01e3f.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/f985a3e6-9c8c-4000-be79-b3de164fce6e	t	STORED	DATA_VALUE	46
780	f8nFmiPlXnV	\N	2017-07-06 18:42:01.335	2017-07-06 18:42:08.952	6711d15d-dfe5-42aa-b15c-b089f3716bdd.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/0533a7b2-00ff-44df-9891-093ee6000c51	t	STORED	DATA_VALUE	46
781	v399PNJf7gq	\N	2017-07-06 18:42:01.671	2017-07-06 18:42:08.958	7b666bdf-9a64-4d85-848c-1ed03cae0196.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/d3b704d4-b744-484e-9fda-9ee89c8eb481	t	STORED	DATA_VALUE	46
785	f04IdRJ8ZMm	\N	2017-07-06 18:42:02.833	2017-07-06 18:42:08.99	6022cc37-325a-4817-8ce5-fb8a162fd808.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/80db5b6f-a08a-463c-9263-7d09e30cb459	t	STORED	DATA_VALUE	46
786	wIwvbkaFXZH	\N	2017-07-06 18:42:03.087	2017-07-06 18:42:08.996	8effeb65-47de-4d93-8528-e9d679b92e34.db	application/x-sqlite3	2048	83ec5841272832f41adf5823be8c16c5	dataValue/308286b7-2c73-45d3-993d-7b7bad8f3686	t	STORED	DATA_VALUE	46
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('hibernate_sequence', 989, true);


--
-- Data for Name: i18nlocale; Type: TABLE DATA; Schema: public; Owner: -
--

COPY i18nlocale (i18nlocaleid, uid, code, created, lastupdated, name, locale) FROM stdin;
18	HVS4TYFAq6r	\N	2017-07-04 13:42:50.054	2017-07-04 13:42:50.055	Afrikaans	af
19	uSgnlThKAGX	\N	2017-07-04 13:42:50.057	2017-07-04 13:42:50.057	Arabic	ar
20	XAff0WNCBy3	\N	2017-07-04 13:42:50.058	2017-07-04 13:42:50.058	Bislama	bi
21	jdSSfe7FMe0	\N	2017-07-04 13:42:50.061	2017-07-04 13:42:50.061	Amharic	am
22	n78aaLChIJ0	\N	2017-07-04 13:42:50.062	2017-07-04 13:42:50.062	German	de
23	uh3a75gaJdy	\N	2017-07-04 13:42:50.064	2017-07-04 13:42:50.064	Dzongkha	dz
24	UWWvHPMUSSN	\N	2017-07-04 13:42:50.069	2017-07-04 13:42:50.069	English	en
25	EyX8kFWdCaV	\N	2017-07-04 13:42:50.07	2017-07-04 13:42:50.07	Spanish	es
26	nBHwe6xXsKe	\N	2017-07-04 13:42:50.071	2017-07-04 13:42:50.071	Persian	fa
27	TGdpbsOzTZb	\N	2017-07-04 13:42:50.077	2017-07-04 13:42:50.077	French	fr
28	AeUV2npg4oy	\N	2017-07-04 13:42:50.078	2017-07-04 13:42:50.078	Gujarati	gu
29	P9n19HnbQcf	\N	2017-07-04 13:42:50.079	2017-07-04 13:42:50.079	Hindi	hi
30	tDF730lDvfF	\N	2017-07-04 13:42:50.08	2017-07-04 13:42:50.08	Indonesian	in
31	nZYeOmHpgru	\N	2017-07-04 13:42:50.081	2017-07-04 13:42:50.081	Italian	it
32	EYfJLadht2N	\N	2017-07-04 13:42:50.082	2017-07-04 13:42:50.082	Khmer	km
33	AslFcZoX4Bb	\N	2017-07-04 13:42:50.083	2017-07-04 13:42:50.084	Lao	lo
34	SxgtAzF9xtM	\N	2017-07-04 13:42:50.085	2017-07-04 13:42:50.085	Burmese	my
35	QG39JD7aIk7	\N	2017-07-04 13:42:50.086	2017-07-04 13:42:50.086	Nepali	ne
36	Tr0QN2H2WQD	\N	2017-07-04 13:42:50.089	2017-07-04 13:42:50.089	Dutch	nl
37	fCsds4d9tww	\N	2017-07-04 13:42:50.089	2017-07-04 13:42:50.089	Norwegian	no
38	XV5nfHwEC8i	\N	2017-07-04 13:42:50.09	2017-07-04 13:42:50.09	Pushto	ps
39	Q1V5SJFEb9j	\N	2017-07-04 13:42:50.091	2017-07-04 13:42:50.091	Portuguese	pt
40	fPxDKvQinDD	\N	2017-07-04 13:42:50.091	2017-07-04 13:42:50.091	Russian	ru
41	hIDB4rD24Tm	\N	2017-07-04 13:42:50.092	2017-07-04 13:42:50.092	Kinyarwanda	rw
42	aqGYOIPwTDu	\N	2017-07-04 13:42:50.093	2017-07-04 13:42:50.093	Swahili	sw
43	H1AP0Zw4G6S	\N	2017-07-04 13:42:50.094	2017-07-04 13:42:50.094	Tajik	tg
44	wBdkqIB93Mv	\N	2017-07-04 13:42:50.095	2017-07-04 13:42:50.095	Vietnamese	vi
45	RxzPIAOMbB5	\N	2017-07-04 13:42:50.097	2017-07-04 13:42:50.097	Chinese	zh
\.


--
-- Data for Name: incomingsms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY incomingsms (id, originator, encoding, sentdate, receiveddate, text, gatewayid, status, parsed, statusmessage) FROM stdin;
\.


--
-- Data for Name: indicator; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicator (indicatorid, uid, code, created, lastupdated, name, shortname, description, annualized, decimals, indicatortypeid, numerator, numeratordescription, denominator, denominatordescription, url, legendsetid, aggregateexportcategoryoptioncombo, aggregateexportattributeoptioncombo, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: indicatorattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicatorattributevalues (indicatorid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: indicatorgroup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicatorgroup (indicatorgroupid, uid, code, created, lastupdated, name, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: indicatorgroupattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicatorgroupattributevalues (indicatorgroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: indicatorgroupmembers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicatorgroupmembers (indicatorgroupid, indicatorid) FROM stdin;
\.


--
-- Data for Name: indicatorgroupset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicatorgroupset (indicatorgroupsetid, uid, code, created, lastupdated, name, description, compulsory, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: indicatorgroupsetmembers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicatorgroupsetmembers (indicatorgroupid, indicatorgroupsetid, sort_order) FROM stdin;
\.


--
-- Data for Name: indicatorgroupsettranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicatorgroupsettranslations (indicatorgroupsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: indicatorgroupsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicatorgroupsetusergroupaccesses (indicatorgroupsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: indicatorgrouptranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicatorgrouptranslations (indicatorgroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: indicatorgroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicatorgroupusergroupaccesses (indicatorgroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: indicatortranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicatortranslations (indicatorid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: indicatortype; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicatortype (indicatortypeid, uid, code, created, lastupdated, name, indicatorfactor, indicatornumber) FROM stdin;
\.


--
-- Data for Name: indicatortypetranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicatortypetranslations (indicatortypeid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: indicatorusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY indicatorusergroupaccesses (indicatorid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: intepretation_likedby; Type: TABLE DATA; Schema: public; Owner: -
--

COPY intepretation_likedby (interpretationid, userid) FROM stdin;
\.


--
-- Data for Name: interpretation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY interpretation (interpretationid, uid, lastupdated, reporttableid, chartid, mapid, eventreportid, eventchartid, datasetid, periodid, organisationunitid, interpretationtext, created, likes, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: interpretation_comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY interpretation_comments (interpretationid, sort_order, interpretationcommentid) FROM stdin;
\.


--
-- Data for Name: interpretationcomment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY interpretationcomment (interpretationcommentid, uid, lastupdated, commenttext, userid, created) FROM stdin;
\.


--
-- Data for Name: interpretationusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY interpretationusergroupaccesses (interpretationid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: keyjsonvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY keyjsonvalue (keyjsonvalueid, uid, code, created, lastupdated, namespace, namespacekey, value, encrypted_value, encrypted) FROM stdin;
\.


--
-- Data for Name: legendsetattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY legendsetattributevalues (legendsetid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: legendsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY legendsetusergroupaccesses (maplegendsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: lockexception; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lockexception (lockexceptionid, organisationunitid, periodid, datasetid) FROM stdin;
\.


--
-- Data for Name: map; Type: TABLE DATA; Schema: public; Owner: -
--

COPY map (mapid, uid, code, created, lastupdated, name, description, longitude, latitude, zoom, basemap, title, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: maplegend; Type: TABLE DATA; Schema: public; Owner: -
--

COPY maplegend (maplegendid, uid, code, created, lastupdated, name, startvalue, endvalue, color, image) FROM stdin;
\.


--
-- Data for Name: maplegendset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY maplegendset (maplegendsetid, uid, code, created, lastupdated, name, symbolizer, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: maplegendsetmaplegend; Type: TABLE DATA; Schema: public; Owner: -
--

COPY maplegendsetmaplegend (legendsetid, maplegendid) FROM stdin;
\.


--
-- Data for Name: maplegendsettranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY maplegendsettranslations (maplegendsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: maplegendtranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY maplegendtranslations (maplegendid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: mapmapviews; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapmapviews (mapid, sort_order, mapviewid) FROM stdin;
\.


--
-- Data for Name: mapusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapusergroupaccesses (mapid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: mapview; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapview (mapviewid, uid, code, created, lastupdated, description, layer, relativeperiodsid, userorganisationunit, userorganisationunitchildren, userorganisationunitgrandchildren, aggregationtype, programid, programstageid, startdate, enddate, method, classes, colorlow, colorhigh, colorscale, legendsetid, radiuslow, radiushigh, opacity, orgunitgroupsetid, arearadius, hidden, labels, labelfontsize, labelfontweight, labelfontstyle, labelfontcolor, eventclustering, eventpointcolor, eventpointradius, config) FROM stdin;
\.


--
-- Data for Name: mapview_attributedimensions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapview_attributedimensions (mapviewid, sort_order, trackedentityattributedimensionid) FROM stdin;
\.


--
-- Data for Name: mapview_columns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapview_columns (mapviewid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: mapview_datadimensionitems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapview_datadimensionitems (mapviewid, sort_order, datadimensionitemid) FROM stdin;
\.


--
-- Data for Name: mapview_dataelementdimensions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapview_dataelementdimensions (mapviewid, sort_order, trackedentitydataelementdimensionid) FROM stdin;
\.


--
-- Data for Name: mapview_itemorgunitgroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapview_itemorgunitgroups (mapviewid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: mapview_organisationunits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapview_organisationunits (mapviewid, sort_order, organisationunitid) FROM stdin;
\.


--
-- Data for Name: mapview_orgunitlevels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapview_orgunitlevels (mapviewid, sort_order, orgunitlevel) FROM stdin;
\.


--
-- Data for Name: mapview_periods; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapview_periods (mapviewid, sort_order, periodid) FROM stdin;
\.


--
-- Data for Name: mapviewtranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapviewtranslations (mapviewid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: -
--

COPY message (messageid, uid, created, lastupdated, messagetext, internal, metadata, userid) FROM stdin;
\.


--
-- Data for Name: messageconversation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY messageconversation (messageconversationid, uid, messagecount, created, lastupdated, subject, priority, status, lastsenderid, lastmessage, userid) FROM stdin;
\.


--
-- Data for Name: messageconversation_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY messageconversation_messages (messageconversationid, sort_order, messageid) FROM stdin;
\.


--
-- Data for Name: messageconversation_usermessages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY messageconversation_usermessages (messageconversationid, usermessageid) FROM stdin;
\.


--
-- Data for Name: metadataversion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY metadataversion (versionid, uid, code, created, lastupdated, name, versiontype, importdate, hashcode) FROM stdin;
\.


--
-- Data for Name: minmaxdataelement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY minmaxdataelement (minmaxdataelementid, sourceid, dataelementid, categoryoptioncomboid, minimumvalue, maximumvalue, generatedvalue) FROM stdin;
\.


--
-- Data for Name: oauth2client; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oauth2client (oauth2clientid, uid, code, created, lastupdated, name, cid, secret) FROM stdin;
\.


--
-- Data for Name: oauth2clientgranttypes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oauth2clientgranttypes (oauth2clientid, sort_order, granttype) FROM stdin;
\.


--
-- Data for Name: oauth2clientredirecturis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oauth2clientredirecturis (oauth2clientid, sort_order, redirecturi) FROM stdin;
\.


--
-- Data for Name: oauth_access_token; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oauth_access_token (token_id, token, authentication_id, user_name, client_id, authentication, refresh_token) FROM stdin;
\.


--
-- Data for Name: oauth_code; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oauth_code (code, authentication) FROM stdin;
\.


--
-- Data for Name: oauth_refresh_token; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oauth_refresh_token (token_id, token, authentication) FROM stdin;
\.


--
-- Data for Name: objecttranslation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY objecttranslation (objecttranslationid, locale, property, value) FROM stdin;
\.


--
-- Data for Name: optionattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionattributevalues (optionvalueid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: optiongroup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optiongroup (optiongroupid, uid, code, created, lastupdated, name, shortname, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: optiongroupattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optiongroupattributevalues (optiongroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: optiongroupmembers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optiongroupmembers (optiongroupid, optionid) FROM stdin;
\.


--
-- Data for Name: optiongroupset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optiongroupset (optiongroupsetid, uid, code, created, lastupdated, name, description, datadimension, optionsetid, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: optiongroupsetmembers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optiongroupsetmembers (optiongroupsetid, sort_order, optiongroupid) FROM stdin;
\.


--
-- Data for Name: optiongroupsettranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optiongroupsettranslations (optiongroupsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: optiongroupsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optiongroupsetusergroupaccesses (optiongroupsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: optiongrouptranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optiongrouptranslations (optiongroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: optiongroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optiongroupusergroupaccesses (optiongroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: optionset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionset (optionsetid, uid, code, created, lastupdated, name, valuetype, version, userid, publicaccess) FROM stdin;
63	LAWwdYur1ds	\N	2017-07-04 15:43:49.467	2017-07-04 15:48:08.006	ICD-10	TEXT	0	46	rw------
71	JFWEdW5OBJp	\N	2017-07-04 15:49:10.675	2017-07-06 12:37:04.666	Sex	TEXT	0	46	rw------
\.


--
-- Data for Name: optionsetattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionsetattributevalues (optionsetid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: optionsettranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionsettranslations (optionsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: optionsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionsetusergroupaccesses (optionsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (optionvalueid, uid, code, name, created, lastupdated, optionsetid, sort_order) FROM stdin;
64	ODI2h0oFTdR	A17.-	Tuberculosis of nervous system	2017-07-04 15:45:07.212	2017-07-04 15:45:07.234	63	1
65	aTEPC5XCNCy	A17.0	Tuberculous meningitis	2017-07-04 15:45:19.74	2017-07-04 15:45:19.76	63	2
66	RKaFzfsgSHl	A17.1	Meningeal tuberculoma	2017-07-04 15:45:32.144	2017-07-04 15:45:32.168	63	3
67	gkHvICP3oKo	A17.8	Other tuberculosis of nervous system	2017-07-04 15:45:45.012	2017-07-04 15:45:45.041	63	4
68	UydXNNpZ5sN	B05.-	Measles	2017-07-04 15:46:21.062	2017-07-04 15:46:21.086	63	5
69	rHzeHsdj0hB	B20.-	Human immunodeficiency virus [HIV] disease resulting in infectious and parasitic diseases	2017-07-04 15:46:38.589	2017-07-04 15:46:38.622	63	6
70	qJ8aKmh2vul	E50.-	Vitamin A deficiency	2017-07-04 15:48:07.769	2017-07-04 15:48:07.813	63	7
118	Vw5XhyBWXAz	missing	missing	2017-07-06 12:37:04.553	2017-07-06 12:37:04.571	71	5
117	gpAfW9h7DD4	intermediate	intermediate	2017-07-06 12:36:38.32	2017-07-06 12:37:10.621	71	4
107	BVVazQh8xEV	unknown	unknown	2017-07-05 14:20:31.014	2017-07-06 12:37:15.884	71	3
72	xL2Ie1WLGLf	male	male	2017-07-04 15:49:16.689	2017-07-06 12:38:10.292	71	1
73	PQZm3JB8rlX	female	female	2017-07-04 15:49:23.575	2017-07-06 12:38:16.298	71	2
\.


--
-- Data for Name: optionvaluetranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvaluetranslations (optionvalueid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: organisationunit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organisationunit (organisationunitid, uid, code, created, lastupdated, name, shortname, parentid, path, hierarchylevel, description, openingdate, closeddate, comment, featuretype, coordinates, url, contactperson, address, email, phonenumber, userid) FROM stdin;
50	Sd8e3Yi0vZA	\N	2017-07-04 14:04:38.363	2017-07-04 14:04:38.409	RegionA	RegionA	49	/wEVB21sQaHu/Sd8e3Yi0vZA	2	\N	2017-07-03	\N	\N	NONE	\N	\N	\N	\N	\N	\N	46
51	SCVeBskgiK6	\N	2017-07-04 14:05:03.419	2017-07-04 14:05:03.441	DistrictA1	DistrictA1	50	/wEVB21sQaHu/Sd8e3Yi0vZA/SCVeBskgiK6	3	\N	2017-07-03	\N	\N	NONE	\N	\N	\N	\N	\N	\N	46
52	CXmC6GyG6GI	\N	2017-07-04 14:05:56.336	2017-07-04 14:05:56.377	FacilityA11	FacilityA11	51	/wEVB21sQaHu/Sd8e3Yi0vZA/SCVeBskgiK6/CXmC6GyG6GI	4	\N	2017-07-03	\N	\N	NONE	\N	\N	\N	\N	\N	\N	46
53	RoEPvkwiu7U	\N	2017-07-04 14:06:20.331	2017-07-04 14:06:20.356	FacilityA12	FacilityA12	51	/wEVB21sQaHu/Sd8e3Yi0vZA/SCVeBskgiK6/RoEPvkwiu7U	4	\N	2017-07-03	\N	\N	NONE	\N	\N	\N	\N	\N	\N	46
49	wEVB21sQaHu	\N	2017-07-04 14:04:13.026	2017-07-07 07:30:56.881	National	National	\N	/wEVB21sQaHu	1	\N	2017-07-03	\N	\N	NONE	\N	\N	\N	\N	\N	\N	46
\.


--
-- Data for Name: organisationunitattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organisationunitattributevalues (organisationunitid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: organisationunittranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organisationunittranslations (organisationunitid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: orgunitgroup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY orgunitgroup (orgunitgroupid, uid, code, created, lastupdated, name, shortname, symbol, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: orgunitgroupattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY orgunitgroupattributevalues (orgunitgroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupmembers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY orgunitgroupmembers (organisationunitid, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY orgunitgroupset (orgunitgroupsetid, uid, code, created, lastupdated, name, description, compulsory, datadimension, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: orgunitgroupsetattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY orgunitgroupsetattributevalues (orgunitgroupsetid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupsetmembers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY orgunitgroupsetmembers (orgunitgroupid, orgunitgroupsetid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupsettranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY orgunitgroupsettranslations (orgunitgroupsetid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupsetusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY orgunitgroupsetusergroupaccesses (orgunitgroupsetid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: orgunitgrouptranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY orgunitgrouptranslations (orgunitgroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: orgunitgroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY orgunitgroupusergroupaccesses (orgunitgroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: orgunitlevel; Type: TABLE DATA; Schema: public; Owner: -
--

COPY orgunitlevel (orgunitlevelid, uid, code, created, lastupdated, name, level, offlinelevels) FROM stdin;
59	v5ma5ovLova	\N	2017-07-04 15:01:48.264	2017-07-04 15:01:48.265	Country	1	\N
60	OkpqQz1MeDi	\N	2017-07-04 15:01:48.269	2017-07-04 15:01:48.269	Region	2	\N
61	wpgJvS5wu6k	\N	2017-07-04 15:01:48.273	2017-07-04 15:01:48.274	District	3	\N
62	NpovHXpe0vP	\N	2017-07-04 15:01:48.276	2017-07-04 15:01:48.277	Facility	4	\N
\.


--
-- Data for Name: orgunitleveltranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY orgunitleveltranslations (orgunitlevelid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: outbound_sms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY outbound_sms (id, date, message, status, sender) FROM stdin;
\.


--
-- Data for Name: outbound_sms_recipients; Type: TABLE DATA; Schema: public; Owner: -
--

COPY outbound_sms_recipients (outbound_sms_id, elt) FROM stdin;
\.


--
-- Data for Name: period; Type: TABLE DATA; Schema: public; Owner: -
--

COPY period (periodid, periodtypeid, startdate, enddate) FROM stdin;
\.


--
-- Data for Name: periodtype; Type: TABLE DATA; Schema: public; Owner: -
--

COPY periodtype (periodtypeid, name) FROM stdin;
1	Daily
2	Weekly
3	Monthly
4	BiMonthly
5	Quarterly
6	SixMonthly
7	SixMonthlyApril
8	Yearly
9	FinancialApril
10	FinancialJuly
11	FinancialOct
\.


--
-- Data for Name: predictor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predictor (predictorid, uid, code, created, lastupdated, name, description, generatorexpressionid, generatoroutput, generatoroutputcombo, skiptestexpressionid, periodtypeid, sequentialsamplecount, annualsamplecount, sequentialskipcount) FROM stdin;
\.


--
-- Data for Name: predictororgunitlevels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predictororgunitlevels (predictorid, orgunitlevelid) FROM stdin;
\.


--
-- Data for Name: program; Type: TABLE DATA; Schema: public; Owner: -
--

COPY program (programid, uid, code, created, lastupdated, name, shortname, description, version, enrollmentdatelabel, incidentdatelabel, type, displayincidentdate, onlyenrollonce, skipoffline, displayfrontpagelist, usefirststageduringregistration, capturecoordinates, expirydays, completeeventsexpirydays, expiryperiodtypeid, ignoreoverdueevents, selectenrollmentdatesinfuture, selectincidentdatesinfuture, relationshiptext, relationshiptypeid, relationshipfroma, relatedprogramid, dataentrymethod, categorycomboid, trackedentityid, dataentryformid, workflowid, userid, publicaccess) FROM stdin;
92	sv91bCroFFx	\N	2017-07-04 16:37:09.522	2017-07-05 13:47:58.624	Verbal Autopsy	VA	\N	1	Enrollment Date	Incident Date	WITHOUT_REGISTRATION	f	f	f	f	f	f	0	0	\N	f	f	f	\N	\N	\N	\N	f	14	\N	\N	\N	46	rw------
\.


--
-- Data for Name: program_attributes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY program_attributes (programtrackedentityattributeid, uid, code, created, lastupdated, programid, trackedentityattributeid, displayinlist, mandatory, allowfuturedate, sort_order) FROM stdin;
\.


--
-- Data for Name: program_criteria; Type: TABLE DATA; Schema: public; Owner: -
--

COPY program_criteria (programid, validationcriteriaid) FROM stdin;
\.


--
-- Data for Name: program_organisationunits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY program_organisationunits (organisationunitid, programid) FROM stdin;
51	92
\.


--
-- Data for Name: program_userroles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY program_userroles (userroleid, programid) FROM stdin;
101	92
\.


--
-- Data for Name: programattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programattributevalues (programid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: programdataelement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdataelement (programdataelementid, uid, code, created, lastupdated, programid, dataelementid) FROM stdin;
906	pXqKPSGOJ4Z	\N	2017-07-06 22:09:39.921	2017-07-06 22:09:39.922	92	89
\.


--
-- Data for Name: programdataelementtranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdataelementtranslations (programdataelementid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programexpression; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programexpression (programexpressionid, description, expression) FROM stdin;
\.


--
-- Data for Name: programindicator; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programindicator (programindicatorid, uid, code, created, lastupdated, name, shortname, description, programid, expression, filter, aggregationtype, decimals, legendsetid, aggregateexportcategoryoptioncombo, aggregateexportattributeoptioncombo, displayinform, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: programindicatorattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programindicatorattributevalues (programindicatorid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: programindicatorgroup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programindicatorgroup (programindicatorgroupid, uid, code, created, lastupdated, name, description, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: programindicatorgroupattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programindicatorgroupattributevalues (programindicatorgroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: programindicatorgroupmembers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programindicatorgroupmembers (programindicatorgroupid, programindicatorid) FROM stdin;
\.


--
-- Data for Name: programindicatorgrouptranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programindicatorgrouptranslations (programindicatorgroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programindicatorgroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programindicatorgroupusergroupaccesses (programindicatorgroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: programindicatortranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programindicatortranslations (programindicatorid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programindicatorusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programindicatorusergroupaccesses (programindicatorid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: programinstance; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programinstance (programinstanceid, uid, created, lastupdated, incidentdate, enrollmentdate, enddate, followup, completedby, longitude, latitude, status, trackedentityinstanceid, programid, organisationunitid) FROM stdin;
94	MwhrLwEMlj2	2017-07-04 16:37:09.551	2017-07-04 16:37:09.553	2017-07-04 16:37:09.551	2017-07-04 16:37:09.551	\N	f	\N	\N	\N	ACTIVE	\N	92	\N
\.


--
-- Data for Name: programinstance_messageconversation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programinstance_messageconversation (programinstanceid, sort_order, messageconversationid) FROM stdin;
\.


--
-- Data for Name: programinstancecomments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programinstancecomments (programinstanceid, sort_order, trackedentitycommentid) FROM stdin;
\.


--
-- Data for Name: programmessage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programmessage (id, uid, code, created, lastupdated, text, subject, processeddate, messagestatus, trackedentityinstanceid, organisationunitid, programinstanceid, programstageinstanceid) FROM stdin;
\.


--
-- Data for Name: programmessage_deliverychannels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programmessage_deliverychannels (programmessagedeliverychannelsid, deliverychannel) FROM stdin;
\.


--
-- Data for Name: programmessage_emailaddresses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programmessage_emailaddresses (programmessageemailaddressid, email) FROM stdin;
\.


--
-- Data for Name: programmessage_phonenumbers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programmessage_phonenumbers (programmessagephonenumberid, phonenumber) FROM stdin;
\.


--
-- Data for Name: programmessagetranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programmessagetranslations (id, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programnotificationtemplate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programnotificationtemplate (programnotificationtemplateid, uid, code, created, lastupdated, name, relativescheduleddays, usergroupid, subjecttemplate, messagetemplate, notificationtrigger, notificationrecipienttype, programstageid, programid) FROM stdin;
\.


--
-- Data for Name: programnotificationtemplate_deliverychannel; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programnotificationtemplate_deliverychannel (programnotificationtemplatedeliverychannelid, deliverychannel) FROM stdin;
\.


--
-- Data for Name: programrule; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrule (programruleid, uid, code, created, lastupdated, name, description, programid, programstageid, rulecondition, priority) FROM stdin;
\.


--
-- Data for Name: programruleaction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programruleaction (programruleactionid, uid, code, created, lastupdated, programruleid, actiontype, dataelementid, trackedentityattributeid, programindicatorid, programstagesectionid, programstageid, location, content, data) FROM stdin;
\.


--
-- Data for Name: programruletranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programruletranslations (programruleid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programrulevariable; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrulevariable (programrulevariableid, uid, code, created, lastupdated, name, programid, sourcetype, trackedentityattributeid, dataelementid, usecodeforoptionset, programstageid) FROM stdin;
\.


--
-- Data for Name: programstage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programstage (programstageid, uid, code, created, lastupdated, name, description, mindaysfromstart, programid, repeatable, dataentryformid, standardinterval, executiondatelabel, autogenerateevent, validcompleteonly, displaygenerateeventbox, capturecoordinates, generatedbyenrollmentdate, blockentryform, remindcompleted, allowgeneratenextvisit, openafterenrollment, reportdatetouse, pregenerateuid, hideduedate, sort_order, periodtypeid) FROM stdin;
93	FwAlkJf16OE	\N	2017-07-04 16:37:09.543	2017-07-04 16:49:01.141	Verbal Autopsy	\N	0	92	f	\N	\N	Date of death	t	f	f	f	f	f	f	f	f	\N	f	f	\N	\N
\.


--
-- Data for Name: programstageattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programstageattributevalues (programstageid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: programstagedataelement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programstagedataelement (programstagedataelementid, uid, code, created, lastupdated, programstageid, dataelementid, compulsory, allowprovidedelsewhere, sort_order, displayinreports, allowfuturedate, programstagesectionid, section_sort_order) FROM stdin;
95	tMSRhr0fhFG	\N	2017-07-04 16:49:01.1	2017-07-04 16:49:01.1	93	86	t	f	0	t	f	\N	\N
96	onMR39vIfCI	\N	2017-07-04 16:49:01.111	2017-07-04 16:49:01.111	93	87	t	f	1	f	f	\N	\N
97	iLfIBBH7yUt	\N	2017-07-04 16:49:01.118	2017-07-04 16:49:01.119	93	88	f	f	2	f	f	\N	\N
98	T81RzF8vMoC	\N	2017-07-04 16:49:01.124	2017-07-04 16:49:01.124	93	89	f	f	3	f	f	\N	\N
99	rjwy9pvOEhp	\N	2017-07-04 16:49:01.13	2017-07-04 16:49:01.13	93	90	t	f	4	f	f	\N	\N
100	r90EyxX4dM1	\N	2017-07-04 16:49:01.137	2017-07-04 16:49:01.137	93	91	f	f	5	f	f	\N	\N
\.


--
-- Data for Name: programstageinstance; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programstageinstance (programstageinstanceid, uid, created, lastupdated, programinstanceid, programstageid, attributeoptioncomboid, storedby, duedate, executiondate, organisationunitid, status, longitude, latitude, completedby, completeddate) FROM stdin;
109	GjsEt57C84W	2017-07-05 15:10:49.192	2017-07-05 16:51:33.348	94	93	15	va-demo	2017-07-05 16:51:33.325	2017-07-05 00:00:00	51	ACTIVE	\N	\N	\N	\N
340	CPFt2OohXej	2017-07-06 18:25:19.171	2017-07-06 18:25:19.174	94	93	15	\N	2017-07-06 18:25:19.166	2016-11-19 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
341	Tc0NsvzdOo1	2017-07-06 18:25:19.196	2017-07-06 18:25:19.197	94	93	15	\N	2017-07-06 18:25:19.193	2016-01-29 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
342	wtUE1I1XsVL	2017-07-06 18:25:19.22	2017-07-06 18:25:19.222	94	93	15	\N	2017-07-06 18:25:19.219	2016-04-30 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
343	gJO66HARBxg	2017-07-06 18:25:19.242	2017-07-06 18:25:19.244	94	93	15	\N	2017-07-06 18:25:19.24	2017-05-17 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
345	i32ZofrxwME	2017-07-06 18:25:19.27	2017-07-06 18:25:19.271	94	93	15	\N	2017-07-06 18:25:19.269	2017-06-07 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
346	LldcMdj0Lmd	2017-07-06 18:25:19.279	2017-07-06 18:25:19.28	94	93	15	\N	2017-07-06 18:25:19.278	2017-05-10 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
347	GdiwgE8DHrK	2017-07-06 18:25:19.288	2017-07-06 18:25:19.289	94	93	15	\N	2017-07-06 18:25:19.287	2017-02-21 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
348	pZX6onkaTuh	2017-07-06 18:25:19.296	2017-07-06 18:25:19.297	94	93	15	\N	2017-07-06 18:25:19.295	2016-07-22 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
349	drWmEa2kIfi	2017-07-06 18:25:19.305	2017-07-06 18:25:19.306	94	93	15	\N	2017-07-06 18:25:19.304	2016-12-24 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
350	gTFFqFNHcB7	2017-07-06 18:25:19.313	2017-07-06 18:25:19.316	94	93	15	\N	2017-07-06 18:25:19.312	2016-06-26 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
351	lNeBYNT76FN	2017-07-06 18:25:19.323	2017-07-06 18:25:19.324	94	93	15	\N	2017-07-06 18:25:19.322	2016-01-03 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
352	zqmvADLs1EF	2017-07-06 18:25:19.331	2017-07-06 18:25:19.332	94	93	15	\N	2017-07-06 18:25:19.33	2016-12-03 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
353	CfgqF9H4c6m	2017-07-06 18:25:19.338	2017-07-06 18:25:19.339	94	93	15	\N	2017-07-06 18:25:19.337	2017-03-10 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
354	bhaP2ITYzey	2017-07-06 18:25:19.346	2017-07-06 18:25:19.347	94	93	15	\N	2017-07-06 18:25:19.345	2016-02-13 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
355	voCsd4nnDTI	2017-07-06 18:25:19.354	2017-07-06 18:25:19.355	94	93	15	\N	2017-07-06 18:25:19.353	2017-05-28 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
356	EtCKAVREO1V	2017-07-06 18:25:19.361	2017-07-06 18:25:19.362	94	93	15	\N	2017-07-06 18:25:19.36	2016-08-13 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
357	yAe7B1B2wkK	2017-07-06 18:25:19.368	2017-07-06 18:25:19.369	94	93	15	\N	2017-07-06 18:25:19.367	2016-08-14 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
358	Q5KdAr8BfHB	2017-07-06 18:25:19.375	2017-07-06 18:25:19.376	94	93	15	\N	2017-07-06 18:25:19.374	2017-04-09 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
359	LoVl9UVeCrT	2017-07-06 18:25:19.382	2017-07-06 18:25:19.383	94	93	15	\N	2017-07-06 18:25:19.381	2017-06-30 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
360	BxPRq9Mo1KM	2017-07-06 18:25:19.388	2017-07-06 18:25:19.389	94	93	15	\N	2017-07-06 18:25:19.387	2016-05-19 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
361	fC6k5uTSiQU	2017-07-06 18:25:19.396	2017-07-06 18:25:19.397	94	93	15	\N	2017-07-06 18:25:19.395	2016-07-19 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
362	AX7aNi812Vc	2017-07-06 18:25:19.403	2017-07-06 18:25:19.403	94	93	15	\N	2017-07-06 18:25:19.402	2016-06-10 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
363	gPdYOobxsRt	2017-07-06 18:25:19.409	2017-07-06 18:25:19.41	94	93	15	\N	2017-07-06 18:25:19.408	2016-06-22 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
364	hrDpboItL4m	2017-07-06 18:25:19.415	2017-07-06 18:25:19.416	94	93	15	\N	2017-07-06 18:25:19.414	2017-03-11 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
365	QdgNVul8zOr	2017-07-06 18:25:19.421	2017-07-06 18:25:19.422	94	93	15	\N	2017-07-06 18:25:19.42	2016-07-10 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
366	cPblORTKdq7	2017-07-06 18:25:19.431	2017-07-06 18:25:19.432	94	93	15	\N	2017-07-06 18:25:19.43	2016-07-02 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
367	PlOBCa3VrAQ	2017-07-06 18:25:19.438	2017-07-06 18:25:19.439	94	93	15	\N	2017-07-06 18:25:19.437	2016-05-12 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
368	gNula0UxIa8	2017-07-06 18:25:19.445	2017-07-06 18:25:19.446	94	93	15	\N	2017-07-06 18:25:19.444	2016-06-09 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
369	IQ0mjHxeVCy	2017-07-06 18:25:19.456	2017-07-06 18:25:19.457	94	93	15	\N	2017-07-06 18:25:19.455	2016-05-24 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
370	iaaMJcu2Xri	2017-07-06 18:25:19.464	2017-07-06 18:25:19.465	94	93	15	\N	2017-07-06 18:25:19.463	2017-02-21 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
371	xkpP64LrHxJ	2017-07-06 18:25:19.472	2017-07-06 18:25:19.473	94	93	15	\N	2017-07-06 18:25:19.47	2017-06-06 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
540	BaICVWIKT2A	2017-07-06 18:26:36.615	2017-07-06 18:26:36.616	94	93	15	\N	2017-07-06 18:26:36.614	2017-01-22 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
541	G5yNbYV7SDq	2017-07-06 18:26:36.635	2017-07-06 18:26:36.636	94	93	15	\N	2017-07-06 18:26:36.634	2016-02-05 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
542	Drs5HNWUmOK	2017-07-06 18:26:36.644	2017-07-06 18:26:36.645	94	93	15	\N	2017-07-06 18:26:36.644	2017-03-03 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
543	Uz6tphig4tm	2017-07-06 18:26:36.655	2017-07-06 18:26:36.656	94	93	15	\N	2017-07-06 18:26:36.654	2016-08-23 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
544	o8Vd32c1qky	2017-07-06 18:26:36.662	2017-07-06 18:26:36.663	94	93	15	\N	2017-07-06 18:26:36.662	2017-04-30 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
545	v6nXIfpdmK7	2017-07-06 18:26:36.669	2017-07-06 18:26:36.67	94	93	15	\N	2017-07-06 18:26:36.669	2016-08-02 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
546	X5Ekotfvxll	2017-07-06 18:26:36.676	2017-07-06 18:26:36.677	94	93	15	\N	2017-07-06 18:26:36.675	2017-04-08 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
547	a7uphle5vKu	2017-07-06 18:26:36.684	2017-07-06 18:26:36.685	94	93	15	\N	2017-07-06 18:26:36.683	2016-02-18 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
548	MGOyu62QLag	2017-07-06 18:26:36.691	2017-07-06 18:26:36.691	94	93	15	\N	2017-07-06 18:26:36.69	2016-04-19 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
549	aMNCOl0BG1F	2017-07-06 18:26:36.697	2017-07-06 18:26:36.698	94	93	15	\N	2017-07-06 18:26:36.697	2016-02-29 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
550	xrTl0OghDEH	2017-07-06 18:26:36.704	2017-07-06 18:26:36.705	94	93	15	\N	2017-07-06 18:26:36.703	2017-06-16 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
551	Z2V8h84qj8d	2017-07-06 18:26:36.711	2017-07-06 18:26:36.711	94	93	15	\N	2017-07-06 18:26:36.71	2016-09-24 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
552	liAAjrSJ1Ek	2017-07-06 18:26:36.717	2017-07-06 18:26:36.717	94	93	15	\N	2017-07-06 18:26:36.716	2016-11-09 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
553	YqHEeWPiWvo	2017-07-06 18:26:36.723	2017-07-06 18:26:36.723	94	93	15	\N	2017-07-06 18:26:36.722	2016-03-23 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
787	ww2uBMO8Kcz	2017-07-06 18:42:08.347	2017-07-06 18:42:08.348	94	93	15	\N	2017-07-06 18:42:08.339	2017-06-06 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
788	xFvmL6mviO1	2017-07-06 18:42:08.365	2017-07-06 18:42:08.367	94	93	15	\N	2017-07-06 18:42:08.362	2017-04-03 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
789	vM9ybZn7Z1U	2017-07-06 18:42:08.374	2017-07-06 18:42:08.374	94	93	15	\N	2017-07-06 18:42:08.373	2017-03-13 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
790	vVUTMY2xgY6	2017-07-06 18:42:08.38	2017-07-06 18:42:08.38	94	93	15	\N	2017-07-06 18:42:08.379	2016-09-29 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
791	C8mRB4A19Ci	2017-07-06 18:42:08.39	2017-07-06 18:42:08.391	94	93	15	\N	2017-07-06 18:42:08.39	2016-09-30 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
792	KasoQFPoMCU	2017-07-06 18:42:08.395	2017-07-06 18:42:08.396	94	93	15	\N	2017-07-06 18:42:08.395	2017-03-21 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
793	dE6cM9Vd9fD	2017-07-06 18:42:08.403	2017-07-06 18:42:08.403	94	93	15	\N	2017-07-06 18:42:08.401	2016-08-05 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
344	mVOBDDUlreB	2017-07-06 18:25:19.261	2017-07-07 07:32:21.32	94	93	15	admin	2017-07-07 07:32:21.319	2016-03-28 00:00:00	51	ACTIVE	\N	\N	\N	\N
974	e6lePAR5Fdk	2017-08-17 06:56:19.844	2017-08-17 06:56:19.846	94	93	15	\N	2017-08-17 06:56:19.839	2016-04-15 00:00:00	51	COMPLETED	\N	\N	va-demo	2017-08-17 00:00:00
372	g4T6spQazTy	2017-07-06 18:25:19.481	2017-07-06 18:25:19.482	94	93	15	\N	2017-07-06 18:25:19.478	2017-01-05 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
373	EhEZSJSJm1X	2017-07-06 18:25:19.488	2017-07-06 18:25:19.489	94	93	15	\N	2017-07-06 18:25:19.487	2016-08-17 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
374	pED2PPcvQ2Y	2017-07-06 18:25:19.494	2017-07-06 18:25:19.495	94	93	15	\N	2017-07-06 18:25:19.493	2017-03-21 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
375	rm9lVE0NIk4	2017-07-06 18:25:19.5	2017-07-06 18:25:19.501	94	93	15	\N	2017-07-06 18:25:19.499	2016-09-14 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
376	quAj1jXP4i2	2017-07-06 18:25:19.507	2017-07-06 18:25:19.508	94	93	15	\N	2017-07-06 18:25:19.506	2016-01-16 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
377	bbUNxSPi0rJ	2017-07-06 18:25:19.514	2017-07-06 18:25:19.515	94	93	15	\N	2017-07-06 18:25:19.513	2017-04-16 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
378	JSzIc3VeBGG	2017-07-06 18:25:19.522	2017-07-06 18:25:19.522	94	93	15	\N	2017-07-06 18:25:19.52	2016-10-11 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
379	igfnzNSUxfU	2017-07-06 18:25:19.529	2017-07-06 18:25:19.53	94	93	15	\N	2017-07-06 18:25:19.528	2016-01-13 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
380	JhZWusWd80Z	2017-07-06 18:25:19.537	2017-07-06 18:25:19.538	94	93	15	\N	2017-07-06 18:25:19.536	2016-11-03 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
381	ft9aIN7aE26	2017-07-06 18:25:19.544	2017-07-06 18:25:19.545	94	93	15	\N	2017-07-06 18:25:19.543	2016-02-07 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
382	qwCBHJLe9hx	2017-07-06 18:25:19.551	2017-07-06 18:25:19.552	94	93	15	\N	2017-07-06 18:25:19.55	2017-02-28 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
383	fOBi5p94dzW	2017-07-06 18:25:19.558	2017-07-06 18:25:19.559	94	93	15	\N	2017-07-06 18:25:19.557	2016-03-10 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
384	dQF6o5aCiNc	2017-07-06 18:25:19.566	2017-07-06 18:25:19.566	94	93	15	\N	2017-07-06 18:25:19.565	2016-07-10 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
385	mTQQEG4WdK8	2017-07-06 18:25:19.574	2017-07-06 18:25:19.576	94	93	15	\N	2017-07-06 18:25:19.573	2016-09-06 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
386	FTdVqNtGY12	2017-07-06 18:25:19.588	2017-07-06 18:25:19.588	94	93	15	\N	2017-07-06 18:25:19.587	2016-04-17 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
387	Pr6wp1bIYzE	2017-07-06 18:25:19.598	2017-07-06 18:25:19.599	94	93	15	\N	2017-07-06 18:25:19.597	2017-04-19 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
388	whLBvIqhZqH	2017-07-06 18:25:19.606	2017-07-06 18:25:19.607	94	93	15	\N	2017-07-06 18:25:19.605	2016-02-10 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
389	zI97AnUZbne	2017-07-06 18:25:19.616	2017-07-06 18:25:19.616	94	93	15	\N	2017-07-06 18:25:19.614	2017-02-06 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
390	deaboIMqx0d	2017-07-06 18:25:19.628	2017-07-06 18:25:19.629	94	93	15	\N	2017-07-06 18:25:19.627	2016-05-07 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
391	W3CUthf0xRG	2017-07-06 18:25:19.64	2017-07-06 18:25:19.64	94	93	15	\N	2017-07-06 18:25:19.638	2016-02-20 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
392	tXmwHLO8G3o	2017-07-06 18:25:19.647	2017-07-06 18:25:19.648	94	93	15	\N	2017-07-06 18:25:19.647	2016-12-15 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
393	HcwKY2UkDz0	2017-07-06 18:25:19.655	2017-07-06 18:25:19.656	94	93	15	\N	2017-07-06 18:25:19.655	2016-11-05 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
394	j8EKclfBUTp	2017-07-06 18:25:19.66	2017-07-06 18:25:19.661	94	93	15	\N	2017-07-06 18:25:19.66	2016-06-06 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
395	q45H0cqMoE8	2017-07-06 18:25:19.668	2017-07-06 18:25:19.668	94	93	15	\N	2017-07-06 18:25:19.667	2016-04-08 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
396	Y8jmb6xnNnA	2017-07-06 18:25:19.674	2017-07-06 18:25:19.674	94	93	15	\N	2017-07-06 18:25:19.673	2016-06-25 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
397	i5G6Xe1Hl4M	2017-07-06 18:25:19.679	2017-07-06 18:25:19.68	94	93	15	\N	2017-07-06 18:25:19.679	2016-02-25 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
398	aZYzq6oObg6	2017-07-06 18:25:19.684	2017-07-06 18:25:19.685	94	93	15	\N	2017-07-06 18:25:19.684	2017-04-18 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
399	rjmaxT8HQLw	2017-07-06 18:25:19.689	2017-07-06 18:25:19.69	94	93	15	\N	2017-07-06 18:25:19.689	2016-04-13 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
400	n3yZB4zZtlT	2017-07-06 18:25:19.694	2017-07-06 18:25:19.694	94	93	15	\N	2017-07-06 18:25:19.693	2016-08-08 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
401	wz7r3YV402P	2017-07-06 18:25:19.7	2017-07-06 18:25:19.701	94	93	15	\N	2017-07-06 18:25:19.699	2016-01-12 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
402	fx3wtFVanL6	2017-07-06 18:25:19.707	2017-07-06 18:25:19.708	94	93	15	\N	2017-07-06 18:25:19.706	2016-04-01 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
403	zI8mM74DalN	2017-07-06 18:25:19.714	2017-07-06 18:25:19.714	94	93	15	\N	2017-07-06 18:25:19.713	2017-06-01 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
554	WX5DSh10v1p	2017-07-06 18:26:36.73	2017-07-06 18:26:36.731	94	93	15	\N	2017-07-06 18:26:36.729	2016-04-13 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
555	FbMpooH1Y80	2017-07-06 18:26:36.736	2017-07-06 18:26:36.737	94	93	15	\N	2017-07-06 18:26:36.735	2017-06-06 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
556	qmPszkuQYvw	2017-07-06 18:26:36.743	2017-07-06 18:26:36.744	94	93	15	\N	2017-07-06 18:26:36.742	2017-05-05 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
557	LnNWSllukrB	2017-07-06 18:26:36.749	2017-07-06 18:26:36.75	94	93	15	\N	2017-07-06 18:26:36.749	2017-06-08 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
558	RzIp8v48Po7	2017-07-06 18:26:36.755	2017-07-06 18:26:36.756	94	93	15	\N	2017-07-06 18:26:36.754	2016-06-07 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
559	Cj2Zq747ePV	2017-07-06 18:26:36.761	2017-07-06 18:26:36.761	94	93	15	\N	2017-07-06 18:26:36.76	2016-01-27 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
560	Tp5mLPIzeby	2017-07-06 18:26:36.767	2017-07-06 18:26:36.767	94	93	15	\N	2017-07-06 18:26:36.766	2017-02-22 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
561	rSCKh83kYGt	2017-07-06 18:26:36.773	2017-07-06 18:26:36.773	94	93	15	\N	2017-07-06 18:26:36.772	2016-05-25 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
562	pbIsrdJZjhR	2017-07-06 18:26:36.779	2017-07-06 18:26:36.779	94	93	15	\N	2017-07-06 18:26:36.778	2016-08-10 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
563	b5tohmR8fuI	2017-07-06 18:26:36.784	2017-07-06 18:26:36.785	94	93	15	\N	2017-07-06 18:26:36.783	2016-06-05 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
564	F8Gd9X5ZNJq	2017-07-06 18:26:36.79	2017-07-06 18:26:36.791	94	93	15	\N	2017-07-06 18:26:36.79	2016-12-23 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
565	YXuSCCPEZZ1	2017-07-06 18:26:36.796	2017-07-06 18:26:36.797	94	93	15	\N	2017-07-06 18:26:36.795	2016-05-11 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
566	ueUOBByrI7P	2017-07-06 18:26:36.802	2017-07-06 18:26:36.803	94	93	15	\N	2017-07-06 18:26:36.801	2017-04-01 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
567	FpTVrT8aEyt	2017-07-06 18:26:36.809	2017-07-06 18:26:36.809	94	93	15	\N	2017-07-06 18:26:36.808	2016-02-26 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
568	ZqhwTSZHaqH	2017-07-06 18:26:36.814	2017-07-06 18:26:36.815	94	93	15	\N	2017-07-06 18:26:36.814	2017-03-12 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
794	P71uvglCjOk	2017-07-06 18:42:08.408	2017-07-06 18:42:08.408	94	93	15	\N	2017-07-06 18:42:08.407	2016-03-28 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
795	PdS9llD2YCg	2017-07-06 18:42:08.413	2017-07-06 18:42:08.414	94	93	15	\N	2017-07-06 18:42:08.413	2016-12-25 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
796	U0NXPYpLyES	2017-07-06 18:42:08.418	2017-07-06 18:42:08.418	94	93	15	\N	2017-07-06 18:42:08.417	2017-01-26 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
797	tLVJChJYzkh	2017-07-06 18:42:08.423	2017-07-06 18:42:08.423	94	93	15	\N	2017-07-06 18:42:08.422	2017-03-06 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
798	QYhKwHwckVT	2017-07-06 18:42:08.429	2017-07-06 18:42:08.429	94	93	15	\N	2017-07-06 18:42:08.428	2016-04-30 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
799	B994MslPwp1	2017-07-06 18:42:08.433	2017-07-06 18:42:08.434	94	93	15	\N	2017-07-06 18:42:08.433	2017-03-19 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
800	mBvyWpB1uqI	2017-07-06 18:42:08.44	2017-07-06 18:42:08.44	94	93	15	\N	2017-07-06 18:42:08.439	2016-09-03 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
975	sDFCWZod9HC	2017-08-17 06:56:19.864	2017-08-17 06:56:19.865	94	93	15	\N	2017-08-17 06:56:19.862	2016-06-29 00:00:00	51	COMPLETED	\N	\N	va-demo	2017-08-17 00:00:00
976	WGP8YwKm6Jt	2017-08-17 06:56:19.87	2017-08-17 06:56:19.871	94	93	15	\N	2017-08-17 06:56:19.869	2017-06-17 00:00:00	51	COMPLETED	\N	\N	va-demo	2017-08-17 00:00:00
404	JlhyuOIXWoB	2017-07-06 18:25:19.722	2017-07-06 18:25:19.722	94	93	15	\N	2017-07-06 18:25:19.72	2016-01-08 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
405	LqZqeAE6X3t	2017-07-06 18:25:19.731	2017-07-06 18:25:19.731	94	93	15	\N	2017-07-06 18:25:19.73	2016-11-12 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
406	EYK1mkU1BRt	2017-07-06 18:25:19.744	2017-07-06 18:25:19.745	94	93	15	\N	2017-07-06 18:25:19.743	2017-03-06 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
407	U237JIZ8FRN	2017-07-06 18:25:19.75	2017-07-06 18:25:19.75	94	93	15	\N	2017-07-06 18:25:19.749	2016-06-15 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
408	aUbJHOVqpf3	2017-07-06 18:25:19.755	2017-07-06 18:25:19.756	94	93	15	\N	2017-07-06 18:25:19.755	2016-07-07 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
409	WLQObP8gw7o	2017-07-06 18:25:19.762	2017-07-06 18:25:19.762	94	93	15	\N	2017-07-06 18:25:19.761	2017-04-02 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
410	E1Io7WkG0rI	2017-07-06 18:25:19.768	2017-07-06 18:25:19.769	94	93	15	\N	2017-07-06 18:25:19.768	2016-08-30 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
411	Pqp1bSiqtiW	2017-07-06 18:25:19.774	2017-07-06 18:25:19.775	94	93	15	\N	2017-07-06 18:25:19.773	2017-02-13 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
412	XGJk3zMIFBA	2017-07-06 18:25:19.779	2017-07-06 18:25:19.78	94	93	15	\N	2017-07-06 18:25:19.779	2016-06-04 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
413	RPsuywtik5l	2017-07-06 18:25:19.786	2017-07-06 18:25:19.787	94	93	15	\N	2017-07-06 18:25:19.786	2016-08-27 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
414	RrFEE0xE7nD	2017-07-06 18:25:19.793	2017-07-06 18:25:19.793	94	93	15	\N	2017-07-06 18:25:19.792	2016-02-27 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
415	LE1XSSZlAiG	2017-07-06 18:25:19.798	2017-07-06 18:25:19.799	94	93	15	\N	2017-07-06 18:25:19.798	2016-11-01 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
416	ZTsnkk6wXTU	2017-07-06 18:25:19.804	2017-07-06 18:25:19.805	94	93	15	\N	2017-07-06 18:25:19.803	2016-09-15 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
417	pQA93gCQl6y	2017-07-06 18:25:19.81	2017-07-06 18:25:19.811	94	93	15	\N	2017-07-06 18:25:19.809	2017-02-28 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
418	m1o1PY8JlrZ	2017-07-06 18:25:19.817	2017-07-06 18:25:19.818	94	93	15	\N	2017-07-06 18:25:19.817	2016-02-15 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
419	kMRUpu7eNBy	2017-07-06 18:25:19.823	2017-07-06 18:25:19.824	94	93	15	\N	2017-07-06 18:25:19.823	2017-06-17 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
420	Do3Iuw9mnQt	2017-07-06 18:25:19.829	2017-07-06 18:25:19.83	94	93	15	\N	2017-07-06 18:25:19.828	2016-01-14 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
421	NdiAs7Xo1ck	2017-07-06 18:25:19.838	2017-07-06 18:25:19.838	94	93	15	\N	2017-07-06 18:25:19.837	2016-07-19 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
422	f4XCmv7gRvw	2017-07-06 18:25:19.843	2017-07-06 18:25:19.844	94	93	15	\N	2017-07-06 18:25:19.842	2016-11-30 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
423	IWRjkhCYRvV	2017-07-06 18:25:19.849	2017-07-06 18:25:19.85	94	93	15	\N	2017-07-06 18:25:19.848	2016-02-05 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
424	jutK4wTVADH	2017-07-06 18:25:19.857	2017-07-06 18:25:19.857	94	93	15	\N	2017-07-06 18:25:19.856	2016-04-21 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
425	O5YDUO90SUZ	2017-07-06 18:25:19.862	2017-07-06 18:25:19.863	94	93	15	\N	2017-07-06 18:25:19.862	2017-06-03 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
426	OMyfSn0DF7O	2017-07-06 18:25:19.869	2017-07-06 18:25:19.869	94	93	15	\N	2017-07-06 18:25:19.868	2016-05-31 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
427	WbJY3kP2iie	2017-07-06 18:25:19.875	2017-07-06 18:25:19.875	94	93	15	\N	2017-07-06 18:25:19.874	2016-09-05 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
428	A2VidTtDA26	2017-07-06 18:25:19.882	2017-07-06 18:25:19.883	94	93	15	\N	2017-07-06 18:25:19.881	2016-04-17 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
429	Uu8N7utMr3T	2017-07-06 18:25:19.888	2017-07-06 18:25:19.889	94	93	15	\N	2017-07-06 18:25:19.887	2016-08-08 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
430	cw8EOmXpkvx	2017-07-06 18:25:19.896	2017-07-06 18:25:19.897	94	93	15	\N	2017-07-06 18:25:19.895	2016-07-07 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
431	gFvHxKYsT7z	2017-07-06 18:25:19.902	2017-07-06 18:25:19.903	94	93	15	\N	2017-07-06 18:25:19.901	2017-01-17 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
432	NYrxu0w597E	2017-07-06 18:25:19.909	2017-07-06 18:25:19.91	94	93	15	\N	2017-07-06 18:25:19.908	2017-05-21 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
433	bCc12NasXcp	2017-07-06 18:25:19.916	2017-07-06 18:25:19.917	94	93	15	\N	2017-07-06 18:25:19.915	2017-04-20 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
434	X12p4jEEiv2	2017-07-06 18:25:19.923	2017-07-06 18:25:19.924	94	93	15	\N	2017-07-06 18:25:19.922	2016-06-08 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
435	vNlMYxqpZKr	2017-07-06 18:25:19.929	2017-07-06 18:25:19.93	94	93	15	\N	2017-07-06 18:25:19.928	2016-12-29 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
436	H0zr7EOha3A	2017-07-06 18:25:19.936	2017-07-06 18:25:19.937	94	93	15	\N	2017-07-06 18:25:19.935	2016-03-09 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
569	BTaJvGAXv41	2017-07-06 18:26:36.82	2017-07-06 18:26:36.821	94	93	15	\N	2017-07-06 18:26:36.819	2016-03-19 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
570	Iig4Bn1wUpw	2017-07-06 18:26:36.826	2017-07-06 18:26:36.827	94	93	15	\N	2017-07-06 18:26:36.825	2016-08-15 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
571	CdB3CBNWTyx	2017-07-06 18:26:36.832	2017-07-06 18:26:36.833	94	93	15	\N	2017-07-06 18:26:36.831	2017-04-03 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
572	OfnIQS8k5lG	2017-07-06 18:26:36.84	2017-07-06 18:26:36.84	94	93	15	\N	2017-07-06 18:26:36.839	2016-03-21 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
573	hzSinFtmAk3	2017-07-06 18:26:36.847	2017-07-06 18:26:36.848	94	93	15	\N	2017-07-06 18:26:36.846	2016-01-06 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
574	r0oxYLeyWoF	2017-07-06 18:26:36.853	2017-07-06 18:26:36.854	94	93	15	\N	2017-07-06 18:26:36.852	2016-02-24 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
575	UewiDn2gQFV	2017-07-06 18:26:36.86	2017-07-06 18:26:36.861	94	93	15	\N	2017-07-06 18:26:36.859	2016-02-08 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
576	VRRc556GzdS	2017-07-06 18:26:36.866	2017-07-06 18:26:36.867	94	93	15	\N	2017-07-06 18:26:36.865	2016-12-07 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
577	Su2vvywDHEr	2017-07-06 18:26:36.873	2017-07-06 18:26:36.873	94	93	15	\N	2017-07-06 18:26:36.871	2016-11-14 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
578	iNHQs8NRsv0	2017-07-06 18:26:36.879	2017-07-06 18:26:36.88	94	93	15	\N	2017-07-06 18:26:36.878	2016-10-24 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
579	w0rHDWjatRP	2017-07-06 18:26:36.887	2017-07-06 18:26:36.888	94	93	15	\N	2017-07-06 18:26:36.886	2017-05-26 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
580	xp57OD5hHXc	2017-07-06 18:26:36.895	2017-07-06 18:26:36.896	94	93	15	\N	2017-07-06 18:26:36.894	2016-04-15 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
581	IU4m6TL6Aj3	2017-07-06 18:26:36.903	2017-07-06 18:26:36.903	94	93	15	\N	2017-07-06 18:26:36.902	2017-03-04 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
582	r03ZzzMyzez	2017-07-06 18:26:36.909	2017-07-06 18:26:36.91	94	93	15	\N	2017-07-06 18:26:36.908	2016-03-06 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
583	xwZQyMmwtWR	2017-07-06 18:26:36.916	2017-07-06 18:26:36.917	94	93	15	\N	2017-07-06 18:26:36.915	2016-09-06 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
801	NW5YnLKGNHJ	2017-07-06 18:42:08.445	2017-07-06 18:42:08.445	94	93	15	\N	2017-07-06 18:42:08.444	2017-04-06 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
802	Lw9EidayhwL	2017-07-06 18:42:08.451	2017-07-06 18:42:08.451	94	93	15	\N	2017-07-06 18:42:08.45	2017-05-26 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
803	YaDiIjWnIsS	2017-07-06 18:42:08.456	2017-07-06 18:42:08.456	94	93	15	\N	2017-07-06 18:42:08.455	2017-06-29 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
804	wGAu0yJiD0j	2017-07-06 18:42:08.461	2017-07-06 18:42:08.461	94	93	15	\N	2017-07-06 18:42:08.46	2017-01-17 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
805	uMefToS6SR0	2017-07-06 18:42:08.466	2017-07-06 18:42:08.467	94	93	15	\N	2017-07-06 18:42:08.465	2016-07-20 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
806	frOaYl4e0BX	2017-07-06 18:42:08.471	2017-07-06 18:42:08.472	94	93	15	\N	2017-07-06 18:42:08.471	2017-02-11 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
977	QeCBZ52Ur9O	2017-08-17 06:56:19.872	2017-08-17 06:56:19.873	94	93	15	\N	2017-08-17 06:56:19.872	2016-07-05 00:00:00	51	COMPLETED	\N	\N	va-demo	2017-08-17 00:00:00
978	y8c6kTl2J4O	2017-08-17 06:56:19.876	2017-08-17 06:56:19.877	94	93	15	\N	2017-08-17 06:56:19.875	2016-01-21 00:00:00	51	COMPLETED	\N	\N	va-demo	2017-08-17 00:00:00
979	Pr5fdeBxXqs	2017-08-17 06:56:19.878	2017-08-17 06:56:19.879	94	93	15	\N	2017-08-17 06:56:19.878	2016-07-14 00:00:00	51	COMPLETED	\N	\N	va-demo	2017-08-17 00:00:00
980	C3c7y1OKZvf	2017-08-17 06:56:19.881	2017-08-17 06:56:19.881	94	93	15	\N	2017-08-17 06:56:19.88	2016-06-10 00:00:00	51	COMPLETED	\N	\N	va-demo	2017-08-17 00:00:00
981	yf0SlqlZz5y	2017-08-17 06:56:19.883	2017-08-17 06:56:19.884	94	93	15	\N	2017-08-17 06:56:19.882	2016-12-16 00:00:00	51	COMPLETED	\N	\N	va-demo	2017-08-17 00:00:00
982	a1pPHsmTiqE	2017-08-17 06:56:19.885	2017-08-17 06:56:19.886	94	93	15	\N	2017-08-17 06:56:19.885	2016-02-25 00:00:00	51	COMPLETED	\N	\N	va-demo	2017-08-17 00:00:00
437	SnEQzKHcw73	2017-07-06 18:25:19.943	2017-07-06 18:25:19.944	94	93	15	\N	2017-07-06 18:25:19.942	2017-04-16 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
438	Jx1clcF5TRO	2017-07-06 18:25:19.949	2017-07-06 18:25:19.95	94	93	15	\N	2017-07-06 18:25:19.948	2016-06-23 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
439	oiUlgroMOpu	2017-07-06 18:25:19.957	2017-07-06 18:25:19.958	94	93	15	\N	2017-07-06 18:25:19.956	2017-05-19 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
584	VHdgxQpDRPZ	2017-07-06 18:26:36.923	2017-07-06 18:26:36.924	94	93	15	\N	2017-07-06 18:26:36.922	2017-05-19 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
585	JudnXYji43M	2017-07-06 18:26:36.93	2017-07-06 18:26:36.931	94	93	15	\N	2017-07-06 18:26:36.929	2016-03-24 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
586	rOY0MpakHEA	2017-07-06 18:26:36.937	2017-07-06 18:26:36.938	94	93	15	\N	2017-07-06 18:26:36.936	2016-07-09 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
587	jnHLcjTxQ0o	2017-07-06 18:26:36.944	2017-07-06 18:26:36.945	94	93	15	\N	2017-07-06 18:26:36.943	2017-03-23 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
588	bQxH1tmYTnO	2017-07-06 18:26:36.952	2017-07-06 18:26:36.953	94	93	15	\N	2017-07-06 18:26:36.951	2016-01-03 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
589	cGWBKeukyxZ	2017-07-06 18:26:36.96	2017-07-06 18:26:36.961	94	93	15	\N	2017-07-06 18:26:36.959	2016-05-14 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
590	bWJbM00jDq4	2017-07-06 18:26:36.968	2017-07-06 18:26:36.969	94	93	15	\N	2017-07-06 18:26:36.967	2016-07-26 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
591	ckNj5WDRoGI	2017-07-06 18:26:36.979	2017-07-06 18:26:36.979	94	93	15	\N	2017-07-06 18:26:36.978	2016-12-03 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
592	IrZnhnplsyf	2017-07-06 18:26:36.985	2017-07-06 18:26:36.985	94	93	15	\N	2017-07-06 18:26:36.984	2016-01-11 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
593	iEha1NjhiQE	2017-07-06 18:26:36.99	2017-07-06 18:26:36.99	94	93	15	\N	2017-07-06 18:26:36.989	2016-04-25 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
594	qdS5GxuhiZm	2017-07-06 18:26:37.045	2017-07-06 18:26:37.05	94	93	15	\N	2017-07-06 18:26:37.044	2016-12-28 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
595	grwaLdrHJ7b	2017-07-06 18:26:37.057	2017-07-06 18:26:37.058	94	93	15	\N	2017-07-06 18:26:37.056	2016-04-25 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
596	cYNGNBNKLql	2017-07-06 18:26:37.066	2017-07-06 18:26:37.067	94	93	15	\N	2017-07-06 18:26:37.065	2016-01-15 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
597	LhlcaZD5fvE	2017-07-06 18:26:37.078	2017-07-06 18:26:37.084	94	93	15	\N	2017-07-06 18:26:37.077	2016-02-09 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
598	sUfwcnxSoO9	2017-07-06 18:26:37.091	2017-07-06 18:26:37.091	94	93	15	\N	2017-07-06 18:26:37.09	2017-01-01 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
599	YTmFVRmo0fA	2017-07-06 18:26:37.097	2017-07-06 18:26:37.098	94	93	15	\N	2017-07-06 18:26:37.096	2017-03-20 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
600	Ihk7QOgQI1z	2017-07-06 18:26:37.105	2017-07-06 18:26:37.105	94	93	15	\N	2017-07-06 18:26:37.104	2016-09-15 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
601	rDDNWqrKXPS	2017-07-06 18:26:37.111	2017-07-06 18:26:37.111	94	93	15	\N	2017-07-06 18:26:37.11	2016-12-06 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
602	D92rSXvfT3L	2017-07-06 18:26:37.117	2017-07-06 18:26:37.117	94	93	15	\N	2017-07-06 18:26:37.116	2016-01-01 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
603	ry8kF8YVnND	2017-07-06 18:26:37.123	2017-07-06 18:26:37.123	94	93	15	\N	2017-07-06 18:26:37.122	2017-05-10 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
604	n8MrAPHh0yd	2017-07-06 18:26:37.129	2017-07-06 18:26:37.13	94	93	15	\N	2017-07-06 18:26:37.128	2016-04-20 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
605	HCTNxUW1o5L	2017-07-06 18:26:37.135	2017-07-06 18:26:37.135	94	93	15	\N	2017-07-06 18:26:37.134	2016-09-26 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
606	JahsixExLtn	2017-07-06 18:26:37.141	2017-07-06 18:26:37.141	94	93	15	\N	2017-07-06 18:26:37.14	2017-06-11 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
607	TEoU91u2cf3	2017-07-06 18:26:37.146	2017-07-06 18:26:37.147	94	93	15	\N	2017-07-06 18:26:37.146	2017-04-14 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
608	Dzu1C8C9c6E	2017-07-06 18:26:37.152	2017-07-06 18:26:37.153	94	93	15	\N	2017-07-06 18:26:37.151	2017-06-06 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
609	foOjjIFqEZl	2017-07-06 18:26:37.159	2017-07-06 18:26:37.16	94	93	15	\N	2017-07-06 18:26:37.158	2017-02-17 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
610	BLlZH7lYkvP	2017-07-06 18:26:37.166	2017-07-06 18:26:37.166	94	93	15	\N	2017-07-06 18:26:37.165	2017-03-03 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
611	NgwyFWfpfmj	2017-07-06 18:26:37.171	2017-07-06 18:26:37.172	94	93	15	\N	2017-07-06 18:26:37.171	2016-10-05 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
612	odQqOWj07G0	2017-07-06 18:26:37.177	2017-07-06 18:26:37.178	94	93	15	\N	2017-07-06 18:26:37.176	2017-04-21 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
613	pE8Er193TFC	2017-07-06 18:26:37.186	2017-07-06 18:26:37.187	94	93	15	\N	2017-07-06 18:26:37.185	2016-10-14 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
614	M62tbPmvb5w	2017-07-06 18:26:37.193	2017-07-06 18:26:37.194	94	93	15	\N	2017-07-06 18:26:37.192	2016-02-16 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
807	n1DeBQQRUgG	2017-07-06 18:42:08.476	2017-07-06 18:42:08.477	94	93	15	\N	2017-07-06 18:42:08.476	2016-11-11 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
808	FjdQiqjYnlu	2017-07-06 18:42:08.482	2017-07-06 18:42:08.482	94	93	15	\N	2017-07-06 18:42:08.481	2016-12-19 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
809	ZtxMAOVzHxU	2017-07-06 18:42:08.487	2017-07-06 18:42:08.488	94	93	15	\N	2017-07-06 18:42:08.486	2016-01-05 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
810	huflekd5xNU	2017-07-06 18:42:08.492	2017-07-06 18:42:08.493	94	93	15	\N	2017-07-06 18:42:08.491	2016-05-03 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
811	UoegFPTESv3	2017-07-06 18:42:08.498	2017-07-06 18:42:08.498	94	93	15	\N	2017-07-06 18:42:08.497	2016-11-26 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
812	R2lCTOimKcJ	2017-07-06 18:42:08.504	2017-07-06 18:42:08.504	94	93	15	\N	2017-07-06 18:42:08.503	2016-06-25 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
813	io775wDjZso	2017-07-06 18:42:08.51	2017-07-06 18:42:08.511	94	93	15	\N	2017-07-06 18:42:08.51	2016-11-03 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
814	WtAiBa5lwOz	2017-07-06 18:42:08.517	2017-07-06 18:42:08.517	94	93	15	\N	2017-07-06 18:42:08.516	2017-02-15 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
815	R8W993p3DlQ	2017-07-06 18:42:08.522	2017-07-06 18:42:08.523	94	93	15	\N	2017-07-06 18:42:08.521	2017-06-25 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
816	rOTvbBYrnBx	2017-07-06 18:42:08.527	2017-07-06 18:42:08.528	94	93	15	\N	2017-07-06 18:42:08.527	2016-09-01 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
817	FuSGZUKGy2Q	2017-07-06 18:42:08.541	2017-07-06 18:42:08.541	94	93	15	\N	2017-07-06 18:42:08.54	2016-05-19 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
818	z5KH57lnv1d	2017-07-06 18:42:08.546	2017-07-06 18:42:08.547	94	93	15	\N	2017-07-06 18:42:08.546	2016-05-09 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
819	CWyOCvmbAX6	2017-07-06 18:42:08.552	2017-07-06 18:42:08.553	94	93	15	\N	2017-07-06 18:42:08.551	2016-07-08 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
820	qYMPmVYFkFg	2017-07-06 18:42:08.558	2017-07-06 18:42:08.558	94	93	15	\N	2017-07-06 18:42:08.557	2016-11-09 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
983	PFx51qBFc0C	2017-08-17 06:56:19.89	2017-08-17 06:56:19.891	94	93	15	\N	2017-08-17 06:56:19.887	2017-05-04 00:00:00	51	COMPLETED	\N	\N	va-demo	2017-08-17 00:00:00
615	yrs3qQW8WUF	2017-07-06 18:26:37.199	2017-07-06 18:26:37.199	94	93	15	\N	2017-07-06 18:26:37.198	2016-04-10 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
616	NiaQcDtsFhX	2017-07-06 18:26:37.206	2017-07-06 18:26:37.206	94	93	15	\N	2017-07-06 18:26:37.205	2016-02-13 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
617	dbN05hzlwjo	2017-07-06 18:26:37.212	2017-07-06 18:26:37.212	94	93	15	\N	2017-07-06 18:26:37.211	2016-12-09 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
618	YI7p6ChAFN0	2017-07-06 18:26:37.219	2017-07-06 18:26:37.219	94	93	15	\N	2017-07-06 18:26:37.218	2016-11-18 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
619	LlJ6Ufl05Rv	2017-07-06 18:26:37.225	2017-07-06 18:26:37.226	94	93	15	\N	2017-07-06 18:26:37.224	2016-05-30 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
620	wprwQThT5E4	2017-07-06 18:26:37.231	2017-07-06 18:26:37.232	94	93	15	\N	2017-07-06 18:26:37.23	2016-07-18 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
621	eX7MVbX7vHZ	2017-07-06 18:26:37.237	2017-07-06 18:26:37.238	94	93	15	\N	2017-07-06 18:26:37.236	2016-05-04 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
622	oJDRCqODlPw	2017-07-06 18:26:37.243	2017-07-06 18:26:37.244	94	93	15	\N	2017-07-06 18:26:37.243	2016-10-24 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
623	ybgOnVNp3kB	2017-07-06 18:26:37.25	2017-07-06 18:26:37.25	94	93	15	\N	2017-07-06 18:26:37.249	2016-01-10 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
624	Ik8s5Win8au	2017-07-06 18:26:37.256	2017-07-06 18:26:37.257	94	93	15	\N	2017-07-06 18:26:37.255	2016-01-18 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
625	wDCAILUlhcL	2017-07-06 18:26:37.262	2017-07-06 18:26:37.263	94	93	15	\N	2017-07-06 18:26:37.261	2016-10-24 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
626	KQsvJVfs6sc	2017-07-06 18:26:37.268	2017-07-06 18:26:37.269	94	93	15	\N	2017-07-06 18:26:37.267	2016-01-21 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
627	A6eXlJmrs8S	2017-07-06 18:26:37.275	2017-07-06 18:26:37.276	94	93	15	\N	2017-07-06 18:26:37.274	2016-12-31 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
628	HD7G9eT9KAW	2017-07-06 18:26:37.282	2017-07-06 18:26:37.283	94	93	15	\N	2017-07-06 18:26:37.281	2016-07-27 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
629	hI1e9QjSSWt	2017-07-06 18:26:37.289	2017-07-06 18:26:37.29	94	93	15	\N	2017-07-06 18:26:37.288	2017-02-16 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
630	dY4n5WJrnpa	2017-07-06 18:26:37.297	2017-07-06 18:26:37.298	94	93	15	\N	2017-07-06 18:26:37.296	2016-05-18 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
631	whJsgF22o8t	2017-07-06 18:26:37.311	2017-07-06 18:26:37.313	94	93	15	\N	2017-07-06 18:26:37.309	2016-11-29 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
632	QKR7n25QzOG	2017-07-06 18:26:37.324	2017-07-06 18:26:37.325	94	93	15	\N	2017-07-06 18:26:37.322	2016-04-26 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
633	fej9A4Ro8cl	2017-07-06 18:26:37.336	2017-07-06 18:26:37.337	94	93	15	\N	2017-07-06 18:26:37.334	2017-05-11 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
634	lYZIcxJ6FGg	2017-07-06 18:26:37.346	2017-07-06 18:26:37.348	94	93	15	\N	2017-07-06 18:26:37.345	2016-03-11 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
635	cCe8AHdYLgX	2017-07-06 18:26:37.357	2017-07-06 18:26:37.358	94	93	15	\N	2017-07-06 18:26:37.355	2016-12-07 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
636	RfBvxplYqCh	2017-07-06 18:26:37.367	2017-07-06 18:26:37.368	94	93	15	\N	2017-07-06 18:26:37.366	2016-02-01 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
637	zQKAIrVC6yh	2017-07-06 18:26:37.377	2017-07-06 18:26:37.378	94	93	15	\N	2017-07-06 18:26:37.375	2016-04-29 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
638	UbLqrQGM2pq	2017-07-06 18:26:37.386	2017-07-06 18:26:37.387	94	93	15	\N	2017-07-06 18:26:37.384	2016-04-10 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
639	XYj4xM0Pmte	2017-07-06 18:26:37.396	2017-07-06 18:26:37.397	94	93	15	\N	2017-07-06 18:26:37.395	2016-09-14 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
821	bLUtrFkbIAX	2017-07-06 18:42:08.564	2017-07-06 18:42:08.564	94	93	15	\N	2017-07-06 18:42:08.563	2017-06-14 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
822	Why3zDnVCs0	2017-07-06 18:42:08.57	2017-07-06 18:42:08.571	94	93	15	\N	2017-07-06 18:42:08.569	2016-07-11 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
823	iN5il0uoktB	2017-07-06 18:42:08.576	2017-07-06 18:42:08.577	94	93	15	\N	2017-07-06 18:42:08.575	2016-01-02 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
824	EU3zr4Dtt7p	2017-07-06 18:42:08.582	2017-07-06 18:42:08.583	94	93	15	\N	2017-07-06 18:42:08.581	2017-05-18 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
825	cK8sJ8E6XGb	2017-07-06 18:42:08.588	2017-07-06 18:42:08.588	94	93	15	\N	2017-07-06 18:42:08.587	2017-03-11 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
826	tLb6Ko0ItBA	2017-07-06 18:42:08.594	2017-07-06 18:42:08.595	94	93	15	\N	2017-07-06 18:42:08.593	2016-04-21 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
827	KMV6Puslg02	2017-07-06 18:42:08.6	2017-07-06 18:42:08.601	94	93	15	\N	2017-07-06 18:42:08.599	2017-02-05 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
828	Zcm8KIF4ZC7	2017-07-06 18:42:08.606	2017-07-06 18:42:08.607	94	93	15	\N	2017-07-06 18:42:08.605	2017-04-18 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
829	uQH19vIxg51	2017-07-06 18:42:08.613	2017-07-06 18:42:08.613	94	93	15	\N	2017-07-06 18:42:08.612	2017-01-07 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
830	SATGrZ1fUKB	2017-07-06 18:42:08.619	2017-07-06 18:42:08.62	94	93	15	\N	2017-07-06 18:42:08.618	2017-01-03 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
831	Klk7Mf6E329	2017-07-06 18:42:08.626	2017-07-06 18:42:08.627	94	93	15	\N	2017-07-06 18:42:08.625	2017-01-04 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
832	uNRN60QDHhH	2017-07-06 18:42:08.633	2017-07-06 18:42:08.634	94	93	15	\N	2017-07-06 18:42:08.632	2016-12-05 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
833	rnafGHU5l2W	2017-07-06 18:42:08.64	2017-07-06 18:42:08.64	94	93	15	\N	2017-07-06 18:42:08.638	2017-01-31 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
834	q6RaRezA3h7	2017-07-06 18:42:08.646	2017-07-06 18:42:08.647	94	93	15	\N	2017-07-06 18:42:08.645	2016-08-13 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
835	plYLIUcekJB	2017-07-06 18:42:08.652	2017-07-06 18:42:08.653	94	93	15	\N	2017-07-06 18:42:08.651	2016-06-22 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
836	YhkFc66s9AC	2017-07-06 18:42:08.659	2017-07-06 18:42:08.66	94	93	15	\N	2017-07-06 18:42:08.658	2016-10-31 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
837	fXUItr4QP2T	2017-07-06 18:42:08.666	2017-07-06 18:42:08.667	94	93	15	\N	2017-07-06 18:42:08.665	2016-03-25 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
838	Dbv9CSzN7hx	2017-07-06 18:42:08.684	2017-07-06 18:42:08.685	94	93	15	\N	2017-07-06 18:42:08.682	2016-05-10 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
839	lcLzbv7erzr	2017-07-06 18:42:08.691	2017-07-06 18:42:08.692	94	93	15	\N	2017-07-06 18:42:08.691	2016-07-13 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
840	tLQP3RaSnMZ	2017-07-06 18:42:08.702	2017-07-06 18:42:08.703	94	93	15	\N	2017-07-06 18:42:08.7	2017-04-28 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
841	adwUMDogJWU	2017-07-06 18:42:08.718	2017-07-06 18:42:08.718	94	93	15	\N	2017-07-06 18:42:08.717	2016-01-31 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
842	tUf0o1O9VxC	2017-07-06 18:42:08.722	2017-07-06 18:42:08.723	94	93	15	\N	2017-07-06 18:42:08.722	2017-03-01 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
843	IKojVgE2X3T	2017-07-06 18:42:08.728	2017-07-06 18:42:08.728	94	93	15	\N	2017-07-06 18:42:08.728	2017-05-26 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
844	lvgFYx2db8q	2017-07-06 18:42:08.732	2017-07-06 18:42:08.733	94	93	15	\N	2017-07-06 18:42:08.732	2016-04-29 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
845	f1gDXWRQG3P	2017-07-06 18:42:08.737	2017-07-06 18:42:08.738	94	93	15	\N	2017-07-06 18:42:08.737	2016-04-02 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
846	e4Ox3MwjkPn	2017-07-06 18:42:08.742	2017-07-06 18:42:08.742	94	93	15	\N	2017-07-06 18:42:08.741	2017-02-06 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
847	aezyThjDNtY	2017-07-06 18:42:08.747	2017-07-06 18:42:08.747	94	93	15	\N	2017-07-06 18:42:08.746	2017-01-16 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
848	l2l4mnpJHzt	2017-07-06 18:42:08.751	2017-07-06 18:42:08.752	94	93	15	\N	2017-07-06 18:42:08.751	2016-04-17 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
849	UBrpH3jygHq	2017-07-06 18:42:08.756	2017-07-06 18:42:08.756	94	93	15	\N	2017-07-06 18:42:08.755	2017-04-02 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
850	vTt3awn0bM3	2017-07-06 18:42:08.762	2017-07-06 18:42:08.762	94	93	15	\N	2017-07-06 18:42:08.761	2017-01-24 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
851	Kmj0gmbFhyR	2017-07-06 18:42:08.768	2017-07-06 18:42:08.768	94	93	15	\N	2017-07-06 18:42:08.767	2016-10-16 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
852	i3w2zAldMx4	2017-07-06 18:42:08.773	2017-07-06 18:42:08.774	94	93	15	\N	2017-07-06 18:42:08.772	2016-11-25 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
853	ZFgAyqska61	2017-07-06 18:42:08.778	2017-07-06 18:42:08.783	94	93	15	\N	2017-07-06 18:42:08.777	2016-09-02 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
854	CXdKKmAxhm7	2017-07-06 18:42:08.789	2017-07-06 18:42:08.789	94	93	15	\N	2017-07-06 18:42:08.788	2017-05-25 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
855	N9zWaNMs08v	2017-07-06 18:42:08.794	2017-07-06 18:42:08.794	94	93	15	\N	2017-07-06 18:42:08.793	2016-04-17 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
856	T7HztOyY2gJ	2017-07-06 18:42:08.799	2017-07-06 18:42:08.8	94	93	15	\N	2017-07-06 18:42:08.799	2016-09-14 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
857	YlP5LceXciW	2017-07-06 18:42:08.805	2017-07-06 18:42:08.806	94	93	15	\N	2017-07-06 18:42:08.804	2017-05-01 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
858	FtlOxPaY0TP	2017-07-06 18:42:08.811	2017-07-06 18:42:08.812	94	93	15	\N	2017-07-06 18:42:08.81	2016-10-16 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
859	xbPvFP9GFDv	2017-07-06 18:42:08.818	2017-07-06 18:42:08.819	94	93	15	\N	2017-07-06 18:42:08.817	2016-02-03 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
860	NHx4NE3cXF2	2017-07-06 18:42:08.825	2017-07-06 18:42:08.825	94	93	15	\N	2017-07-06 18:42:08.824	2016-05-23 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
861	hFEOMfot4lS	2017-07-06 18:42:08.831	2017-07-06 18:42:08.832	94	93	15	\N	2017-07-06 18:42:08.83	2017-01-11 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
862	NuEFBHu0GuC	2017-07-06 18:42:08.837	2017-07-06 18:42:08.837	94	93	15	\N	2017-07-06 18:42:08.836	2017-03-25 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
863	W1TFZFS1hw9	2017-07-06 18:42:08.843	2017-07-06 18:42:08.844	94	93	15	\N	2017-07-06 18:42:08.843	2016-07-31 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
864	zHVbY5vwcMc	2017-07-06 18:42:08.849	2017-07-06 18:42:08.849	94	93	15	\N	2017-07-06 18:42:08.848	2016-09-15 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
865	qs9dRuaq4lR	2017-07-06 18:42:08.854	2017-07-06 18:42:08.855	94	93	15	\N	2017-07-06 18:42:08.854	2017-02-01 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
866	GhVdXbaASny	2017-07-06 18:42:08.861	2017-07-06 18:42:08.861	94	93	15	\N	2017-07-06 18:42:08.86	2016-08-02 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
867	UafThxbJWdl	2017-07-06 18:42:08.866	2017-07-06 18:42:08.867	94	93	15	\N	2017-07-06 18:42:08.865	2016-02-13 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
868	wyV59IWQtyX	2017-07-06 18:42:08.871	2017-07-06 18:42:08.872	94	93	15	\N	2017-07-06 18:42:08.87	2016-08-18 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
869	etR3AUVIf9A	2017-07-06 18:42:08.877	2017-07-06 18:42:08.877	94	93	15	\N	2017-07-06 18:42:08.876	2016-09-20 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
870	tkkjPMsD8gY	2017-07-06 18:42:08.883	2017-07-06 18:42:08.883	94	93	15	\N	2017-07-06 18:42:08.882	2016-12-21 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
871	myV97AbAmpj	2017-07-06 18:42:08.888	2017-07-06 18:42:08.889	94	93	15	\N	2017-07-06 18:42:08.887	2016-05-28 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
872	mUYs1aHzLhj	2017-07-06 18:42:08.895	2017-07-06 18:42:08.896	94	93	15	\N	2017-07-06 18:42:08.894	2017-03-04 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
873	X5Hl6eDp7zr	2017-07-06 18:42:08.901	2017-07-06 18:42:08.902	94	93	15	\N	2017-07-06 18:42:08.9	2016-09-11 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
874	BZmKrYXm3aP	2017-07-06 18:42:08.907	2017-07-06 18:42:08.907	94	93	15	\N	2017-07-06 18:42:08.906	2017-06-02 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
875	M5oFVWv9Ssh	2017-07-06 18:42:08.913	2017-07-06 18:42:08.913	94	93	15	\N	2017-07-06 18:42:08.912	2016-07-16 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
876	gQoGya8yVTw	2017-07-06 18:42:08.92	2017-07-06 18:42:08.92	94	93	15	\N	2017-07-06 18:42:08.919	2016-01-12 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
877	jXQSF4oNdua	2017-07-06 18:42:08.925	2017-07-06 18:42:08.926	94	93	15	\N	2017-07-06 18:42:08.924	2017-04-10 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
878	iAGQDu6IfTE	2017-07-06 18:42:08.933	2017-07-06 18:42:08.934	94	93	15	\N	2017-07-06 18:42:08.932	2016-06-30 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
879	vONT8Sc1TDT	2017-07-06 18:42:08.94	2017-07-06 18:42:08.941	94	93	15	\N	2017-07-06 18:42:08.939	2017-03-26 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
880	L6PML4f2aXs	2017-07-06 18:42:08.947	2017-07-06 18:42:08.947	94	93	15	\N	2017-07-06 18:42:08.946	2016-03-26 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
881	COT4uwDSCRV	2017-07-06 18:42:08.954	2017-07-06 18:42:08.955	94	93	15	\N	2017-07-06 18:42:08.953	2016-11-16 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
882	IoPWjFWgrxw	2017-07-06 18:42:08.96	2017-07-06 18:42:08.961	94	93	15	\N	2017-07-06 18:42:08.959	2017-04-07 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
883	D4cg1ZJ1evf	2017-07-06 18:42:08.971	2017-07-06 18:42:08.972	94	93	15	\N	2017-07-06 18:42:08.97	2016-02-23 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
884	WDovzILe6pd	2017-07-06 18:42:08.979	2017-07-06 18:42:08.979	94	93	15	\N	2017-07-06 18:42:08.978	2017-03-16 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
885	lDkDIqqKGRc	2017-07-06 18:42:08.985	2017-07-06 18:42:08.986	94	93	15	\N	2017-07-06 18:42:08.984	2016-02-28 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
886	hYIvr9ncL4S	2017-07-06 18:42:08.992	2017-07-06 18:42:08.992	94	93	15	\N	2017-07-06 18:42:08.991	2016-02-11 00:00:00	51	COMPLETED	\N	\N	admin	2017-07-06 00:00:00
\.


--
-- Data for Name: programstageinstance_messageconversation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programstageinstance_messageconversation (programstageinstanceid, sort_order, messageconversationid) FROM stdin;
\.


--
-- Data for Name: programstageinstancecomments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programstageinstancecomments (programstageinstanceid, sort_order, trackedentitycommentid) FROM stdin;
\.


--
-- Data for Name: programstagesection; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programstagesection (programstagesectionid, uid, code, created, lastupdated, name, programstageid, sortorder) FROM stdin;
\.


--
-- Data for Name: programstagesection_programindicators; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programstagesection_programindicators (programstagesectionid, sort_order, programindicatorid) FROM stdin;
\.


--
-- Data for Name: programstagesectiontranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programstagesectiontranslations (programstagesectionid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programstagetranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programstagetranslations (programstageid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programtranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programtranslations (programid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: programusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programusergroupaccesses (programid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: pushanalysis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pushanalysis (pushanalysisid, uid, code, created, lastupdated, name, title, message, enabled, lastrun, schedulingdayoffrequency, schedulingfrequency, dashboard) FROM stdin;
\.


--
-- Data for Name: pushanalysisrecipientusergroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pushanalysisrecipientusergroups (usergroupid, elt) FROM stdin;
\.


--
-- Data for Name: relationship; Type: TABLE DATA; Schema: public; Owner: -
--

COPY relationship (relationshipid, trackedentityinstanceaid, relationshiptypeid, trackedentityinstancebid) FROM stdin;
\.


--
-- Data for Name: relationshiptype; Type: TABLE DATA; Schema: public; Owner: -
--

COPY relationshiptype (relationshiptypeid, uid, code, created, lastupdated, name, a_is_to_b, b_is_to_a) FROM stdin;
\.


--
-- Data for Name: relationshiptypetranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY relationshiptypetranslations (relationshiptypeid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: relativeperiods; Type: TABLE DATA; Schema: public; Owner: -
--

COPY relativeperiods (relativeperiodsid, thismonth, lastmonth, thisbimonth, lastbimonth, thisquarter, lastquarter, thissixmonth, lastsixmonth, monthsthisyear, quartersthisyear, thisyear, monthslastyear, quarterslastyear, lastyear, last5years, last12months, last6months, last3months, last6bimonths, last4quarters, last2sixmonths, thisfinancialyear, lastfinancialyear, last5financialyears, thisweek, lastweek, last4weeks, last12weeks, last52weeks) FROM stdin;
894	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f
909	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f
919	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f
\.


--
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (reportid, uid, code, created, lastupdated, name, type, designcontent, reporttableid, relativeperiodsid, paramreportingmonth, paramorganisationunit, cachestrategy, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: reporttable; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttable (reporttableid, uid, code, created, lastupdated, name, description, regression, cumulative, relativeperiodsid, paramreportingmonth, paramgrandparentorganisationunit, paramparentorganisationunit, paramorganisationunit, sortorder, toplimit, rowtotals, coltotals, rowsubtotals, colsubtotals, hideemptyrows, aggregationtype, completedonly, title, digitgroupseparator, displaydensity, fontsize, userorganisationunit, userorganisationunitchildren, userorganisationunitgrandchildren, legendsetid, legenddisplaystyle, showhierarchy, showdimensionlabels, skiprounding, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: reporttable_categorydimensions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttable_categorydimensions (reporttableid, sort_order, categorydimensionid) FROM stdin;
\.


--
-- Data for Name: reporttable_categoryoptiongroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttable_categoryoptiongroups (reporttableid, sort_order, categoryoptiongroupid) FROM stdin;
\.


--
-- Data for Name: reporttable_columns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttable_columns (reporttableid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: reporttable_datadimensionitems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttable_datadimensionitems (reporttableid, sort_order, datadimensionitemid) FROM stdin;
\.


--
-- Data for Name: reporttable_dataelementgroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttable_dataelementgroups (reporttableid, sort_order, dataelementgroupid) FROM stdin;
\.


--
-- Data for Name: reporttable_filters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttable_filters (reporttableid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: reporttable_itemorgunitgroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttable_itemorgunitgroups (reporttableid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: reporttable_organisationunits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttable_organisationunits (reporttableid, sort_order, organisationunitid) FROM stdin;
\.


--
-- Data for Name: reporttable_orgunitgroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttable_orgunitgroups (reporttableid, sort_order, orgunitgroupid) FROM stdin;
\.


--
-- Data for Name: reporttable_orgunitlevels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttable_orgunitlevels (reporttableid, sort_order, orgunitlevel) FROM stdin;
\.


--
-- Data for Name: reporttable_periods; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttable_periods (reporttableid, sort_order, periodid) FROM stdin;
\.


--
-- Data for Name: reporttable_rows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttable_rows (reporttableid, sort_order, dimension) FROM stdin;
\.


--
-- Data for Name: reporttabletranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttabletranslations (reporttableid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: reporttableusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttableusergroupaccesses (reporttableid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: reporttranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporttranslations (reportid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: reportusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reportusergroupaccesses (reportid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: section; Type: TABLE DATA; Schema: public; Owner: -
--

COPY section (sectionid, uid, code, created, lastupdated, name, description, datasetid, sortorder) FROM stdin;
\.


--
-- Data for Name: sectionattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sectionattributevalues (sectionid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: sectiondataelements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sectiondataelements (sectionid, sort_order, dataelementid) FROM stdin;
\.


--
-- Data for Name: sectiongreyedfields; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sectiongreyedfields (sectionid, dataelementoperandid) FROM stdin;
\.


--
-- Data for Name: sectionindicators; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sectionindicators (sectionid, sort_order, indicatorid) FROM stdin;
\.


--
-- Data for Name: smscodes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY smscodes (smscodeid, code, formula, compulsory, dataelementid, trackedentityattributeid, optionid) FROM stdin;
\.


--
-- Data for Name: smscommandcodes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY smscommandcodes (id, codeid) FROM stdin;
\.


--
-- Data for Name: smscommands; Type: TABLE DATA; Schema: public; Owner: -
--

COPY smscommands (smscommandid, name, parser, parsertype, separatorkey, codeseparator, defaultmessage, receivedmessage, wrongformatmessage, nousermessage, morethanoneorgunitmessage, successmessage, currentperiodusedforreporting, completenessmethod, datasetid, usergroupid, programid, programstageid) FROM stdin;
\.


--
-- Data for Name: smscommandspecialcharacters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY smscommandspecialcharacters (smscommandid, specialcharacterid) FROM stdin;
\.


--
-- Data for Name: smsspecialcharacter; Type: TABLE DATA; Schema: public; Owner: -
--

COPY smsspecialcharacter (specialcharacterid, name, value) FROM stdin;
\.


--
-- Data for Name: sqlview; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sqlview (sqlviewid, uid, code, created, lastupdated, name, description, sqlquery, type, cachestrategy, externalaccess, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: sqlviewattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sqlviewattributevalues (sqlviewid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: sqlviewusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sqlviewusergroupaccesses (sqlviewid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: systemsetting; Type: TABLE DATA; Schema: public; Owner: -
--

COPY systemsetting (systemsettingid, name, value) FROM stdin;
54	keyCacheStrategy	\\xaced00057400084e4f5f4341434845
55	keySystemNotificationsEmail	\\xaced000574001764617669642e68757365724073776973737470682e6368
56	keyInstanceBaseUrl	\\xaced000574001a68747470733a2f2f76612e73776973737470682d6d69732e6368
103	keyApplicationIntro	\\xaced000574000b44656d6f20736572766572
936	keyLastSuccessfulResourceTablesUpdate	\\xaced00057372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015e0c2c8d8178
104	keyApplicationNotification	\\xaced00057400934c6f6720696e2077697468203c62723e3c7374726f6e673e76612d64656d6f3c2f7374726f6e673e202f203c7374726f6e673e56657262616c4175746f70737939393c2f7374726f6e673e203c62723e20616e6420676f20746f203c693e417070733c2f693e203e203c693e4576656e74204361707475726520616e642073656c65637420446973747269637441313c2f693e
58	keyFlag	\\xaced00057400056468697332
110	keyUseCustomLogoFront	\\xaced0005737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c7565787001
236	keyLastSuccessfulAnalyticsTablesUpdate	\\xaced00057372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015e0c637c0178
106	lastSuccessfulDataStatistics	\\xaced00057372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015e0cd1591878
57	applicationTitle	\\xaced000574001656657262616c204175746f7073792028647261667429
935	keySchedTasks	\\xaced00057372001c6f72672e686973702e646869732e636f6d6d6f6e2e4c6973744d617043bb9a41e1871333020000787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000274000b3020302030202a202a203f737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000001770400000001740010616e616c7974696373416c6c5461736b7874000c302030203233202a202a203f7371007e0004000000017704000000017400117265736f757263655461626c655461736b7878
237	keyLastSuccessfulAnalyticsTablesRuntime	\\xaced0005740003342073
\.


--
-- Data for Name: trackedentity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentity (trackedentityid, uid, code, created, lastupdated, name, description) FROM stdin;
16	MCPQUTHX1Ze	Person	2017-07-04 00:00:00	2017-07-04 00:00:00	Person	Person
\.


--
-- Data for Name: trackedentityattribute; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentityattribute (trackedentityattributeid, uid, code, created, lastupdated, name, shortname, description, valuetype, aggregationtype, trackedentityattributegroupid, optionsetid, trackedentityid, legendsetid, inherit, expression, displayonvisitschedule, sortorderinvisitschedule, displayinlistnoprogram, sortorderinlistnoprogram, confidential, uniquefield, generated, pattern, orgunitscope, programscope, searchscope, userid, publicaccess, sort_order) FROM stdin;
\.


--
-- Data for Name: trackedentityattributeattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentityattributeattributevalues (trackedentityattributeid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: trackedentityattributedimension; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentityattributedimension (trackedentityattributedimensionid, trackedentityattributeid, legendsetid, filter) FROM stdin;
\.


--
-- Data for Name: trackedentityattributegroup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentityattributegroup (trackedentityattributegroupid, uid, code, created, lastupdated, name, description, sortorder) FROM stdin;
\.


--
-- Data for Name: trackedentityattributegrouptranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentityattributegrouptranslations (trackedentityattributegroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: trackedentityattributereservedvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentityattributereservedvalue (trackedentityattributereservedvalueid, trackedentityattributeid, trackedentityinstanceid, created, expirydate, value) FROM stdin;
\.


--
-- Data for Name: trackedentityattributetranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentityattributetranslations (trackedentityattributeid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: trackedentityattributeusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentityattributeusergroupaccesses (trackedentityattributeid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: trackedentityattributevalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentityattributevalue (trackedentityinstanceid, trackedentityattributeid, created, lastupdated, value, encryptedvalue) FROM stdin;
\.


--
-- Data for Name: trackedentityattributevalueaudit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentityattributevalueaudit (trackedentityattributevalueauditid, trackedentityinstanceid, trackedentityattributeid, value, encryptedvalue, created, modifiedby, audittype) FROM stdin;
\.


--
-- Data for Name: trackedentityattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentityattributevalues (trackedentityid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: trackedentitycomment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentitycomment (trackedentitycommentid, commenttext, createddate, creator) FROM stdin;
\.


--
-- Data for Name: trackedentitydataelementdimension; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentitydataelementdimension (trackedentitydataelementdimensionid, dataelementid, legendsetid, filter) FROM stdin;
887	86	\N	\N
888	87	\N	\N
889	88	\N	\N
890	89	\N	\N
891	90	\N	\N
892	91	\N	\N
917	90	\N	\N
\.


--
-- Data for Name: trackedentitydatavalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentitydatavalue (programstageinstanceid, dataelementid, value, created, lastupdated, providedelsewhere, storedby) FROM stdin;
109	86	452435sft345sdfdse	2017-07-05 15:10:49.2	2017-07-05 16:51:33.36	f	admin
109	87	male	2017-07-05 15:10:49.206	2017-07-05 16:51:33.369	f	admin
109	88	2006-07-04	2017-07-05 15:10:49.214	2017-07-05 16:51:33.382	f	admin
109	90	A17.1	2017-07-05 15:10:49.22	2017-07-05 16:51:33.4	f	admin
109	91	IjmqTYdr41h	2017-07-05 15:10:49.225	2017-07-05 16:51:33.419	f	admin
340	86	f761465d-27f5-406b-97dd-ffaa0476a07c	2017-07-06 18:25:19.176	2017-07-06 18:25:19.176	f	admin
340	87	male	2017-07-06 18:25:19.178	2017-07-06 18:25:19.178	f	admin
340	90	B05.-	2017-07-06 18:25:19.179	2017-07-06 18:25:19.179	f	admin
340	91	fUtMsHpUWEG	2017-07-06 18:25:19.181	2017-07-06 18:25:19.181	f	admin
340	88	1964-06-06	2017-07-06 18:25:19.184	2017-07-06 18:25:19.184	f	admin
341	86	85e5692f-503d-434a-b72b-e3edf44552b3	2017-07-06 18:25:19.198	2017-07-06 18:25:19.198	f	admin
341	87	female	2017-07-06 18:25:19.2	2017-07-06 18:25:19.2	f	admin
341	90	A17.0	2017-07-06 18:25:19.201	2017-07-06 18:25:19.201	f	admin
341	91	qGLnWdtwPuP	2017-07-06 18:25:19.203	2017-07-06 18:25:19.203	f	admin
341	89	58	2017-07-06 18:25:19.218	2017-07-06 18:25:19.218	f	admin
342	86	927ec9f9-25d0-42ac-b0c8-783653feafc5	2017-07-06 18:25:19.222	2017-07-06 18:25:19.222	f	admin
342	87	unknown	2017-07-06 18:25:19.223	2017-07-06 18:25:19.223	f	admin
342	90	B05.-	2017-07-06 18:25:19.223	2017-07-06 18:25:19.223	f	admin
342	91	GANhLTB3Muw	2017-07-06 18:25:19.223	2017-07-06 18:25:19.223	f	admin
342	88	2017-06-26	2017-07-06 18:25:19.239	2017-07-06 18:25:19.239	f	admin
342	89	-1	2017-07-06 18:25:19.239	2017-07-06 18:25:19.239	f	admin
343	86	dfeb9e42-f6b7-4fb2-a192-f41fa22493b2	2017-07-06 18:25:19.244	2017-07-06 18:25:19.244	f	admin
343	87	female	2017-07-06 18:25:19.245	2017-07-06 18:25:19.245	f	admin
343	90	A17.8	2017-07-06 18:25:19.245	2017-07-06 18:25:19.245	f	admin
343	91	NnkynIh7EM7	2017-07-06 18:25:19.245	2017-07-06 18:25:19.245	f	admin
343	89	65	2017-07-06 18:25:19.259	2017-07-06 18:25:19.259	f	admin
344	86	33d2fa65-d8db-4cfd-a2e8-3e58cc3a2aa9	2017-07-06 18:25:19.263	2017-07-06 18:25:19.263	f	admin
344	87	male	2017-07-06 18:25:19.263	2017-07-06 18:25:19.263	f	admin
344	90	A17.-	2017-07-06 18:25:19.263	2017-07-06 18:25:19.263	f	admin
344	89	28	2017-07-06 18:25:19.268	2017-07-06 18:25:19.268	f	admin
345	86	723ce2a5-222d-44d4-ba9b-5b5780cf7697	2017-07-06 18:25:19.272	2017-07-06 18:25:19.272	f	admin
345	87	male	2017-07-06 18:25:19.272	2017-07-06 18:25:19.272	f	admin
345	90	A17.1	2017-07-06 18:25:19.272	2017-07-06 18:25:19.272	f	admin
345	91	nkXlNTwznco	2017-07-06 18:25:19.272	2017-07-06 18:25:19.272	f	admin
345	89	59	2017-07-06 18:25:19.277	2017-07-06 18:25:19.277	f	admin
346	86	07b3ec26-cc79-4cce-b731-1bc132d3f394	2017-07-06 18:25:19.281	2017-07-06 18:25:19.281	f	admin
346	87	male	2017-07-06 18:25:19.281	2017-07-06 18:25:19.281	f	admin
346	90	A17.-	2017-07-06 18:25:19.281	2017-07-06 18:25:19.281	f	admin
346	91	ogYtH1np3og	2017-07-06 18:25:19.281	2017-07-06 18:25:19.281	f	admin
346	88	1972-03-05	2017-07-06 18:25:19.286	2017-07-06 18:25:19.286	f	admin
347	86	0e158255-ff79-435f-91f2-8ad45d6b2144	2017-07-06 18:25:19.289	2017-07-06 18:25:19.289	f	admin
347	87	male	2017-07-06 18:25:19.289	2017-07-06 18:25:19.289	f	admin
347	90	B20.-	2017-07-06 18:25:19.29	2017-07-06 18:25:19.29	f	admin
347	91	hQFDpKKwzSV	2017-07-06 18:25:19.29	2017-07-06 18:25:19.29	f	admin
347	88	1958-06-09	2017-07-06 18:25:19.294	2017-07-06 18:25:19.294	f	admin
347	89	58	2017-07-06 18:25:19.295	2017-07-06 18:25:19.295	f	admin
348	86	0838cf93-22c4-4a93-aa96-b7d1cd0489c1	2017-07-06 18:25:19.298	2017-07-06 18:25:19.298	f	admin
348	87	female	2017-07-06 18:25:19.298	2017-07-06 18:25:19.298	f	admin
348	90	B20.-	2017-07-06 18:25:19.298	2017-07-06 18:25:19.298	f	admin
348	91	KE72tBFAI5z	2017-07-06 18:25:19.298	2017-07-06 18:25:19.298	f	admin
348	88	1938-11-29	2017-07-06 18:25:19.303	2017-07-06 18:25:19.303	f	admin
349	86	779c2dee-e913-4361-bc24-cc0a8c2e040e	2017-07-06 18:25:19.306	2017-07-06 18:25:19.306	f	admin
349	87	male	2017-07-06 18:25:19.306	2017-07-06 18:25:19.306	f	admin
349	90	B05.-	2017-07-06 18:25:19.306	2017-07-06 18:25:19.306	f	admin
349	91	ZYAc2t33Ttb	2017-07-06 18:25:19.306	2017-07-06 18:25:19.306	f	admin
349	88	1942-08-05	2017-07-06 18:25:19.311	2017-07-06 18:25:19.311	f	admin
350	86	8f93df52-4fa0-4fa9-a872-e907c2e17218	2017-07-06 18:25:19.317	2017-07-06 18:25:19.317	f	admin
350	87	female	2017-07-06 18:25:19.317	2017-07-06 18:25:19.317	f	admin
350	90	A17.8	2017-07-06 18:25:19.317	2017-07-06 18:25:19.317	f	admin
350	91	BiK7nkMn8za	2017-07-06 18:25:19.317	2017-07-06 18:25:19.317	f	admin
350	88	1982-03-14	2017-07-06 18:25:19.321	2017-07-06 18:25:19.322	f	admin
351	86	969a2358-6fa0-4173-acc7-c69f39317361	2017-07-06 18:25:19.325	2017-07-06 18:25:19.325	f	admin
351	87	female	2017-07-06 18:25:19.325	2017-07-06 18:25:19.325	f	admin
351	90	A17.8	2017-07-06 18:25:19.325	2017-07-06 18:25:19.325	f	admin
351	91	TJvAMJcGaC4	2017-07-06 18:25:19.325	2017-07-06 18:25:19.325	f	admin
351	88	1974-04-21	2017-07-06 18:25:19.329	2017-07-06 18:25:19.329	f	admin
351	89	41	2017-07-06 18:25:19.329	2017-07-06 18:25:19.329	f	admin
352	86	528bfa9d-9852-4154-bddf-6d3d6b9c186d	2017-07-06 18:25:19.332	2017-07-06 18:25:19.332	f	admin
352	87	female	2017-07-06 18:25:19.332	2017-07-06 18:25:19.332	f	admin
352	90	B05.-	2017-07-06 18:25:19.332	2017-07-06 18:25:19.332	f	admin
352	91	tM19kcY9SCH	2017-07-06 18:25:19.332	2017-07-06 18:25:19.332	f	admin
352	89	20	2017-07-06 18:25:19.337	2017-07-06 18:25:19.337	f	admin
353	86	6b1acb53-0635-482f-b0b9-556a3d1c735c	2017-07-06 18:25:19.34	2017-07-06 18:25:19.34	f	admin
353	87	female	2017-07-06 18:25:19.34	2017-07-06 18:25:19.34	f	admin
353	90	E50.-	2017-07-06 18:25:19.34	2017-07-06 18:25:19.34	f	admin
353	91	HVzYWq1u9mj	2017-07-06 18:25:19.34	2017-07-06 18:25:19.34	f	admin
353	88	1967-12-06	2017-07-06 18:25:19.344	2017-07-06 18:25:19.344	f	admin
354	86	55343087-c2e8-4f93-bf44-6dfd3563b885	2017-07-06 18:25:19.347	2017-07-06 18:25:19.347	f	admin
354	87	female	2017-07-06 18:25:19.347	2017-07-06 18:25:19.347	f	admin
354	90	A17.8	2017-07-06 18:25:19.347	2017-07-06 18:25:19.347	f	admin
354	91	wcex9mzmVHg	2017-07-06 18:25:19.347	2017-07-06 18:25:19.347	f	admin
354	88	1987-03-26	2017-07-06 18:25:19.352	2017-07-06 18:25:19.352	f	admin
354	89	28	2017-07-06 18:25:19.352	2017-07-06 18:25:19.352	f	admin
355	86	1e3f2df4-e626-46bc-ba0b-892a71aba426	2017-07-06 18:25:19.355	2017-07-06 18:25:19.355	f	admin
355	87	unknown	2017-07-06 18:25:19.355	2017-07-06 18:25:19.355	f	admin
355	90	B20.-	2017-07-06 18:25:19.355	2017-07-06 18:25:19.355	f	admin
355	91	GpieTnPd0wF	2017-07-06 18:25:19.355	2017-07-06 18:25:19.355	f	admin
355	88	2009-12-15	2017-07-06 18:25:19.359	2017-07-06 18:25:19.359	f	admin
356	86	3862bb18-44d5-4f0d-8882-bd4fe4e7f5db	2017-07-06 18:25:19.362	2017-07-06 18:25:19.362	f	admin
356	87	male	2017-07-06 18:25:19.362	2017-07-06 18:25:19.362	f	admin
356	90	A17.1	2017-07-06 18:25:19.362	2017-07-06 18:25:19.362	f	admin
356	91	lopFllVC5oF	2017-07-06 18:25:19.362	2017-07-06 18:25:19.362	f	admin
356	88	1923-07-13	2017-07-06 18:25:19.366	2017-07-06 18:25:19.366	f	admin
356	89	93	2017-07-06 18:25:19.366	2017-07-06 18:25:19.366	f	admin
357	86	558c40f3-9acd-471d-999f-beb009d910f1	2017-07-06 18:25:19.369	2017-07-06 18:25:19.369	f	admin
357	87	female	2017-07-06 18:25:19.369	2017-07-06 18:25:19.369	f	admin
357	90	A17.0	2017-07-06 18:25:19.369	2017-07-06 18:25:19.369	f	admin
357	91	yMfbWMd53MR	2017-07-06 18:25:19.369	2017-07-06 18:25:19.369	f	admin
357	89	93	2017-07-06 18:25:19.373	2017-07-06 18:25:19.373	f	admin
358	86	ca5068a0-0a1b-448f-a169-329713f8d3fe	2017-07-06 18:25:19.376	2017-07-06 18:25:19.376	f	admin
358	87	male	2017-07-06 18:25:19.376	2017-07-06 18:25:19.376	f	admin
358	90	B05.-	2017-07-06 18:25:19.376	2017-07-06 18:25:19.376	f	admin
358	91	MjBVigqqQ0s	2017-07-06 18:25:19.376	2017-07-06 18:25:19.376	f	admin
358	89	84	2017-07-06 18:25:19.38	2017-07-06 18:25:19.38	f	admin
359	86	11212a6b-a421-41cf-899d-e93849b37945	2017-07-06 18:25:19.383	2017-07-06 18:25:19.383	f	admin
359	87	unknown	2017-07-06 18:25:19.383	2017-07-06 18:25:19.383	f	admin
359	90	A17.8	2017-07-06 18:25:19.383	2017-07-06 18:25:19.383	f	admin
359	91	uz8QaLW7nwH	2017-07-06 18:25:19.383	2017-07-06 18:25:19.383	f	admin
359	89	33	2017-07-06 18:25:19.386	2017-07-06 18:25:19.386	f	admin
360	86	72a768d8-fd63-4842-b7ac-f51ba73abd24	2017-07-06 18:25:19.389	2017-07-06 18:25:19.389	f	admin
360	87	male	2017-07-06 18:25:19.389	2017-07-06 18:25:19.389	f	admin
360	90	E50.-	2017-07-06 18:25:19.389	2017-07-06 18:25:19.389	f	admin
360	91	kiAUudindBs	2017-07-06 18:25:19.389	2017-07-06 18:25:19.389	f	admin
360	88	1916-01-15	2017-07-06 18:25:19.395	2017-07-06 18:25:19.395	f	admin
360	89	100	2017-07-06 18:25:19.395	2017-07-06 18:25:19.395	f	admin
361	86	0ca20a93-de03-4435-ba66-4b20628d0295	2017-07-06 18:25:19.397	2017-07-06 18:25:19.397	f	admin
361	87	missing	2017-07-06 18:25:19.397	2017-07-06 18:25:19.397	f	admin
361	90	A17.-	2017-07-06 18:25:19.397	2017-07-06 18:25:19.397	f	admin
361	91	ra6nBjyhF1e	2017-07-06 18:25:19.397	2017-07-06 18:25:19.397	f	admin
361	88	1967-05-06	2017-07-06 18:25:19.401	2017-07-06 18:25:19.401	f	admin
362	86	a3404f05-e275-4941-acbe-2d646ea36eb9	2017-07-06 18:25:19.404	2017-07-06 18:25:19.404	f	admin
362	87	female	2017-07-06 18:25:19.404	2017-07-06 18:25:19.404	f	admin
362	90	A17.1	2017-07-06 18:25:19.404	2017-07-06 18:25:19.404	f	admin
362	91	SI6JgImEXPT	2017-07-06 18:25:19.404	2017-07-06 18:25:19.404	f	admin
362	88	1938-04-22	2017-07-06 18:25:19.407	2017-07-06 18:25:19.407	f	admin
362	89	78	2017-07-06 18:25:19.407	2017-07-06 18:25:19.407	f	admin
363	86	41502830-73b0-400c-b3a3-87ba33e50c89	2017-07-06 18:25:19.41	2017-07-06 18:25:19.41	f	admin
363	87	intermediate	2017-07-06 18:25:19.41	2017-07-06 18:25:19.41	f	admin
363	90	E50.-	2017-07-06 18:25:19.41	2017-07-06 18:25:19.41	f	admin
363	91	cKeqWMUyl0L	2017-07-06 18:25:19.41	2017-07-06 18:25:19.41	f	admin
363	89	62	2017-07-06 18:25:19.414	2017-07-06 18:25:19.414	f	admin
364	86	1c678263-b211-4e28-957a-744e337e9e3c	2017-07-06 18:25:19.416	2017-07-06 18:25:19.416	f	admin
364	87	female	2017-07-06 18:25:19.416	2017-07-06 18:25:19.416	f	admin
364	90	A17.0	2017-07-06 18:25:19.416	2017-07-06 18:25:19.416	f	admin
364	91	deAGgMTWUwV	2017-07-06 18:25:19.416	2017-07-06 18:25:19.416	f	admin
364	89	94	2017-07-06 18:25:19.42	2017-07-06 18:25:19.42	f	admin
365	86	f6940342-80e1-4612-a57f-35a32c50ae33	2017-07-06 18:25:19.422	2017-07-06 18:25:19.422	f	admin
365	87	male	2017-07-06 18:25:19.422	2017-07-06 18:25:19.422	f	admin
365	90	A17.-	2017-07-06 18:25:19.422	2017-07-06 18:25:19.422	f	admin
365	91	mWSt5hiqOY3	2017-07-06 18:25:19.422	2017-07-06 18:25:19.422	f	admin
365	88	1965-06-04	2017-07-06 18:25:19.426	2017-07-06 18:25:19.426	f	admin
366	86	dfadf166-02a1-4c4f-a765-c27ff0fc3103	2017-07-06 18:25:19.432	2017-07-06 18:25:19.432	f	admin
366	87	male	2017-07-06 18:25:19.432	2017-07-06 18:25:19.432	f	admin
366	90	A17.0	2017-07-06 18:25:19.432	2017-07-06 18:25:19.432	f	admin
366	91	m5iBJs11m8i	2017-07-06 18:25:19.432	2017-07-06 18:25:19.432	f	admin
366	88	1980-01-28	2017-07-06 18:25:19.436	2017-07-06 18:25:19.436	f	admin
367	86	9de34473-1d95-4862-9040-6eb265279570	2017-07-06 18:25:19.439	2017-07-06 18:25:19.439	f	admin
367	87	male	2017-07-06 18:25:19.439	2017-07-06 18:25:19.439	f	admin
367	90	A17.-	2017-07-06 18:25:19.439	2017-07-06 18:25:19.439	f	admin
367	91	mWYYWe3JIMe	2017-07-06 18:25:19.439	2017-07-06 18:25:19.439	f	admin
367	88	1915-07-19	2017-07-06 18:25:19.443	2017-07-06 18:25:19.443	f	admin
367	89	100	2017-07-06 18:25:19.443	2017-07-06 18:25:19.443	f	admin
368	86	b2173d48-7170-42d3-b140-6f4316445cd8	2017-07-06 18:25:19.446	2017-07-06 18:25:19.446	f	admin
368	87	female	2017-07-06 18:25:19.446	2017-07-06 18:25:19.446	f	admin
368	90	A17.-	2017-07-06 18:25:19.446	2017-07-06 18:25:19.446	f	admin
368	91	JsjDFYDVSD8	2017-07-06 18:25:19.446	2017-07-06 18:25:19.446	f	admin
368	88	1966-08-11	2017-07-06 18:25:19.454	2017-07-06 18:25:19.454	f	admin
368	89	49	2017-07-06 18:25:19.454	2017-07-06 18:25:19.454	f	admin
369	86	0dc8d328-010c-4eb4-b028-47daca2f589d	2017-07-06 18:25:19.457	2017-07-06 18:25:19.457	f	admin
369	87	female	2017-07-06 18:25:19.457	2017-07-06 18:25:19.457	f	admin
369	90	E50.-	2017-07-06 18:25:19.457	2017-07-06 18:25:19.457	f	admin
369	91	iW6fm060hZ2	2017-07-06 18:25:19.457	2017-07-06 18:25:19.457	f	admin
369	88	1956-05-25	2017-07-06 18:25:19.462	2017-07-06 18:25:19.462	f	admin
369	89	59	2017-07-06 18:25:19.462	2017-07-06 18:25:19.462	f	admin
370	86	e053283e-d2a5-490a-9361-c6a4d3ac12be	2017-07-06 18:25:19.465	2017-07-06 18:25:19.465	f	admin
370	87	male	2017-07-06 18:25:19.465	2017-07-06 18:25:19.465	f	admin
370	90	B05.-	2017-07-06 18:25:19.465	2017-07-06 18:25:19.465	f	admin
370	91	PYCPjJAZ9pd	2017-07-06 18:25:19.465	2017-07-06 18:25:19.465	f	admin
370	88	1947-11-08	2017-07-06 18:25:19.469	2017-07-06 18:25:19.469	f	admin
370	89	69	2017-07-06 18:25:19.469	2017-07-06 18:25:19.469	f	admin
371	86	57dd2019-1536-4e9f-b844-f317531c8633	2017-07-06 18:25:19.473	2017-07-06 18:25:19.473	f	admin
371	87	female	2017-07-06 18:25:19.473	2017-07-06 18:25:19.473	f	admin
371	90	B05.-	2017-07-06 18:25:19.473	2017-07-06 18:25:19.473	f	admin
371	91	uYnHkXLrT18	2017-07-06 18:25:19.473	2017-07-06 18:25:19.473	f	admin
371	88	2012-01-07	2017-07-06 18:25:19.478	2017-07-06 18:25:19.478	f	admin
371	89	5	2017-07-06 18:25:19.478	2017-07-06 18:25:19.478	f	admin
372	86	26500181-5a42-49be-a19f-ebc9d07e57f0	2017-07-06 18:25:19.482	2017-07-06 18:25:19.482	f	admin
372	87	male	2017-07-06 18:25:19.482	2017-07-06 18:25:19.482	f	admin
372	90	A17.-	2017-07-06 18:25:19.482	2017-07-06 18:25:19.482	f	admin
372	91	SZju7iQ54QJ	2017-07-06 18:25:19.482	2017-07-06 18:25:19.482	f	admin
372	89	11	2017-07-06 18:25:19.487	2017-07-06 18:25:19.487	f	admin
373	86	89f4a554-3681-45d7-9e80-85437a650e9a	2017-07-06 18:25:19.489	2017-07-06 18:25:19.489	f	admin
373	87	unknown	2017-07-06 18:25:19.489	2017-07-06 18:25:19.489	f	admin
373	90	E50.-	2017-07-06 18:25:19.489	2017-07-06 18:25:19.489	f	admin
373	91	LSStgB0h07X	2017-07-06 18:25:19.489	2017-07-06 18:25:19.489	f	admin
373	89	75	2017-07-06 18:25:19.492	2017-07-06 18:25:19.493	f	admin
374	86	fc0f0745-65be-4e11-b2ae-f7b5526edc44	2017-07-06 18:25:19.495	2017-07-06 18:25:19.495	f	admin
374	87	female	2017-07-06 18:25:19.495	2017-07-06 18:25:19.495	f	admin
374	90	B20.-	2017-07-06 18:25:19.495	2017-07-06 18:25:19.495	f	admin
374	91	xVdoLDj0Yrn	2017-07-06 18:25:19.495	2017-07-06 18:25:19.495	f	admin
374	88	1944-02-10	2017-07-06 18:25:19.499	2017-07-06 18:25:19.499	f	admin
375	86	b3da0d0d-3fd5-4274-950d-6a7086a5c333	2017-07-06 18:25:19.501	2017-07-06 18:25:19.501	f	admin
375	87	male	2017-07-06 18:25:19.501	2017-07-06 18:25:19.501	f	admin
375	90	A17.0	2017-07-06 18:25:19.501	2017-07-06 18:25:19.501	f	admin
375	91	gfAI0qnuCwG	2017-07-06 18:25:19.501	2017-07-06 18:25:19.501	f	admin
375	88	1978-04-02	2017-07-06 18:25:19.506	2017-07-06 18:25:19.506	f	admin
375	89	38	2017-07-06 18:25:19.506	2017-07-06 18:25:19.506	f	admin
376	86	c2b18ed5-c235-4d5d-88fd-1f2c36b4f217	2017-07-06 18:25:19.508	2017-07-06 18:25:19.508	f	admin
376	87	male	2017-07-06 18:25:19.508	2017-07-06 18:25:19.508	f	admin
376	90	E50.-	2017-07-06 18:25:19.508	2017-07-06 18:25:19.508	f	admin
376	91	tb2hOUVIIrZ	2017-07-06 18:25:19.508	2017-07-06 18:25:19.508	f	admin
376	88	2007-03-28	2017-07-06 18:25:19.512	2017-07-06 18:25:19.512	f	admin
376	89	8	2017-07-06 18:25:19.512	2017-07-06 18:25:19.512	f	admin
377	86	e49e4a23-917a-49d8-8575-04b7eab28a46	2017-07-06 18:25:19.515	2017-07-06 18:25:19.515	f	admin
377	87	female	2017-07-06 18:25:19.515	2017-07-06 18:25:19.515	f	admin
377	90	A17.1	2017-07-06 18:25:19.515	2017-07-06 18:25:19.515	f	admin
377	91	GeZ1Ow91GGc	2017-07-06 18:25:19.515	2017-07-06 18:25:19.515	f	admin
377	89	67	2017-07-06 18:25:19.52	2017-07-06 18:25:19.52	f	admin
378	86	2bd22077-efe1-4ed0-81a1-d308ff3a6379	2017-07-06 18:25:19.523	2017-07-06 18:25:19.523	f	admin
378	87	missing	2017-07-06 18:25:19.523	2017-07-06 18:25:19.523	f	admin
378	90	B20.-	2017-07-06 18:25:19.523	2017-07-06 18:25:19.523	f	admin
378	91	KmkzeTcd7ta	2017-07-06 18:25:19.523	2017-07-06 18:25:19.523	f	admin
378	88	1990-11-07	2017-07-06 18:25:19.527	2017-07-06 18:25:19.527	f	admin
378	89	25	2017-07-06 18:25:19.527	2017-07-06 18:25:19.527	f	admin
379	86	cf7e7abe-30e3-4da1-b97b-37a9e34f7029	2017-07-06 18:25:19.53	2017-07-06 18:25:19.53	f	admin
379	87	female	2017-07-06 18:25:19.53	2017-07-06 18:25:19.53	f	admin
379	90	A17.8	2017-07-06 18:25:19.53	2017-07-06 18:25:19.53	f	admin
379	91	TcuCV2h3vRp	2017-07-06 18:25:19.53	2017-07-06 18:25:19.53	f	admin
379	89	91	2017-07-06 18:25:19.534	2017-07-06 18:25:19.534	f	admin
380	86	585dc3a1-2e9d-4785-92b9-47706da8b9b9	2017-07-06 18:25:19.538	2017-07-06 18:25:19.539	f	admin
380	87	male	2017-07-06 18:25:19.539	2017-07-06 18:25:19.539	f	admin
380	90	B05.-	2017-07-06 18:25:19.539	2017-07-06 18:25:19.539	f	admin
380	91	I9OCIX7Ix4O	2017-07-06 18:25:19.539	2017-07-06 18:25:19.539	f	admin
380	88	2008-06-20	2017-07-06 18:25:19.542	2017-07-06 18:25:19.542	f	admin
381	86	00d0a000-7aca-4d37-98c4-efacf904a0e7	2017-07-06 18:25:19.545	2017-07-06 18:25:19.545	f	admin
381	87	female	2017-07-06 18:25:19.545	2017-07-06 18:25:19.545	f	admin
381	90	B20.-	2017-07-06 18:25:19.545	2017-07-06 18:25:19.545	f	admin
381	91	F3stImQ9JOA	2017-07-06 18:25:19.545	2017-07-06 18:25:19.545	f	admin
381	88	1984-07-14	2017-07-06 18:25:19.55	2017-07-06 18:25:19.55	f	admin
382	86	3b86cb22-45a5-4f08-9e25-f24ae620e93b	2017-07-06 18:25:19.552	2017-07-06 18:25:19.552	f	admin
382	87	female	2017-07-06 18:25:19.552	2017-07-06 18:25:19.552	f	admin
382	90	A17.0	2017-07-06 18:25:19.552	2017-07-06 18:25:19.552	f	admin
382	91	iVWVDciJ0bm	2017-07-06 18:25:19.553	2017-07-06 18:25:19.553	f	admin
382	88	1946-05-16	2017-07-06 18:25:19.556	2017-07-06 18:25:19.556	f	admin
383	86	2220cb41-52ce-448c-a08a-ed96939c5ef8	2017-07-06 18:25:19.559	2017-07-06 18:25:19.559	f	admin
383	87	female	2017-07-06 18:25:19.559	2017-07-06 18:25:19.559	f	admin
383	90	B05.-	2017-07-06 18:25:19.559	2017-07-06 18:25:19.559	f	admin
383	91	Z5PabfeJOl6	2017-07-06 18:25:19.559	2017-07-06 18:25:19.559	f	admin
383	88	1932-01-18	2017-07-06 18:25:19.563	2017-07-06 18:25:19.563	f	admin
383	89	84	2017-07-06 18:25:19.564	2017-07-06 18:25:19.564	f	admin
384	86	58ca0132-e134-4782-bb33-6f344cb9fcfc	2017-07-06 18:25:19.567	2017-07-06 18:25:19.567	f	admin
384	87	female	2017-07-06 18:25:19.567	2017-07-06 18:25:19.567	f	admin
384	90	A17.8	2017-07-06 18:25:19.567	2017-07-06 18:25:19.567	f	admin
384	91	n5meu8crJEG	2017-07-06 18:25:19.567	2017-07-06 18:25:19.567	f	admin
384	89	94	2017-07-06 18:25:19.572	2017-07-06 18:25:19.572	f	admin
385	86	7d9e71f6-0261-4dbb-ad4f-a76830e534a8	2017-07-06 18:25:19.577	2017-07-06 18:25:19.577	f	admin
385	87	male	2017-07-06 18:25:19.577	2017-07-06 18:25:19.577	f	admin
385	90	E50.-	2017-07-06 18:25:19.578	2017-07-06 18:25:19.578	f	admin
385	91	p4emEAG8FIV	2017-07-06 18:25:19.579	2017-07-06 18:25:19.579	f	admin
385	88	1929-09-27	2017-07-06 18:25:19.585	2017-07-06 18:25:19.585	f	admin
386	86	66a0d6df-42fd-4bbc-b95c-35e192c0d632	2017-07-06 18:25:19.589	2017-07-06 18:25:19.589	f	admin
386	87	female	2017-07-06 18:25:19.589	2017-07-06 18:25:19.589	f	admin
386	90	E50.-	2017-07-06 18:25:19.589	2017-07-06 18:25:19.589	f	admin
386	91	qBGAUiUccjZ	2017-07-06 18:25:19.59	2017-07-06 18:25:19.59	f	admin
386	88	1977-02-28	2017-07-06 18:25:19.594	2017-07-06 18:25:19.594	f	admin
386	89	39	2017-07-06 18:25:19.596	2017-07-06 18:25:19.596	f	admin
387	86	9af3361b-cff5-4ad9-a9b2-8e1769ef3886	2017-07-06 18:25:19.599	2017-07-06 18:25:19.599	f	admin
387	87	female	2017-07-06 18:25:19.599	2017-07-06 18:25:19.599	f	admin
387	90	E50.-	2017-07-06 18:25:19.599	2017-07-06 18:25:19.599	f	admin
387	91	kpZlRFXj3o0	2017-07-06 18:25:19.599	2017-07-06 18:25:19.599	f	admin
387	88	1978-10-30	2017-07-06 18:25:19.604	2017-07-06 18:25:19.604	f	admin
387	89	38	2017-07-06 18:25:19.604	2017-07-06 18:25:19.604	f	admin
388	86	34a941b3-9281-4b45-8117-7186a0bcbcd1	2017-07-06 18:25:19.607	2017-07-06 18:25:19.607	f	admin
388	87	female	2017-07-06 18:25:19.607	2017-07-06 18:25:19.607	f	admin
388	90	A17.8	2017-07-06 18:25:19.607	2017-07-06 18:25:19.607	f	admin
388	91	CpPHRgzP2iN	2017-07-06 18:25:19.607	2017-07-06 18:25:19.607	f	admin
388	88	2007-07-10	2017-07-06 18:25:19.613	2017-07-06 18:25:19.613	f	admin
388	89	8	2017-07-06 18:25:19.613	2017-07-06 18:25:19.613	f	admin
389	86	d69f9564-dc2a-4097-82d1-c1880cb58870	2017-07-06 18:25:19.617	2017-07-06 18:25:19.617	f	admin
389	87	missing	2017-07-06 18:25:19.617	2017-07-06 18:25:19.617	f	admin
389	90	A17.8	2017-07-06 18:25:19.617	2017-07-06 18:25:19.617	f	admin
389	91	fLWKM9AjqeU	2017-07-06 18:25:19.617	2017-07-06 18:25:19.617	f	admin
389	89	34	2017-07-06 18:25:19.626	2017-07-06 18:25:19.626	f	admin
390	86	d8f79a84-4662-4cda-afbf-31fba9cac100	2017-07-06 18:25:19.629	2017-07-06 18:25:19.629	f	admin
390	87	unknown	2017-07-06 18:25:19.63	2017-07-06 18:25:19.63	f	admin
390	90	A17.1	2017-07-06 18:25:19.63	2017-07-06 18:25:19.63	f	admin
390	91	hvYIlOflFJh	2017-07-06 18:25:19.63	2017-07-06 18:25:19.63	f	admin
390	89	40	2017-07-06 18:25:19.634	2017-07-06 18:25:19.634	f	admin
391	86	7f895c4d-477e-46c2-a695-21fdbc61c20d	2017-07-06 18:25:19.641	2017-07-06 18:25:19.641	f	admin
391	87	female	2017-07-06 18:25:19.642	2017-07-06 18:25:19.642	f	admin
391	90	A17.8	2017-07-06 18:25:19.643	2017-07-06 18:25:19.643	f	admin
391	91	efqUwxBRB7D	2017-07-06 18:25:19.643	2017-07-06 18:25:19.643	f	admin
391	88	1948-08-31	2017-07-06 18:25:19.646	2017-07-06 18:25:19.646	f	admin
392	86	deb24eda-5263-47dc-8fb9-065552fed58a	2017-07-06 18:25:19.648	2017-07-06 18:25:19.648	f	admin
392	87	male	2017-07-06 18:25:19.648	2017-07-06 18:25:19.648	f	admin
392	90	B20.-	2017-07-06 18:25:19.648	2017-07-06 18:25:19.648	f	admin
392	91	DSSyvnHqsvs	2017-07-06 18:25:19.648	2017-07-06 18:25:19.648	f	admin
392	88	1942-07-01	2017-07-06 18:25:19.653	2017-07-06 18:25:19.653	f	admin
392	89	74	2017-07-06 18:25:19.654	2017-07-06 18:25:19.654	f	admin
393	86	1286b5b2-4f3f-420a-9b7b-8ab76dd244d3	2017-07-06 18:25:19.656	2017-07-06 18:25:19.656	f	admin
393	87	female	2017-07-06 18:25:19.656	2017-07-06 18:25:19.656	f	admin
393	90	A17.-	2017-07-06 18:25:19.656	2017-07-06 18:25:19.656	f	admin
393	91	vbfgSsgjMO6	2017-07-06 18:25:19.656	2017-07-06 18:25:19.656	f	admin
393	88	2000-02-15	2017-07-06 18:25:19.66	2017-07-06 18:25:19.66	f	admin
394	86	c3a18ed5-e76b-40b1-9ee6-2377d2369fb9	2017-07-06 18:25:19.661	2017-07-06 18:25:19.661	f	admin
394	87	male	2017-07-06 18:25:19.661	2017-07-06 18:25:19.661	f	admin
394	90	B20.-	2017-07-06 18:25:19.661	2017-07-06 18:25:19.661	f	admin
394	91	O0NY575SHUD	2017-07-06 18:25:19.661	2017-07-06 18:25:19.661	f	admin
394	88	1969-04-11	2017-07-06 18:25:19.665	2017-07-06 18:25:19.665	f	admin
394	89	47	2017-07-06 18:25:19.667	2017-07-06 18:25:19.667	f	admin
395	86	482bdaf8-bd6f-4b07-8458-d4d831c1266b	2017-07-06 18:25:19.669	2017-07-06 18:25:19.669	f	admin
395	87	missing	2017-07-06 18:25:19.669	2017-07-06 18:25:19.669	f	admin
395	90	A17.0	2017-07-06 18:25:19.669	2017-07-06 18:25:19.669	f	admin
395	91	rbP6Uii9aVP	2017-07-06 18:25:19.669	2017-07-06 18:25:19.669	f	admin
395	89	76	2017-07-06 18:25:19.673	2017-07-06 18:25:19.673	f	admin
396	86	91f5aefe-8216-4c39-a5a0-52f41a04483b	2017-07-06 18:25:19.675	2017-07-06 18:25:19.675	f	admin
396	87	male	2017-07-06 18:25:19.675	2017-07-06 18:25:19.675	f	admin
396	90	E50.-	2017-07-06 18:25:19.675	2017-07-06 18:25:19.675	f	admin
396	91	yZZplCiByl5	2017-07-06 18:25:19.675	2017-07-06 18:25:19.675	f	admin
396	88	1941-01-11	2017-07-06 18:25:19.678	2017-07-06 18:25:19.678	f	admin
396	89	75	2017-07-06 18:25:19.678	2017-07-06 18:25:19.678	f	admin
397	86	07ed37d2-7d2e-4274-b39a-92362c92e9c6	2017-07-06 18:25:19.68	2017-07-06 18:25:19.68	f	admin
397	87	unknown	2017-07-06 18:25:19.68	2017-07-06 18:25:19.68	f	admin
397	90	A17.8	2017-07-06 18:25:19.68	2017-07-06 18:25:19.68	f	admin
397	91	OEMePDOtGbg	2017-07-06 18:25:19.68	2017-07-06 18:25:19.68	f	admin
397	88	1998-02-08	2017-07-06 18:25:19.684	2017-07-06 18:25:19.684	f	admin
398	86	2cc427ed-b436-47ef-8b4b-7b58981aaaf0	2017-07-06 18:25:19.685	2017-07-06 18:25:19.685	f	admin
398	87	male	2017-07-06 18:25:19.685	2017-07-06 18:25:19.685	f	admin
398	90	A17.8	2017-07-06 18:25:19.685	2017-07-06 18:25:19.685	f	admin
398	91	xRBFFiYLUW4	2017-07-06 18:25:19.685	2017-07-06 18:25:19.685	f	admin
398	88	1986-11-04	2017-07-06 18:25:19.688	2017-07-06 18:25:19.688	f	admin
399	86	44063a6e-0a98-43ff-9ef5-f8a054acaf0b	2017-07-06 18:25:19.69	2017-07-06 18:25:19.69	f	admin
399	87	female	2017-07-06 18:25:19.69	2017-07-06 18:25:19.69	f	admin
399	90	A17.1	2017-07-06 18:25:19.69	2017-07-06 18:25:19.69	f	admin
399	91	wTHrSjIFJ2m	2017-07-06 18:25:19.69	2017-07-06 18:25:19.69	f	admin
399	89	42	2017-07-06 18:25:19.693	2017-07-06 18:25:19.693	f	admin
400	86	6d009131-d7f5-459e-a826-13457764400d	2017-07-06 18:25:19.694	2017-07-06 18:25:19.694	f	admin
400	87	female	2017-07-06 18:25:19.694	2017-07-06 18:25:19.694	f	admin
400	90	B05.-	2017-07-06 18:25:19.694	2017-07-06 18:25:19.694	f	admin
400	91	lhlH6HVwW1b	2017-07-06 18:25:19.694	2017-07-06 18:25:19.694	f	admin
400	88	1989-11-27	2017-07-06 18:25:19.699	2017-07-06 18:25:19.699	f	admin
400	89	26	2017-07-06 18:25:19.699	2017-07-06 18:25:19.699	f	admin
401	86	73f12add-6b5b-4da3-b100-4687037ae53b	2017-07-06 18:25:19.701	2017-07-06 18:25:19.701	f	admin
401	87	female	2017-07-06 18:25:19.701	2017-07-06 18:25:19.701	f	admin
401	90	A17.8	2017-07-06 18:25:19.701	2017-07-06 18:25:19.701	f	admin
401	91	cnZIlO1FrFR	2017-07-06 18:25:19.701	2017-07-06 18:25:19.701	f	admin
401	89	19	2017-07-06 18:25:19.705	2017-07-06 18:25:19.705	f	admin
402	86	a0955eef-b530-4548-9b1d-74e2065b5180	2017-07-06 18:25:19.708	2017-07-06 18:25:19.708	f	admin
402	87	female	2017-07-06 18:25:19.708	2017-07-06 18:25:19.708	f	admin
402	90	A17.8	2017-07-06 18:25:19.708	2017-07-06 18:25:19.708	f	admin
402	91	fVXI7sVVVHc	2017-07-06 18:25:19.708	2017-07-06 18:25:19.708	f	admin
402	89	28	2017-07-06 18:25:19.712	2017-07-06 18:25:19.712	f	admin
403	86	be2847ab-431b-4908-bdde-657d222540ee	2017-07-06 18:25:19.714	2017-07-06 18:25:19.714	f	admin
403	87	male	2017-07-06 18:25:19.714	2017-07-06 18:25:19.714	f	admin
403	90	B05.-	2017-07-06 18:25:19.714	2017-07-06 18:25:19.714	f	admin
403	91	EWmWhYwq0nK	2017-07-06 18:25:19.714	2017-07-06 18:25:19.714	f	admin
403	88	1934-05-08	2017-07-06 18:25:19.72	2017-07-06 18:25:19.72	f	admin
404	86	198a23e2-607a-4730-9c5b-d22bdb32c757	2017-07-06 18:25:19.723	2017-07-06 18:25:19.723	f	admin
404	87	female	2017-07-06 18:25:19.723	2017-07-06 18:25:19.723	f	admin
404	90	A17.0	2017-07-06 18:25:19.723	2017-07-06 18:25:19.723	f	admin
404	91	u2dt9ElcFGb	2017-07-06 18:25:19.723	2017-07-06 18:25:19.723	f	admin
404	89	4	2017-07-06 18:25:19.729	2017-07-06 18:25:19.729	f	admin
405	86	03cc5e0c-0b90-482d-aa68-9ba3e25d7a0d	2017-07-06 18:25:19.731	2017-07-06 18:25:19.731	f	admin
405	87	male	2017-07-06 18:25:19.731	2017-07-06 18:25:19.731	f	admin
405	90	A17.-	2017-07-06 18:25:19.731	2017-07-06 18:25:19.731	f	admin
405	91	TrQDbWvQYqw	2017-07-06 18:25:19.732	2017-07-06 18:25:19.732	f	admin
405	89	26	2017-07-06 18:25:19.743	2017-07-06 18:25:19.743	f	admin
406	86	ada0e325-eac7-4095-94d9-1df857eb722b	2017-07-06 18:25:19.745	2017-07-06 18:25:19.745	f	admin
406	87	female	2017-07-06 18:25:19.745	2017-07-06 18:25:19.745	f	admin
406	90	A17.-	2017-07-06 18:25:19.745	2017-07-06 18:25:19.745	f	admin
406	91	Qwv0QlBeB9K	2017-07-06 18:25:19.745	2017-07-06 18:25:19.745	f	admin
406	88	1971-10-02	2017-07-06 18:25:19.748	2017-07-06 18:25:19.748	f	admin
406	89	45	2017-07-06 18:25:19.749	2017-07-06 18:25:19.749	f	admin
407	86	bda9266d-de6f-4a88-b280-17273aca494c	2017-07-06 18:25:19.751	2017-07-06 18:25:19.751	f	admin
407	87	female	2017-07-06 18:25:19.751	2017-07-06 18:25:19.751	f	admin
407	90	A17.-	2017-07-06 18:25:19.751	2017-07-06 18:25:19.751	f	admin
407	91	UH25VWDzWEH	2017-07-06 18:25:19.751	2017-07-06 18:25:19.751	f	admin
407	88	1960-04-06	2017-07-06 18:25:19.754	2017-07-06 18:25:19.754	f	admin
407	89	56	2017-07-06 18:25:19.754	2017-07-06 18:25:19.754	f	admin
408	86	69e35f4a-390d-4741-afaf-4d67c476ff9f	2017-07-06 18:25:19.756	2017-07-06 18:25:19.756	f	admin
408	87	female	2017-07-06 18:25:19.756	2017-07-06 18:25:19.756	f	admin
408	90	E50.-	2017-07-06 18:25:19.756	2017-07-06 18:25:19.756	f	admin
408	91	cZsozOkwcnh	2017-07-06 18:25:19.756	2017-07-06 18:25:19.756	f	admin
408	88	1966-07-21	2017-07-06 18:25:19.761	2017-07-06 18:25:19.761	f	admin
408	89	49	2017-07-06 18:25:19.761	2017-07-06 18:25:19.761	f	admin
409	86	8f29750c-81b0-4739-b060-22961bb2fd56	2017-07-06 18:25:19.763	2017-07-06 18:25:19.763	f	admin
409	87	female	2017-07-06 18:25:19.763	2017-07-06 18:25:19.763	f	admin
409	90	B05.-	2017-07-06 18:25:19.763	2017-07-06 18:25:19.763	f	admin
409	91	tkT18JsW01i	2017-07-06 18:25:19.763	2017-07-06 18:25:19.763	f	admin
409	89	0	2017-07-06 18:25:19.767	2017-07-06 18:25:19.767	f	admin
410	86	30495abc-ae12-4001-9076-4031b7636a84	2017-07-06 18:25:19.77	2017-07-06 18:25:19.77	f	admin
410	87	missing	2017-07-06 18:25:19.77	2017-07-06 18:25:19.77	f	admin
410	90	A17.0	2017-07-06 18:25:19.77	2017-07-06 18:25:19.77	f	admin
410	91	I5YVWeBkow9	2017-07-06 18:25:19.77	2017-07-06 18:25:19.77	f	admin
410	89	63	2017-07-06 18:25:19.773	2017-07-06 18:25:19.773	f	admin
411	86	570fc8c9-b7ce-4a76-a97f-e169f3dc8dd5	2017-07-06 18:25:19.775	2017-07-06 18:25:19.775	f	admin
411	87	unknown	2017-07-06 18:25:19.775	2017-07-06 18:25:19.775	f	admin
411	90	B05.-	2017-07-06 18:25:19.775	2017-07-06 18:25:19.775	f	admin
411	91	DxzZ1CfabUD	2017-07-06 18:25:19.775	2017-07-06 18:25:19.775	f	admin
411	88	1971-04-29	2017-07-06 18:25:19.778	2017-07-06 18:25:19.778	f	admin
412	86	a4ee1b81-5900-43b4-8c05-affd17cc1c9d	2017-07-06 18:25:19.78	2017-07-06 18:25:19.78	f	admin
412	87	unknown	2017-07-06 18:25:19.78	2017-07-06 18:25:19.78	f	admin
412	90	E50.-	2017-07-06 18:25:19.78	2017-07-06 18:25:19.78	f	admin
412	91	lfEZfQZq8tE	2017-07-06 18:25:19.78	2017-07-06 18:25:19.78	f	admin
412	88	1924-02-20	2017-07-06 18:25:19.785	2017-07-06 18:25:19.785	f	admin
413	86	d444f765-5761-4325-b1bd-5197324d3736	2017-07-06 18:25:19.787	2017-07-06 18:25:19.787	f	admin
413	87	male	2017-07-06 18:25:19.787	2017-07-06 18:25:19.787	f	admin
413	90	A17.0	2017-07-06 18:25:19.787	2017-07-06 18:25:19.787	f	admin
413	91	aVlOfKd3SHe	2017-07-06 18:25:19.787	2017-07-06 18:25:19.787	f	admin
413	88	1971-07-19	2017-07-06 18:25:19.791	2017-07-06 18:25:19.791	f	admin
414	86	fa38c09a-7250-4d79-8b24-e7c4164c34a5	2017-07-06 18:25:19.794	2017-07-06 18:25:19.794	f	admin
414	87	female	2017-07-06 18:25:19.794	2017-07-06 18:25:19.794	f	admin
414	90	B05.-	2017-07-06 18:25:19.794	2017-07-06 18:25:19.794	f	admin
414	91	U4JP7TrSeHX	2017-07-06 18:25:19.794	2017-07-06 18:25:19.794	f	admin
414	88	1942-02-13	2017-07-06 18:25:19.797	2017-07-06 18:25:19.797	f	admin
415	86	8c6eda7c-aae4-43ff-bca6-cd2bbfde1bec	2017-07-06 18:25:19.799	2017-07-06 18:25:19.799	f	admin
415	87	male	2017-07-06 18:25:19.799	2017-07-06 18:25:19.799	f	admin
415	90	B20.-	2017-07-06 18:25:19.799	2017-07-06 18:25:19.799	f	admin
415	91	P6wXjYsfboe	2017-07-06 18:25:19.799	2017-07-06 18:25:19.799	f	admin
415	89	47	2017-07-06 18:25:19.803	2017-07-06 18:25:19.803	f	admin
416	86	ec63e726-cf01-4b24-a7dd-3b09d2709bb0	2017-07-06 18:25:19.805	2017-07-06 18:25:19.805	f	admin
416	87	male	2017-07-06 18:25:19.805	2017-07-06 18:25:19.805	f	admin
416	90	A17.0	2017-07-06 18:25:19.805	2017-07-06 18:25:19.805	f	admin
416	91	DTBYzdlIzcy	2017-07-06 18:25:19.805	2017-07-06 18:25:19.805	f	admin
416	88	1960-03-30	2017-07-06 18:25:19.809	2017-07-06 18:25:19.809	f	admin
416	89	56	2017-07-06 18:25:19.809	2017-07-06 18:25:19.809	f	admin
417	86	4cfb9abf-6a98-4d40-bc73-71b738456d3b	2017-07-06 18:25:19.811	2017-07-06 18:25:19.811	f	admin
417	87	female	2017-07-06 18:25:19.811	2017-07-06 18:25:19.811	f	admin
417	90	A17.0	2017-07-06 18:25:19.811	2017-07-06 18:25:19.811	f	admin
417	91	dea3nPFrkl3	2017-07-06 18:25:19.811	2017-07-06 18:25:19.811	f	admin
417	88	1978-09-12	2017-07-06 18:25:19.816	2017-07-06 18:25:19.816	f	admin
418	86	0f778871-c529-49d4-adf5-49ff746a7ee5	2017-07-06 18:25:19.818	2017-07-06 18:25:19.818	f	admin
418	87	female	2017-07-06 18:25:19.818	2017-07-06 18:25:19.818	f	admin
418	90	A17.-	2017-07-06 18:25:19.818	2017-07-06 18:25:19.818	f	admin
418	91	zFUOpCLAnOk	2017-07-06 18:25:19.818	2017-07-06 18:25:19.818	f	admin
418	89	18	2017-07-06 18:25:19.822	2017-07-06 18:25:19.822	f	admin
419	86	f2069483-dbe1-43d3-9d5a-109b9c7111b7	2017-07-06 18:25:19.824	2017-07-06 18:25:19.824	f	admin
419	87	missing	2017-07-06 18:25:19.824	2017-07-06 18:25:19.824	f	admin
419	90	B20.-	2017-07-06 18:25:19.824	2017-07-06 18:25:19.824	f	admin
419	91	QAn8z8bsgAL	2017-07-06 18:25:19.824	2017-07-06 18:25:19.824	f	admin
419	88	2007-06-28	2017-07-06 18:25:19.827	2017-07-06 18:25:19.827	f	admin
419	89	9	2017-07-06 18:25:19.827	2017-07-06 18:25:19.827	f	admin
420	86	bfe22c2b-b76a-4445-aae6-d5d1c11f92b7	2017-07-06 18:25:19.83	2017-07-06 18:25:19.83	f	admin
420	87	male	2017-07-06 18:25:19.83	2017-07-06 18:25:19.83	f	admin
420	90	B20.-	2017-07-06 18:25:19.83	2017-07-06 18:25:19.83	f	admin
420	91	oDZNTK2ZgIa	2017-07-06 18:25:19.83	2017-07-06 18:25:19.83	f	admin
420	88	1993-05-30	2017-07-06 18:25:19.836	2017-07-06 18:25:19.836	f	admin
420	89	22	2017-07-06 18:25:19.836	2017-07-06 18:25:19.836	f	admin
421	86	07f91b66-9ca9-451b-b13f-ce3cae9c0ec1	2017-07-06 18:25:19.838	2017-07-06 18:25:19.838	f	admin
421	87	female	2017-07-06 18:25:19.838	2017-07-06 18:25:19.838	f	admin
421	90	E50.-	2017-07-06 18:25:19.839	2017-07-06 18:25:19.839	f	admin
421	91	E5IMun50mzx	2017-07-06 18:25:19.839	2017-07-06 18:25:19.839	f	admin
421	88	1996-04-01	2017-07-06 18:25:19.842	2017-07-06 18:25:19.842	f	admin
421	89	20	2017-07-06 18:25:19.842	2017-07-06 18:25:19.842	f	admin
422	86	c38f8d50-9ff3-426c-9b45-43243a912e43	2017-07-06 18:25:19.844	2017-07-06 18:25:19.844	f	admin
422	87	female	2017-07-06 18:25:19.844	2017-07-06 18:25:19.844	f	admin
422	90	A17.0	2017-07-06 18:25:19.844	2017-07-06 18:25:19.844	f	admin
422	91	Ko8NAICjiRf	2017-07-06 18:25:19.844	2017-07-06 18:25:19.844	f	admin
422	88	1951-03-11	2017-07-06 18:25:19.848	2017-07-06 18:25:19.848	f	admin
423	86	124d0072-6563-49cd-9f4c-0cfe234eaf4d	2017-07-06 18:25:19.851	2017-07-06 18:25:19.851	f	admin
423	87	female	2017-07-06 18:25:19.851	2017-07-06 18:25:19.851	f	admin
423	90	B20.-	2017-07-06 18:25:19.851	2017-07-06 18:25:19.851	f	admin
423	91	D51c6ihJo3a	2017-07-06 18:25:19.851	2017-07-06 18:25:19.851	f	admin
423	88	1933-12-14	2017-07-06 18:25:19.855	2017-07-06 18:25:19.855	f	admin
424	86	6f7df664-ef11-4d2c-aa02-fd8afe11c9d8	2017-07-06 18:25:19.858	2017-07-06 18:25:19.858	f	admin
424	87	female	2017-07-06 18:25:19.858	2017-07-06 18:25:19.858	f	admin
424	90	B05.-	2017-07-06 18:25:19.858	2017-07-06 18:25:19.858	f	admin
424	91	mftJC8dOfkK	2017-07-06 18:25:19.858	2017-07-06 18:25:19.858	f	admin
424	88	1936-12-13	2017-07-06 18:25:19.861	2017-07-06 18:25:19.861	f	admin
425	86	af94c7a1-387a-477f-9a62-e32cea87fe69	2017-07-06 18:25:19.863	2017-07-06 18:25:19.863	f	admin
425	87	male	2017-07-06 18:25:19.863	2017-07-06 18:25:19.863	f	admin
425	90	B05.-	2017-07-06 18:25:19.863	2017-07-06 18:25:19.863	f	admin
425	91	qKTLat5JIdu	2017-07-06 18:25:19.863	2017-07-06 18:25:19.863	f	admin
425	88	1965-12-22	2017-07-06 18:25:19.867	2017-07-06 18:25:19.867	f	admin
425	89	51	2017-07-06 18:25:19.867	2017-07-06 18:25:19.867	f	admin
426	86	398dad93-7b76-4d88-8240-3ee1401a1bae	2017-07-06 18:25:19.87	2017-07-06 18:25:19.87	f	admin
426	87	male	2017-07-06 18:25:19.87	2017-07-06 18:25:19.87	f	admin
426	90	B05.-	2017-07-06 18:25:19.87	2017-07-06 18:25:19.87	f	admin
426	91	JAZ4hnnLOQd	2017-07-06 18:25:19.87	2017-07-06 18:25:19.87	f	admin
426	88	1980-06-05	2017-07-06 18:25:19.873	2017-07-06 18:25:19.873	f	admin
427	86	0d9a9698-b657-4bef-9c86-5bb7719f6f46	2017-07-06 18:25:19.876	2017-07-06 18:25:19.876	f	admin
427	87	intermediate	2017-07-06 18:25:19.876	2017-07-06 18:25:19.876	f	admin
427	90	B20.-	2017-07-06 18:25:19.876	2017-07-06 18:25:19.876	f	admin
427	91	GukXNkkSnHS	2017-07-06 18:25:19.876	2017-07-06 18:25:19.876	f	admin
427	88	1978-09-28	2017-07-06 18:25:19.881	2017-07-06 18:25:19.881	f	admin
428	86	11aa1ce4-2021-47f4-92d2-fffe616ad454	2017-07-06 18:25:19.883	2017-07-06 18:25:19.883	f	admin
428	87	male	2017-07-06 18:25:19.883	2017-07-06 18:25:19.883	f	admin
428	90	A17.1	2017-07-06 18:25:19.883	2017-07-06 18:25:19.883	f	admin
428	91	fT7QHiOUjWq	2017-07-06 18:25:19.883	2017-07-06 18:25:19.883	f	admin
428	89	65	2017-07-06 18:25:19.887	2017-07-06 18:25:19.887	f	admin
429	86	08eda82a-4ebd-4623-ad6c-9d5fa7e45898	2017-07-06 18:25:19.889	2017-07-06 18:25:19.889	f	admin
429	87	female	2017-07-06 18:25:19.89	2017-07-06 18:25:19.89	f	admin
429	90	A17.1	2017-07-06 18:25:19.89	2017-07-06 18:25:19.89	f	admin
429	91	JKbp9OxDFgm	2017-07-06 18:25:19.89	2017-07-06 18:25:19.89	f	admin
429	88	2004-03-16	2017-07-06 18:25:19.893	2017-07-06 18:25:19.893	f	admin
430	86	4c9a7e19-178a-4ca9-a527-a2556e776599	2017-07-06 18:25:19.897	2017-07-06 18:25:19.897	f	admin
430	87	intermediate	2017-07-06 18:25:19.897	2017-07-06 18:25:19.897	f	admin
430	90	E50.-	2017-07-06 18:25:19.897	2017-07-06 18:25:19.897	f	admin
430	91	ZcCsE6FtCzt	2017-07-06 18:25:19.897	2017-07-06 18:25:19.897	f	admin
430	88	1937-07-03	2017-07-06 18:25:19.901	2017-07-06 18:25:19.901	f	admin
431	86	837c6262-f108-4b28-9bf6-a019e57e5a13	2017-07-06 18:25:19.903	2017-07-06 18:25:19.903	f	admin
431	87	missing	2017-07-06 18:25:19.903	2017-07-06 18:25:19.903	f	admin
431	90	E50.-	2017-07-06 18:25:19.903	2017-07-06 18:25:19.903	f	admin
431	91	dvUgZQgrrS1	2017-07-06 18:25:19.903	2017-07-06 18:25:19.903	f	admin
431	88	1972-10-17	2017-07-06 18:25:19.907	2017-07-06 18:25:19.907	f	admin
432	86	9f86c28e-af15-4986-acbd-c35ec0181fd4	2017-07-06 18:25:19.91	2017-07-06 18:25:19.91	f	admin
432	87	female	2017-07-06 18:25:19.91	2017-07-06 18:25:19.91	f	admin
432	90	E50.-	2017-07-06 18:25:19.91	2017-07-06 18:25:19.91	f	admin
432	91	BNiG32Fn2kN	2017-07-06 18:25:19.91	2017-07-06 18:25:19.91	f	admin
432	89	60	2017-07-06 18:25:19.915	2017-07-06 18:25:19.915	f	admin
433	86	60e2d909-ef38-420a-8bb2-160c9f2f806b	2017-07-06 18:25:19.918	2017-07-06 18:25:19.918	f	admin
433	87	male	2017-07-06 18:25:19.918	2017-07-06 18:25:19.918	f	admin
433	90	A17.0	2017-07-06 18:25:19.918	2017-07-06 18:25:19.918	f	admin
433	91	WmIL4nsxxjZ	2017-07-06 18:25:19.918	2017-07-06 18:25:19.918	f	admin
433	89	62	2017-07-06 18:25:19.921	2017-07-06 18:25:19.921	f	admin
434	86	1c1d4a01-1002-41d5-8a97-05815d31147f	2017-07-06 18:25:19.924	2017-07-06 18:25:19.924	f	admin
434	87	female	2017-07-06 18:25:19.924	2017-07-06 18:25:19.924	f	admin
434	90	A17.1	2017-07-06 18:25:19.924	2017-07-06 18:25:19.924	f	admin
434	91	jCmtVh55drN	2017-07-06 18:25:19.924	2017-07-06 18:25:19.924	f	admin
434	89	14	2017-07-06 18:25:19.928	2017-07-06 18:25:19.928	f	admin
435	86	d99fe9b2-3b2c-49c6-bf0f-ec6697423802	2017-07-06 18:25:19.93	2017-07-06 18:25:19.93	f	admin
435	87	missing	2017-07-06 18:25:19.931	2017-07-06 18:25:19.931	f	admin
435	90	B05.-	2017-07-06 18:25:19.931	2017-07-06 18:25:19.931	f	admin
435	91	MYZ37yGNMhQ	2017-07-06 18:25:19.931	2017-07-06 18:25:19.931	f	admin
435	89	29	2017-07-06 18:25:19.934	2017-07-06 18:25:19.934	f	admin
436	86	c46a4c86-cb15-44b3-a59e-8e7d7bc56983	2017-07-06 18:25:19.937	2017-07-06 18:25:19.937	f	admin
436	87	female	2017-07-06 18:25:19.937	2017-07-06 18:25:19.937	f	admin
436	90	B20.-	2017-07-06 18:25:19.937	2017-07-06 18:25:19.937	f	admin
436	91	vObxUMawzSS	2017-07-06 18:25:19.937	2017-07-06 18:25:19.937	f	admin
436	88	1935-12-27	2017-07-06 18:25:19.941	2017-07-06 18:25:19.941	f	admin
436	89	80	2017-07-06 18:25:19.941	2017-07-06 18:25:19.941	f	admin
437	86	208ab83f-8b89-4215-b645-a1038f1beca8	2017-07-06 18:25:19.944	2017-07-06 18:25:19.944	f	admin
437	87	female	2017-07-06 18:25:19.944	2017-07-06 18:25:19.944	f	admin
437	90	B05.-	2017-07-06 18:25:19.944	2017-07-06 18:25:19.944	f	admin
437	91	PwJyPUkFptN	2017-07-06 18:25:19.944	2017-07-06 18:25:19.944	f	admin
437	89	94	2017-07-06 18:25:19.948	2017-07-06 18:25:19.948	f	admin
438	86	e4f8ce34-2d09-4fba-b28c-9982782aea02	2017-07-06 18:25:19.95	2017-07-06 18:25:19.95	f	admin
438	87	male	2017-07-06 18:25:19.95	2017-07-06 18:25:19.95	f	admin
438	90	A17.1	2017-07-06 18:25:19.95	2017-07-06 18:25:19.95	f	admin
438	91	UpubkhgaYva	2017-07-06 18:25:19.95	2017-07-06 18:25:19.95	f	admin
438	88	1992-05-11	2017-07-06 18:25:19.955	2017-07-06 18:25:19.955	f	admin
439	86	fe3759b4-3593-452b-b671-fad92df8c54f	2017-07-06 18:25:19.958	2017-07-06 18:25:19.958	f	admin
439	87	male	2017-07-06 18:25:19.958	2017-07-06 18:25:19.958	f	admin
439	90	A17.0	2017-07-06 18:25:19.958	2017-07-06 18:25:19.958	f	admin
439	91	AWHDPegdOhw	2017-07-06 18:25:19.958	2017-07-06 18:25:19.958	f	admin
439	88	1969-12-04	2017-07-06 18:25:19.963	2017-07-06 18:25:19.963	f	admin
439	89	47	2017-07-06 18:25:19.963	2017-07-06 18:25:19.963	f	admin
540	86	210a071e-d517-499a-9c23-67d32d4e994c	2017-07-06 18:26:36.618	2017-07-06 18:26:36.618	f	admin
540	87	missing	2017-07-06 18:26:36.619	2017-07-06 18:26:36.619	f	admin
540	90	B05.-	2017-07-06 18:26:36.619	2017-07-06 18:26:36.619	f	admin
540	91	Sj7ENSpxmgx	2017-07-06 18:26:36.62	2017-07-06 18:26:36.62	f	admin
540	89	43	2017-07-06 18:26:36.624	2017-07-06 18:26:36.624	f	admin
541	86	907899cc-14c9-48a8-bb1a-7472b9ceb8f5	2017-07-06 18:26:36.637	2017-07-06 18:26:36.637	f	admin
541	87	female	2017-07-06 18:26:36.638	2017-07-06 18:26:36.638	f	admin
541	90	B05.-	2017-07-06 18:26:36.639	2017-07-06 18:26:36.639	f	admin
541	91	qXhYY9ZdBXs	2017-07-06 18:26:36.64	2017-07-06 18:26:36.64	f	admin
541	88	1976-11-16	2017-07-06 18:26:36.642	2017-07-06 18:26:36.642	f	admin
541	89	39	2017-07-06 18:26:36.643	2017-07-06 18:26:36.643	f	admin
542	86	2ea544c9-66fb-4f7d-b080-71e06792db68	2017-07-06 18:26:36.646	2017-07-06 18:26:36.646	f	admin
542	87	unknown	2017-07-06 18:26:36.646	2017-07-06 18:26:36.646	f	admin
542	90	B20.-	2017-07-06 18:26:36.646	2017-07-06 18:26:36.646	f	admin
542	91	Qx5mfVwQNcS	2017-07-06 18:26:36.646	2017-07-06 18:26:36.646	f	admin
542	89	88	2017-07-06 18:26:36.654	2017-07-06 18:26:36.654	f	admin
543	86	de66430a-4ee0-46f0-9754-0b43ac1a7aa7	2017-07-06 18:26:36.656	2017-07-06 18:26:36.656	f	admin
543	87	male	2017-07-06 18:26:36.656	2017-07-06 18:26:36.656	f	admin
543	90	E50.-	2017-07-06 18:26:36.656	2017-07-06 18:26:36.656	f	admin
543	91	s7kXyejtQd7	2017-07-06 18:26:36.656	2017-07-06 18:26:36.656	f	admin
543	88	1943-05-19	2017-07-06 18:26:36.661	2017-07-06 18:26:36.661	f	admin
543	89	73	2017-07-06 18:26:36.661	2017-07-06 18:26:36.661	f	admin
544	86	4ed6c201-ffd5-4500-864f-ac67ec9f9cf8	2017-07-06 18:26:36.663	2017-07-06 18:26:36.663	f	admin
544	87	female	2017-07-06 18:26:36.663	2017-07-06 18:26:36.663	f	admin
544	90	E50.-	2017-07-06 18:26:36.663	2017-07-06 18:26:36.663	f	admin
544	91	RJhsj8GpHe8	2017-07-06 18:26:36.664	2017-07-06 18:26:36.664	f	admin
544	89	57	2017-07-06 18:26:36.668	2017-07-06 18:26:36.668	f	admin
545	86	819fdead-63fd-42e1-bae0-63469bfd0cfe	2017-07-06 18:26:36.67	2017-07-06 18:26:36.67	f	admin
545	87	male	2017-07-06 18:26:36.671	2017-07-06 18:26:36.671	f	admin
545	90	A17.-	2017-07-06 18:26:36.671	2017-07-06 18:26:36.671	f	admin
545	91	qlB6TPMh4lQ	2017-07-06 18:26:36.671	2017-07-06 18:26:36.671	f	admin
545	88	1929-10-16	2017-07-06 18:26:36.675	2017-07-06 18:26:36.675	f	admin
546	86	c4431502-2ada-4a75-be6f-34bdf60e2818	2017-07-06 18:26:36.677	2017-07-06 18:26:36.677	f	admin
546	87	female	2017-07-06 18:26:36.677	2017-07-06 18:26:36.677	f	admin
546	90	A17.8	2017-07-06 18:26:36.677	2017-07-06 18:26:36.677	f	admin
546	91	GLU5n1xHdJu	2017-07-06 18:26:36.677	2017-07-06 18:26:36.677	f	admin
546	88	1950-07-05	2017-07-06 18:26:36.683	2017-07-06 18:26:36.683	f	admin
547	86	90ffb0d9-d68c-42a8-933f-25f22f7b3270	2017-07-06 18:26:36.685	2017-07-06 18:26:36.685	f	admin
547	87	male	2017-07-06 18:26:36.685	2017-07-06 18:26:36.685	f	admin
547	90	A17.8	2017-07-06 18:26:36.685	2017-07-06 18:26:36.685	f	admin
547	91	DAOZQrpBXl5	2017-07-06 18:26:36.685	2017-07-06 18:26:36.685	f	admin
547	88	1983-12-22	2017-07-06 18:26:36.689	2017-07-06 18:26:36.689	f	admin
547	89	32	2017-07-06 18:26:36.689	2017-07-06 18:26:36.689	f	admin
548	86	67a86f23-b2aa-4f4a-acf7-35deba7f6df9	2017-07-06 18:26:36.692	2017-07-06 18:26:36.692	f	admin
548	87	male	2017-07-06 18:26:36.692	2017-07-06 18:26:36.692	f	admin
548	90	B05.-	2017-07-06 18:26:36.692	2017-07-06 18:26:36.692	f	admin
548	91	uCWgsMiF6l2	2017-07-06 18:26:36.692	2017-07-06 18:26:36.692	f	admin
548	88	1953-11-01	2017-07-06 18:26:36.696	2017-07-06 18:26:36.696	f	admin
548	89	62	2017-07-06 18:26:36.696	2017-07-06 18:26:36.696	f	admin
549	86	1d8591b4-66cb-461c-ba7e-d86abc7721ad	2017-07-06 18:26:36.699	2017-07-06 18:26:36.699	f	admin
549	87	male	2017-07-06 18:26:36.699	2017-07-06 18:26:36.699	f	admin
549	90	A17.8	2017-07-06 18:26:36.699	2017-07-06 18:26:36.699	f	admin
549	91	a1jVEjBe4wU	2017-07-06 18:26:36.699	2017-07-06 18:26:36.699	f	admin
549	88	1993-01-01	2017-07-06 18:26:36.703	2017-07-06 18:26:36.703	f	admin
549	89	23	2017-07-06 18:26:36.703	2017-07-06 18:26:36.703	f	admin
550	86	9245d5d4-71bf-448a-9eae-099053a5f57a	2017-07-06 18:26:36.705	2017-07-06 18:26:36.705	f	admin
550	87	male	2017-07-06 18:26:36.705	2017-07-06 18:26:36.705	f	admin
550	90	B05.-	2017-07-06 18:26:36.705	2017-07-06 18:26:36.705	f	admin
550	91	Qna6gK6JVdW	2017-07-06 18:26:36.705	2017-07-06 18:26:36.705	f	admin
550	88	1955-06-02	2017-07-06 18:26:36.709	2017-07-06 18:26:36.709	f	admin
551	86	84b8542c-11e4-44ef-9b5e-f63f6aea3e16	2017-07-06 18:26:36.712	2017-07-06 18:26:36.712	f	admin
551	87	female	2017-07-06 18:26:36.712	2017-07-06 18:26:36.712	f	admin
551	90	B20.-	2017-07-06 18:26:36.712	2017-07-06 18:26:36.712	f	admin
551	91	RHL7gc4AUkY	2017-07-06 18:26:36.712	2017-07-06 18:26:36.712	f	admin
551	89	52	2017-07-06 18:26:36.715	2017-07-06 18:26:36.715	f	admin
552	86	8f6904ca-92f1-45e4-a149-8af6db75f4c3	2017-07-06 18:26:36.718	2017-07-06 18:26:36.718	f	admin
552	87	female	2017-07-06 18:26:36.718	2017-07-06 18:26:36.718	f	admin
552	90	A17.1	2017-07-06 18:26:36.718	2017-07-06 18:26:36.718	f	admin
552	91	yM7ZuruAaXx	2017-07-06 18:26:36.718	2017-07-06 18:26:36.718	f	admin
552	88	1930-12-10	2017-07-06 18:26:36.721	2017-07-06 18:26:36.721	f	admin
553	86	d678ebb4-31e4-46ae-afe2-b9202e0d1b35	2017-07-06 18:26:36.724	2017-07-06 18:26:36.724	f	admin
553	87	missing	2017-07-06 18:26:36.724	2017-07-06 18:26:36.724	f	admin
553	90	A17.-	2017-07-06 18:26:36.724	2017-07-06 18:26:36.724	f	admin
553	91	YcYWPKQbHzU	2017-07-06 18:26:36.724	2017-07-06 18:26:36.724	f	admin
553	88	2000-01-31	2017-07-06 18:26:36.729	2017-07-06 18:26:36.729	f	admin
554	86	9bea01a4-095c-4879-b565-eef4da2c82a2	2017-07-06 18:26:36.731	2017-07-06 18:26:36.731	f	admin
554	87	male	2017-07-06 18:26:36.731	2017-07-06 18:26:36.731	f	admin
554	90	A17.-	2017-07-06 18:26:36.731	2017-07-06 18:26:36.731	f	admin
554	91	W3j6BiPOrfY	2017-07-06 18:26:36.731	2017-07-06 18:26:36.731	f	admin
554	88	1958-08-10	2017-07-06 18:26:36.735	2017-07-06 18:26:36.735	f	admin
555	86	9d76cbf3-02c9-4eaf-b811-f5d5b24cd7b1	2017-07-06 18:26:36.737	2017-07-06 18:26:36.737	f	admin
555	87	female	2017-07-06 18:26:36.737	2017-07-06 18:26:36.737	f	admin
555	90	B20.-	2017-07-06 18:26:36.737	2017-07-06 18:26:36.737	f	admin
555	91	rlcjZEgPBtn	2017-07-06 18:26:36.737	2017-07-06 18:26:36.737	f	admin
555	88	2003-07-03	2017-07-06 18:26:36.742	2017-07-06 18:26:36.742	f	admin
556	86	fafb5f75-d326-4e4c-b7e2-b6e9dab8d5f5	2017-07-06 18:26:36.744	2017-07-06 18:26:36.744	f	admin
556	87	female	2017-07-06 18:26:36.744	2017-07-06 18:26:36.744	f	admin
556	90	B05.-	2017-07-06 18:26:36.744	2017-07-06 18:26:36.744	f	admin
556	91	MtRiJeI8jgw	2017-07-06 18:26:36.744	2017-07-06 18:26:36.744	f	admin
556	89	58	2017-07-06 18:26:36.748	2017-07-06 18:26:36.748	f	admin
557	86	20811de0-54a2-44e9-957a-bf0403df76a1	2017-07-06 18:26:36.75	2017-07-06 18:26:36.75	f	admin
557	87	female	2017-07-06 18:26:36.75	2017-07-06 18:26:36.75	f	admin
557	90	A17.8	2017-07-06 18:26:36.75	2017-07-06 18:26:36.75	f	admin
557	91	vdUul9g5awN	2017-07-06 18:26:36.75	2017-07-06 18:26:36.75	f	admin
557	88	1998-01-26	2017-07-06 18:26:36.754	2017-07-06 18:26:36.754	f	admin
557	89	19	2017-07-06 18:26:36.754	2017-07-06 18:26:36.754	f	admin
558	86	21f78457-fbc9-467b-95d3-613a35fa14d8	2017-07-06 18:26:36.756	2017-07-06 18:26:36.756	f	admin
558	87	male	2017-07-06 18:26:36.756	2017-07-06 18:26:36.756	f	admin
558	90	B05.-	2017-07-06 18:26:36.756	2017-07-06 18:26:36.756	f	admin
558	91	s13T0B5CPRp	2017-07-06 18:26:36.756	2017-07-06 18:26:36.756	f	admin
558	88	1929-05-30	2017-07-06 18:26:36.759	2017-07-06 18:26:36.759	f	admin
558	89	87	2017-07-06 18:26:36.76	2017-07-06 18:26:36.76	f	admin
559	86	8dee34cf-0eda-41f6-9d96-e303fa8ff8d7	2017-07-06 18:26:36.762	2017-07-06 18:26:36.762	f	admin
559	87	male	2017-07-06 18:26:36.762	2017-07-06 18:26:36.762	f	admin
559	90	A17.1	2017-07-06 18:26:36.762	2017-07-06 18:26:36.762	f	admin
559	91	gqtRqLCOq7t	2017-07-06 18:26:36.762	2017-07-06 18:26:36.762	f	admin
559	88	1947-06-13	2017-07-06 18:26:36.765	2017-07-06 18:26:36.765	f	admin
560	86	d12bef36-0c07-478a-acbe-ae97802248de	2017-07-06 18:26:36.768	2017-07-06 18:26:36.768	f	admin
560	87	missing	2017-07-06 18:26:36.768	2017-07-06 18:26:36.768	f	admin
560	90	E50.-	2017-07-06 18:26:36.768	2017-07-06 18:26:36.768	f	admin
560	91	hb60x5CJ15v	2017-07-06 18:26:36.768	2017-07-06 18:26:36.768	f	admin
560	88	1947-03-21	2017-07-06 18:26:36.771	2017-07-06 18:26:36.771	f	admin
560	89	69	2017-07-06 18:26:36.771	2017-07-06 18:26:36.771	f	admin
561	86	fc82bd77-217d-45d7-9091-2405f4551938	2017-07-06 18:26:36.774	2017-07-06 18:26:36.774	f	admin
561	87	intermediate	2017-07-06 18:26:36.774	2017-07-06 18:26:36.774	f	admin
561	90	E50.-	2017-07-06 18:26:36.774	2017-07-06 18:26:36.774	f	admin
561	91	kqnXEOcFRoJ	2017-07-06 18:26:36.774	2017-07-06 18:26:36.774	f	admin
561	89	91	2017-07-06 18:26:36.777	2017-07-06 18:26:36.777	f	admin
562	86	ac8e5eb8-14b4-4274-aea8-2840586c1580	2017-07-06 18:26:36.78	2017-07-06 18:26:36.78	f	admin
562	87	male	2017-07-06 18:26:36.78	2017-07-06 18:26:36.78	f	admin
562	90	A17.8	2017-07-06 18:26:36.78	2017-07-06 18:26:36.78	f	admin
562	91	zTlS1139OPP	2017-07-06 18:26:36.78	2017-07-06 18:26:36.78	f	admin
562	89	84	2017-07-06 18:26:36.783	2017-07-06 18:26:36.783	f	admin
563	86	1b945cda-d165-4d0f-8196-c46af1971dbc	2017-07-06 18:26:36.785	2017-07-06 18:26:36.785	f	admin
563	87	male	2017-07-06 18:26:36.785	2017-07-06 18:26:36.785	f	admin
563	90	E50.-	2017-07-06 18:26:36.785	2017-07-06 18:26:36.785	f	admin
563	91	hdDF1oAMCrT	2017-07-06 18:26:36.785	2017-07-06 18:26:36.785	f	admin
563	88	1982-08-23	2017-07-06 18:26:36.789	2017-07-06 18:26:36.789	f	admin
564	86	8500350b-1634-4640-8aa5-d838b00a6111	2017-07-06 18:26:36.791	2017-07-06 18:26:36.791	f	admin
564	87	female	2017-07-06 18:26:36.791	2017-07-06 18:26:36.791	f	admin
564	90	E50.-	2017-07-06 18:26:36.791	2017-07-06 18:26:36.791	f	admin
564	91	zenwoO3aMsk	2017-07-06 18:26:36.791	2017-07-06 18:26:36.791	f	admin
564	89	70	2017-07-06 18:26:36.795	2017-07-06 18:26:36.795	f	admin
565	86	672e05aa-6215-48b5-bae5-eabc14176969	2017-07-06 18:26:36.797	2017-07-06 18:26:36.797	f	admin
565	87	male	2017-07-06 18:26:36.797	2017-07-06 18:26:36.797	f	admin
565	90	B05.-	2017-07-06 18:26:36.797	2017-07-06 18:26:36.797	f	admin
565	91	lgLUwUHVNrJ	2017-07-06 18:26:36.797	2017-07-06 18:26:36.797	f	admin
565	88	1942-07-20	2017-07-06 18:26:36.801	2017-07-06 18:26:36.801	f	admin
565	89	73	2017-07-06 18:26:36.801	2017-07-06 18:26:36.801	f	admin
566	86	b022e2bc-7513-4e2e-a5d5-80188cc1ddd8	2017-07-06 18:26:36.803	2017-07-06 18:26:36.803	f	admin
566	87	male	2017-07-06 18:26:36.803	2017-07-06 18:26:36.803	f	admin
566	90	E50.-	2017-07-06 18:26:36.803	2017-07-06 18:26:36.803	f	admin
566	91	eXZHFVsKiHJ	2017-07-06 18:26:36.803	2017-07-06 18:26:36.803	f	admin
566	89	85	2017-07-06 18:26:36.807	2017-07-06 18:26:36.807	f	admin
567	86	59769f15-3c21-47ca-a458-e19b0fb21227	2017-07-06 18:26:36.809	2017-07-06 18:26:36.809	f	admin
567	87	female	2017-07-06 18:26:36.809	2017-07-06 18:26:36.809	f	admin
567	90	B20.-	2017-07-06 18:26:36.809	2017-07-06 18:26:36.809	f	admin
567	91	PuRxrmYF0CG	2017-07-06 18:26:36.81	2017-07-06 18:26:36.81	f	admin
567	88	1924-06-07	2017-07-06 18:26:36.813	2017-07-06 18:26:36.813	f	admin
568	86	f8cf235b-a1aa-4f26-9e46-a2f17e6dfb17	2017-07-06 18:26:36.815	2017-07-06 18:26:36.815	f	admin
568	87	male	2017-07-06 18:26:36.815	2017-07-06 18:26:36.815	f	admin
568	90	A17.8	2017-07-06 18:26:36.815	2017-07-06 18:26:36.815	f	admin
568	91	Fx9mBTGEaYH	2017-07-06 18:26:36.815	2017-07-06 18:26:36.815	f	admin
568	88	1995-06-19	2017-07-06 18:26:36.819	2017-07-06 18:26:36.819	f	admin
568	89	21	2017-07-06 18:26:36.819	2017-07-06 18:26:36.819	f	admin
569	86	3f575c5a-ab4c-4cd2-95d7-5428871fd0ed	2017-07-06 18:26:36.821	2017-07-06 18:26:36.821	f	admin
569	87	missing	2017-07-06 18:26:36.821	2017-07-06 18:26:36.821	f	admin
569	90	A17.8	2017-07-06 18:26:36.821	2017-07-06 18:26:36.821	f	admin
569	91	PwKoSMQ6EgG	2017-07-06 18:26:36.821	2017-07-06 18:26:36.821	f	admin
569	89	90	2017-07-06 18:26:36.825	2017-07-06 18:26:36.825	f	admin
570	86	9ac74385-b72a-4d4f-a48d-317e40727a23	2017-07-06 18:26:36.827	2017-07-06 18:26:36.827	f	admin
570	87	unknown	2017-07-06 18:26:36.827	2017-07-06 18:26:36.827	f	admin
570	90	A17.1	2017-07-06 18:26:36.827	2017-07-06 18:26:36.827	f	admin
570	91	hxbDfp3EC8z	2017-07-06 18:26:36.827	2017-07-06 18:26:36.827	f	admin
570	88	1955-05-31	2017-07-06 18:26:36.83	2017-07-06 18:26:36.831	f	admin
571	86	0b1d23db-0924-4f44-a2f5-96780e7d4b71	2017-07-06 18:26:36.833	2017-07-06 18:26:36.833	f	admin
571	87	female	2017-07-06 18:26:36.833	2017-07-06 18:26:36.833	f	admin
571	90	B05.-	2017-07-06 18:26:36.833	2017-07-06 18:26:36.833	f	admin
571	91	EqEWt5NdmGa	2017-07-06 18:26:36.833	2017-07-06 18:26:36.833	f	admin
571	88	1951-10-04	2017-07-06 18:26:36.838	2017-07-06 18:26:36.838	f	admin
571	89	65	2017-07-06 18:26:36.838	2017-07-06 18:26:36.838	f	admin
572	86	72ccbbb1-50df-4f5d-8955-2007854a4ac3	2017-07-06 18:26:36.841	2017-07-06 18:26:36.841	f	admin
572	87	male	2017-07-06 18:26:36.841	2017-07-06 18:26:36.841	f	admin
572	90	E50.-	2017-07-06 18:26:36.841	2017-07-06 18:26:36.841	f	admin
572	91	axAcJRTfKzq	2017-07-06 18:26:36.841	2017-07-06 18:26:36.841	f	admin
572	88	1993-07-06	2017-07-06 18:26:36.845	2017-07-06 18:26:36.845	f	admin
573	86	0f8cba50-f95b-4cf3-9bd2-dbe71d487aeb	2017-07-06 18:26:36.848	2017-07-06 18:26:36.848	f	admin
573	87	intermediate	2017-07-06 18:26:36.848	2017-07-06 18:26:36.848	f	admin
573	90	E50.-	2017-07-06 18:26:36.848	2017-07-06 18:26:36.848	f	admin
573	91	ZNta0eHZ8Dy	2017-07-06 18:26:36.848	2017-07-06 18:26:36.848	f	admin
573	88	1984-08-29	2017-07-06 18:26:36.851	2017-07-06 18:26:36.851	f	admin
574	86	816bffd1-c18f-4f86-8aee-ee60dc2aa3b2	2017-07-06 18:26:36.854	2017-07-06 18:26:36.854	f	admin
574	87	female	2017-07-06 18:26:36.854	2017-07-06 18:26:36.854	f	admin
574	90	A17.1	2017-07-06 18:26:36.854	2017-07-06 18:26:36.854	f	admin
574	91	Rfr4QLNbo7i	2017-07-06 18:26:36.854	2017-07-06 18:26:36.854	f	admin
574	88	1990-03-09	2017-07-06 18:26:36.858	2017-07-06 18:26:36.858	f	admin
574	89	25	2017-07-06 18:26:36.858	2017-07-06 18:26:36.858	f	admin
575	86	44f95467-96f4-404b-b582-d7722e39f9a2	2017-07-06 18:26:36.861	2017-07-06 18:26:36.861	f	admin
575	87	female	2017-07-06 18:26:36.861	2017-07-06 18:26:36.861	f	admin
575	90	A17.8	2017-07-06 18:26:36.861	2017-07-06 18:26:36.861	f	admin
575	91	HBhvRe4u5uE	2017-07-06 18:26:36.861	2017-07-06 18:26:36.861	f	admin
575	88	2000-03-26	2017-07-06 18:26:36.865	2017-07-06 18:26:36.865	f	admin
576	86	0c097e16-d5f6-4619-820c-b5dc24c29ac4	2017-07-06 18:26:36.867	2017-07-06 18:26:36.867	f	admin
576	87	intermediate	2017-07-06 18:26:36.867	2017-07-06 18:26:36.867	f	admin
576	90	E50.-	2017-07-06 18:26:36.867	2017-07-06 18:26:36.867	f	admin
576	91	BTWnJw7cRjz	2017-07-06 18:26:36.867	2017-07-06 18:26:36.867	f	admin
576	88	1941-03-11	2017-07-06 18:26:36.871	2017-07-06 18:26:36.871	f	admin
577	86	78c47139-6373-4edc-908f-10d022ad436e	2017-07-06 18:26:36.874	2017-07-06 18:26:36.874	f	admin
577	87	missing	2017-07-06 18:26:36.874	2017-07-06 18:26:36.874	f	admin
577	90	E50.-	2017-07-06 18:26:36.874	2017-07-06 18:26:36.874	f	admin
577	91	V0iM4MAIY7U	2017-07-06 18:26:36.874	2017-07-06 18:26:36.874	f	admin
577	88	1946-08-08	2017-07-06 18:26:36.877	2017-07-06 18:26:36.877	f	admin
577	89	70	2017-07-06 18:26:36.877	2017-07-06 18:26:36.877	f	admin
578	86	988e51d8-2031-49da-8b95-71a721f4e8cb	2017-07-06 18:26:36.88	2017-07-06 18:26:36.88	f	admin
578	87	female	2017-07-06 18:26:36.88	2017-07-06 18:26:36.88	f	admin
578	90	B05.-	2017-07-06 18:26:36.88	2017-07-06 18:26:36.88	f	admin
578	91	O9TQpEDQC6C	2017-07-06 18:26:36.88	2017-07-06 18:26:36.88	f	admin
578	89	13	2017-07-06 18:26:36.885	2017-07-06 18:26:36.885	f	admin
579	86	bebc2d18-db98-489b-8b00-1ca4a927b97f	2017-07-06 18:26:36.888	2017-07-06 18:26:36.888	f	admin
579	87	missing	2017-07-06 18:26:36.888	2017-07-06 18:26:36.888	f	admin
579	90	A17.1	2017-07-06 18:26:36.888	2017-07-06 18:26:36.888	f	admin
579	91	i4LSgNtU5ds	2017-07-06 18:26:36.888	2017-07-06 18:26:36.888	f	admin
579	88	1943-06-06	2017-07-06 18:26:36.893	2017-07-06 18:26:36.893	f	admin
579	89	73	2017-07-06 18:26:36.893	2017-07-06 18:26:36.893	f	admin
580	86	39373552-bd18-498b-82f3-1e68d99d4bea	2017-07-06 18:26:36.896	2017-07-06 18:26:36.896	f	admin
580	87	female	2017-07-06 18:26:36.896	2017-07-06 18:26:36.896	f	admin
580	90	A17.0	2017-07-06 18:26:36.896	2017-07-06 18:26:36.896	f	admin
580	91	zZFsV8JYzCe	2017-07-06 18:26:36.896	2017-07-06 18:26:36.896	f	admin
580	89	38	2017-07-06 18:26:36.901	2017-07-06 18:26:36.901	f	admin
581	86	00dc6fcb-33d8-4f6d-b871-751528deb1f0	2017-07-06 18:26:36.904	2017-07-06 18:26:36.904	f	admin
581	87	female	2017-07-06 18:26:36.904	2017-07-06 18:26:36.904	f	admin
581	90	B05.-	2017-07-06 18:26:36.904	2017-07-06 18:26:36.904	f	admin
581	91	xuSxwRSXqZp	2017-07-06 18:26:36.904	2017-07-06 18:26:36.904	f	admin
581	89	18	2017-07-06 18:26:36.907	2017-07-06 18:26:36.907	f	admin
582	86	cb57f9b9-b69b-4cb0-860f-c46f2ef0fc17	2017-07-06 18:26:36.91	2017-07-06 18:26:36.91	f	admin
582	87	male	2017-07-06 18:26:36.91	2017-07-06 18:26:36.91	f	admin
582	90	A17.0	2017-07-06 18:26:36.91	2017-07-06 18:26:36.91	f	admin
582	91	uyZbe2qGp2d	2017-07-06 18:26:36.91	2017-07-06 18:26:36.91	f	admin
582	89	12	2017-07-06 18:26:36.914	2017-07-06 18:26:36.914	f	admin
583	86	5f83e3ab-a1bf-429e-a909-6b9fe6a70939	2017-07-06 18:26:36.917	2017-07-06 18:26:36.917	f	admin
583	87	unknown	2017-07-06 18:26:36.917	2017-07-06 18:26:36.917	f	admin
583	90	A17.0	2017-07-06 18:26:36.917	2017-07-06 18:26:36.917	f	admin
583	91	LLO1GzSbvLE	2017-07-06 18:26:36.917	2017-07-06 18:26:36.917	f	admin
583	89	43	2017-07-06 18:26:36.921	2017-07-06 18:26:36.921	f	admin
584	86	6a311001-cef8-44cc-8b9b-1d5b592976a1	2017-07-06 18:26:36.924	2017-07-06 18:26:36.924	f	admin
584	87	female	2017-07-06 18:26:36.924	2017-07-06 18:26:36.924	f	admin
584	90	A17.-	2017-07-06 18:26:36.924	2017-07-06 18:26:36.924	f	admin
584	91	lMxnvOcLMzB	2017-07-06 18:26:36.924	2017-07-06 18:26:36.924	f	admin
584	89	88	2017-07-06 18:26:36.928	2017-07-06 18:26:36.928	f	admin
585	86	4ffb4e09-c5e5-41ae-9754-b5941341f10b	2017-07-06 18:26:36.931	2017-07-06 18:26:36.931	f	admin
585	87	female	2017-07-06 18:26:36.931	2017-07-06 18:26:36.931	f	admin
585	90	A17.8	2017-07-06 18:26:36.931	2017-07-06 18:26:36.931	f	admin
585	91	b8kqrNr1uEo	2017-07-06 18:26:36.931	2017-07-06 18:26:36.931	f	admin
585	88	1984-12-05	2017-07-06 18:26:36.935	2017-07-06 18:26:36.935	f	admin
585	89	31	2017-07-06 18:26:36.935	2017-07-06 18:26:36.935	f	admin
586	86	88e8bf45-4a77-4618-bfa2-16cfe8338006	2017-07-06 18:26:36.938	2017-07-06 18:26:36.938	f	admin
586	87	female	2017-07-06 18:26:36.938	2017-07-06 18:26:36.938	f	admin
586	90	A17.-	2017-07-06 18:26:36.938	2017-07-06 18:26:36.938	f	admin
586	91	wfv3BFsIvFj	2017-07-06 18:26:36.938	2017-07-06 18:26:36.938	f	admin
586	89	38	2017-07-06 18:26:36.942	2017-07-06 18:26:36.942	f	admin
587	86	c6b10613-5c99-4e1f-8fc3-fb69a7d72c5b	2017-07-06 18:26:36.945	2017-07-06 18:26:36.945	f	admin
587	87	male	2017-07-06 18:26:36.945	2017-07-06 18:26:36.945	f	admin
587	90	A17.-	2017-07-06 18:26:36.945	2017-07-06 18:26:36.945	f	admin
587	91	IYFHizngWF7	2017-07-06 18:26:36.945	2017-07-06 18:26:36.945	f	admin
587	89	58	2017-07-06 18:26:36.95	2017-07-06 18:26:36.95	f	admin
588	86	ca5405c3-dc67-4a35-8b6e-5e0fae1a7ba0	2017-07-06 18:26:36.953	2017-07-06 18:26:36.953	f	admin
588	87	male	2017-07-06 18:26:36.953	2017-07-06 18:26:36.953	f	admin
588	90	A17.1	2017-07-06 18:26:36.953	2017-07-06 18:26:36.953	f	admin
588	91	QXCNQlVkRyC	2017-07-06 18:26:36.953	2017-07-06 18:26:36.953	f	admin
588	89	57	2017-07-06 18:26:36.958	2017-07-06 18:26:36.958	f	admin
589	86	2cc216a3-1824-4df4-87bf-32fe54004bc9	2017-07-06 18:26:36.961	2017-07-06 18:26:36.961	f	admin
589	87	male	2017-07-06 18:26:36.961	2017-07-06 18:26:36.961	f	admin
589	90	A17.0	2017-07-06 18:26:36.961	2017-07-06 18:26:36.961	f	admin
589	91	ORv9UC9bJq5	2017-07-06 18:26:36.961	2017-07-06 18:26:36.961	f	admin
589	89	7	2017-07-06 18:26:36.966	2017-07-06 18:26:36.966	f	admin
590	86	3ff7090e-87a4-4344-b449-7fc56efbc8ba	2017-07-06 18:26:36.97	2017-07-06 18:26:36.97	f	admin
590	87	male	2017-07-06 18:26:36.97	2017-07-06 18:26:36.97	f	admin
590	90	A17.-	2017-07-06 18:26:36.97	2017-07-06 18:26:36.97	f	admin
590	91	oZQAA5JV2ED	2017-07-06 18:26:36.97	2017-07-06 18:26:36.97	f	admin
590	88	1999-12-09	2017-07-06 18:26:36.975	2017-07-06 18:26:36.975	f	admin
590	89	16	2017-07-06 18:26:36.975	2017-07-06 18:26:36.975	f	admin
591	86	7e851806-542c-453a-95b9-3b736f7fe548	2017-07-06 18:26:36.98	2017-07-06 18:26:36.98	f	admin
591	87	male	2017-07-06 18:26:36.98	2017-07-06 18:26:36.98	f	admin
591	90	B05.-	2017-07-06 18:26:36.981	2017-07-06 18:26:36.981	f	admin
591	91	DwS3266rBtO	2017-07-06 18:26:36.981	2017-07-06 18:26:36.981	f	admin
591	88	1915-03-10	2017-07-06 18:26:36.984	2017-07-06 18:26:36.984	f	admin
592	86	3e0eaf31-48fe-4410-b068-f0b192c41730	2017-07-06 18:26:36.985	2017-07-06 18:26:36.985	f	admin
592	87	male	2017-07-06 18:26:36.985	2017-07-06 18:26:36.985	f	admin
592	90	A17.8	2017-07-06 18:26:36.985	2017-07-06 18:26:36.985	f	admin
592	91	nws8JSFirm3	2017-07-06 18:26:36.985	2017-07-06 18:26:36.985	f	admin
592	88	2011-08-21	2017-07-06 18:26:36.989	2017-07-06 18:26:36.989	f	admin
593	86	6cc91999-ddce-4d66-b0cb-95a2f17898c7	2017-07-06 18:26:36.99	2017-07-06 18:26:36.99	f	admin
593	87	missing	2017-07-06 18:26:36.99	2017-07-06 18:26:36.99	f	admin
593	90	E50.-	2017-07-06 18:26:36.99	2017-07-06 18:26:36.99	f	admin
593	91	bG8t4KbZrz9	2017-07-06 18:26:36.99	2017-07-06 18:26:36.99	f	admin
593	88	1974-05-03	2017-07-06 18:26:37.043	2017-07-06 18:26:37.043	f	admin
594	86	6d884dff-55e2-416b-96aa-79c1d2f3760c	2017-07-06 18:26:37.05	2017-07-06 18:26:37.05	f	admin
594	87	male	2017-07-06 18:26:37.05	2017-07-06 18:26:37.05	f	admin
594	90	A17.-	2017-07-06 18:26:37.05	2017-07-06 18:26:37.05	f	admin
594	91	vMgrPxsIWAt	2017-07-06 18:26:37.05	2017-07-06 18:26:37.05	f	admin
594	88	1935-04-15	2017-07-06 18:26:37.055	2017-07-06 18:26:37.055	f	admin
594	89	81	2017-07-06 18:26:37.056	2017-07-06 18:26:37.056	f	admin
595	86	8cbfdf02-395a-4d96-834c-2632f4d31c88	2017-07-06 18:26:37.058	2017-07-06 18:26:37.058	f	admin
595	87	female	2017-07-06 18:26:37.058	2017-07-06 18:26:37.058	f	admin
595	90	A17.8	2017-07-06 18:26:37.058	2017-07-06 18:26:37.058	f	admin
595	91	x0jFMk95F2K	2017-07-06 18:26:37.058	2017-07-06 18:26:37.058	f	admin
595	88	1970-07-02	2017-07-06 18:26:37.065	2017-07-06 18:26:37.065	f	admin
595	89	45	2017-07-06 18:26:37.065	2017-07-06 18:26:37.065	f	admin
596	86	4202dd1c-1ad3-4d3c-bfa4-9f65aa90c7c7	2017-07-06 18:26:37.067	2017-07-06 18:26:37.067	f	admin
596	87	female	2017-07-06 18:26:37.067	2017-07-06 18:26:37.067	f	admin
596	90	A17.1	2017-07-06 18:26:37.067	2017-07-06 18:26:37.067	f	admin
596	91	zTlSa1INIUn	2017-07-06 18:26:37.067	2017-07-06 18:26:37.067	f	admin
596	88	1959-06-09	2017-07-06 18:26:37.076	2017-07-06 18:26:37.076	f	admin
597	86	c239f261-4ba0-4aa7-9ea8-2157ce0714b3	2017-07-06 18:26:37.084	2017-07-06 18:26:37.084	f	admin
597	87	missing	2017-07-06 18:26:37.084	2017-07-06 18:26:37.084	f	admin
597	90	A17.0	2017-07-06 18:26:37.084	2017-07-06 18:26:37.085	f	admin
597	91	Qm2Wqk64IkB	2017-07-06 18:26:37.085	2017-07-06 18:26:37.085	f	admin
597	89	6	2017-07-06 18:26:37.09	2017-07-06 18:26:37.09	f	admin
598	86	1c2f00d0-6417-4ff0-bdee-90d5081c45ff	2017-07-06 18:26:37.092	2017-07-06 18:26:37.092	f	admin
598	87	male	2017-07-06 18:26:37.092	2017-07-06 18:26:37.092	f	admin
598	90	A17.8	2017-07-06 18:26:37.092	2017-07-06 18:26:37.092	f	admin
598	91	SLqRkprq9Q0	2017-07-06 18:26:37.092	2017-07-06 18:26:37.092	f	admin
598	88	1988-01-24	2017-07-06 18:26:37.096	2017-07-06 18:26:37.096	f	admin
598	89	28	2017-07-06 18:26:37.096	2017-07-06 18:26:37.096	f	admin
599	86	175b9f2f-0d2a-47f7-932e-2fe1ca42e1d6	2017-07-06 18:26:37.098	2017-07-06 18:26:37.098	f	admin
599	87	male	2017-07-06 18:26:37.098	2017-07-06 18:26:37.098	f	admin
599	90	A17.0	2017-07-06 18:26:37.098	2017-07-06 18:26:37.098	f	admin
599	91	TNcoYHs2VFa	2017-07-06 18:26:37.098	2017-07-06 18:26:37.098	f	admin
599	89	49	2017-07-06 18:26:37.103	2017-07-06 18:26:37.103	f	admin
600	86	e6d811cf-a46f-4d7e-baed-94822dcfbaeb	2017-07-06 18:26:37.106	2017-07-06 18:26:37.106	f	admin
600	87	female	2017-07-06 18:26:37.106	2017-07-06 18:26:37.106	f	admin
600	90	A17.-	2017-07-06 18:26:37.106	2017-07-06 18:26:37.106	f	admin
600	91	OaKRyCfwqJW	2017-07-06 18:26:37.106	2017-07-06 18:26:37.106	f	admin
600	88	1949-07-19	2017-07-06 18:26:37.109	2017-07-06 18:26:37.109	f	admin
601	86	3e282abd-e7f2-4763-acc9-95770e06b4e3	2017-07-06 18:26:37.112	2017-07-06 18:26:37.112	f	admin
601	87	unknown	2017-07-06 18:26:37.112	2017-07-06 18:26:37.112	f	admin
601	90	A17.1	2017-07-06 18:26:37.112	2017-07-06 18:26:37.112	f	admin
601	91	eIuauFCvMRa	2017-07-06 18:26:37.112	2017-07-06 18:26:37.112	f	admin
601	88	1980-07-28	2017-07-06 18:26:37.115	2017-07-06 18:26:37.115	f	admin
602	86	00d64e10-d50d-4f89-a2a4-01f17a3d24bb	2017-07-06 18:26:37.118	2017-07-06 18:26:37.118	f	admin
602	87	male	2017-07-06 18:26:37.118	2017-07-06 18:26:37.118	f	admin
602	90	A17.8	2017-07-06 18:26:37.118	2017-07-06 18:26:37.118	f	admin
602	91	U1oSPhAdMdm	2017-07-06 18:26:37.118	2017-07-06 18:26:37.118	f	admin
602	88	1951-03-01	2017-07-06 18:26:37.121	2017-07-06 18:26:37.121	f	admin
602	89	64	2017-07-06 18:26:37.121	2017-07-06 18:26:37.121	f	admin
603	86	c87da8d0-8b62-4b70-b598-04801d6b7e66	2017-07-06 18:26:37.124	2017-07-06 18:26:37.124	f	admin
603	87	female	2017-07-06 18:26:37.124	2017-07-06 18:26:37.124	f	admin
603	90	A17.8	2017-07-06 18:26:37.124	2017-07-06 18:26:37.124	f	admin
603	91	TbnZK8Yx6PH	2017-07-06 18:26:37.124	2017-07-06 18:26:37.124	f	admin
603	89	87	2017-07-06 18:26:37.128	2017-07-06 18:26:37.128	f	admin
604	86	2fcc996f-19a0-4bd2-a8d5-dfc4c19be49d	2017-07-06 18:26:37.13	2017-07-06 18:26:37.13	f	admin
604	87	male	2017-07-06 18:26:37.13	2017-07-06 18:26:37.13	f	admin
604	90	B05.-	2017-07-06 18:26:37.13	2017-07-06 18:26:37.13	f	admin
604	91	g3z2S5fjzKO	2017-07-06 18:26:37.13	2017-07-06 18:26:37.13	f	admin
604	89	41	2017-07-06 18:26:37.134	2017-07-06 18:26:37.134	f	admin
605	86	d6b110a9-57ef-48ab-99f1-f5b5554fc366	2017-07-06 18:26:37.136	2017-07-06 18:26:37.136	f	admin
605	87	missing	2017-07-06 18:26:37.136	2017-07-06 18:26:37.136	f	admin
605	90	A17.-	2017-07-06 18:26:37.136	2017-07-06 18:26:37.136	f	admin
605	91	bSi7TUH8LjV	2017-07-06 18:26:37.136	2017-07-06 18:26:37.136	f	admin
605	89	97	2017-07-06 18:26:37.139	2017-07-06 18:26:37.139	f	admin
606	86	7e291572-a0e1-4529-a168-80507ac160d8	2017-07-06 18:26:37.142	2017-07-06 18:26:37.142	f	admin
606	87	male	2017-07-06 18:26:37.142	2017-07-06 18:26:37.142	f	admin
606	90	E50.-	2017-07-06 18:26:37.142	2017-07-06 18:26:37.142	f	admin
606	91	G9m5QHm9WKQ	2017-07-06 18:26:37.142	2017-07-06 18:26:37.142	f	admin
606	88	1922-12-11	2017-07-06 18:26:37.145	2017-07-06 18:26:37.145	f	admin
607	86	7f0e1d69-952a-4fac-8e88-ed95c856e480	2017-07-06 18:26:37.147	2017-07-06 18:26:37.147	f	admin
607	87	female	2017-07-06 18:26:37.147	2017-07-06 18:26:37.147	f	admin
607	90	A17.0	2017-07-06 18:26:37.147	2017-07-06 18:26:37.147	f	admin
607	91	Nv35xQEDGL9	2017-07-06 18:26:37.147	2017-07-06 18:26:37.147	f	admin
607	88	1936-02-01	2017-07-06 18:26:37.151	2017-07-06 18:26:37.151	f	admin
608	86	6848371f-dfeb-41a3-9297-98dd069a245c	2017-07-06 18:26:37.153	2017-07-06 18:26:37.153	f	admin
608	87	male	2017-07-06 18:26:37.153	2017-07-06 18:26:37.153	f	admin
608	90	A17.0	2017-07-06 18:26:37.153	2017-07-06 18:26:37.153	f	admin
608	91	u3fsH6e77hO	2017-07-06 18:26:37.153	2017-07-06 18:26:37.153	f	admin
608	88	1967-08-02	2017-07-06 18:26:37.156	2017-07-06 18:26:37.156	f	admin
609	86	07dd9eae-7dd5-451a-8dbc-7da3127c5384	2017-07-06 18:26:37.16	2017-07-06 18:26:37.16	f	admin
609	87	female	2017-07-06 18:26:37.16	2017-07-06 18:26:37.16	f	admin
609	90	A17.1	2017-07-06 18:26:37.16	2017-07-06 18:26:37.16	f	admin
609	91	xmFmXW8zwte	2017-07-06 18:26:37.16	2017-07-06 18:26:37.16	f	admin
609	89	71	2017-07-06 18:26:37.164	2017-07-06 18:26:37.164	f	admin
610	86	986b3e07-e5ca-454d-903a-68303c2b3662	2017-07-06 18:26:37.166	2017-07-06 18:26:37.167	f	admin
610	87	female	2017-07-06 18:26:37.167	2017-07-06 18:26:37.167	f	admin
610	90	B05.-	2017-07-06 18:26:37.167	2017-07-06 18:26:37.167	f	admin
610	91	weDoN5IFtVM	2017-07-06 18:26:37.167	2017-07-06 18:26:37.167	f	admin
610	88	1957-08-03	2017-07-06 18:26:37.17	2017-07-06 18:26:37.17	f	admin
610	89	59	2017-07-06 18:26:37.17	2017-07-06 18:26:37.17	f	admin
611	86	7a3ed8d3-814f-4207-acb3-4357ea13dba5	2017-07-06 18:26:37.172	2017-07-06 18:26:37.172	f	admin
611	87	missing	2017-07-06 18:26:37.172	2017-07-06 18:26:37.172	f	admin
611	90	A17.0	2017-07-06 18:26:37.172	2017-07-06 18:26:37.172	f	admin
611	91	rplD1xHCKmr	2017-07-06 18:26:37.172	2017-07-06 18:26:37.172	f	admin
611	88	1966-09-16	2017-07-06 18:26:37.176	2017-07-06 18:26:37.176	f	admin
612	86	33967ce7-df0b-4ef8-a9d0-6640a4050043	2017-07-06 18:26:37.178	2017-07-06 18:26:37.178	f	admin
612	87	male	2017-07-06 18:26:37.178	2017-07-06 18:26:37.178	f	admin
612	90	A17.1	2017-07-06 18:26:37.178	2017-07-06 18:26:37.178	f	admin
612	91	aZIV38sbhi4	2017-07-06 18:26:37.178	2017-07-06 18:26:37.178	f	admin
612	88	1951-04-20	2017-07-06 18:26:37.185	2017-07-06 18:26:37.185	f	admin
612	89	66	2017-07-06 18:26:37.185	2017-07-06 18:26:37.185	f	admin
613	86	6782e954-7d2a-4f49-a4b7-d939b302e173	2017-07-06 18:26:37.187	2017-07-06 18:26:37.187	f	admin
613	87	female	2017-07-06 18:26:37.187	2017-07-06 18:26:37.187	f	admin
613	90	A17.0	2017-07-06 18:26:37.187	2017-07-06 18:26:37.187	f	admin
613	91	YvBzFvFIOew	2017-07-06 18:26:37.187	2017-07-06 18:26:37.187	f	admin
613	89	5	2017-07-06 18:26:37.191	2017-07-06 18:26:37.191	f	admin
614	86	fad955b8-52ce-4dd9-83bf-48dd31862dad	2017-07-06 18:26:37.194	2017-07-06 18:26:37.194	f	admin
614	87	male	2017-07-06 18:26:37.194	2017-07-06 18:26:37.194	f	admin
614	90	E50.-	2017-07-06 18:26:37.194	2017-07-06 18:26:37.194	f	admin
614	91	saCBOHxOy88	2017-07-06 18:26:37.194	2017-07-06 18:26:37.194	f	admin
614	89	61	2017-07-06 18:26:37.197	2017-07-06 18:26:37.197	f	admin
615	86	bf549663-a841-4302-84c2-f892b9da597b	2017-07-06 18:26:37.2	2017-07-06 18:26:37.2	f	admin
615	87	missing	2017-07-06 18:26:37.2	2017-07-06 18:26:37.2	f	admin
615	90	A17.-	2017-07-06 18:26:37.2	2017-07-06 18:26:37.2	f	admin
615	91	MMartt6Bld4	2017-07-06 18:26:37.2	2017-07-06 18:26:37.2	f	admin
615	88	1924-08-13	2017-07-06 18:26:37.204	2017-07-06 18:26:37.204	f	admin
615	89	91	2017-07-06 18:26:37.204	2017-07-06 18:26:37.204	f	admin
616	86	e826ddad-5acb-4671-9eb3-b532b60602e5	2017-07-06 18:26:37.206	2017-07-06 18:26:37.206	f	admin
616	87	female	2017-07-06 18:26:37.206	2017-07-06 18:26:37.206	f	admin
616	90	A17.8	2017-07-06 18:26:37.207	2017-07-06 18:26:37.207	f	admin
616	91	O5B2juYev41	2017-07-06 18:26:37.207	2017-07-06 18:26:37.207	f	admin
616	88	1957-08-08	2017-07-06 18:26:37.21	2017-07-06 18:26:37.21	f	admin
616	89	58	2017-07-06 18:26:37.21	2017-07-06 18:26:37.21	f	admin
617	86	97664983-304b-4915-bc1d-20ee1de7531d	2017-07-06 18:26:37.213	2017-07-06 18:26:37.213	f	admin
617	87	female	2017-07-06 18:26:37.213	2017-07-06 18:26:37.213	f	admin
617	90	B05.-	2017-07-06 18:26:37.213	2017-07-06 18:26:37.213	f	admin
617	91	UTFtUjQS6Nt	2017-07-06 18:26:37.213	2017-07-06 18:26:37.213	f	admin
617	88	1922-06-27	2017-07-06 18:26:37.217	2017-07-06 18:26:37.217	f	admin
618	86	b64e45ff-6d70-4844-a4a0-07a0c64396c1	2017-07-06 18:26:37.22	2017-07-06 18:26:37.22	f	admin
618	87	male	2017-07-06 18:26:37.22	2017-07-06 18:26:37.22	f	admin
618	90	A17.8	2017-07-06 18:26:37.22	2017-07-06 18:26:37.22	f	admin
618	91	NQZ0qwQfCwh	2017-07-06 18:26:37.22	2017-07-06 18:26:37.22	f	admin
618	88	1980-08-28	2017-07-06 18:26:37.223	2017-07-06 18:26:37.223	f	admin
618	89	36	2017-07-06 18:26:37.223	2017-07-06 18:26:37.223	f	admin
619	86	b73a399b-4009-4ace-8b2c-52869793821d	2017-07-06 18:26:37.226	2017-07-06 18:26:37.226	f	admin
619	87	female	2017-07-06 18:26:37.226	2017-07-06 18:26:37.226	f	admin
619	90	B20.-	2017-07-06 18:26:37.226	2017-07-06 18:26:37.226	f	admin
619	91	IfArklkS1nv	2017-07-06 18:26:37.226	2017-07-06 18:26:37.226	f	admin
619	88	1976-09-15	2017-07-06 18:26:37.23	2017-07-06 18:26:37.23	f	admin
620	86	cba813a3-de4a-467d-ae62-819be7dee7f3	2017-07-06 18:26:37.232	2017-07-06 18:26:37.232	f	admin
620	87	male	2017-07-06 18:26:37.232	2017-07-06 18:26:37.232	f	admin
620	90	A17.0	2017-07-06 18:26:37.232	2017-07-06 18:26:37.232	f	admin
620	91	QWZxMaObP89	2017-07-06 18:26:37.232	2017-07-06 18:26:37.232	f	admin
620	88	2000-07-14	2017-07-06 18:26:37.236	2017-07-06 18:26:37.236	f	admin
620	89	16	2017-07-06 18:26:37.236	2017-07-06 18:26:37.236	f	admin
621	86	7fc91fb6-89f9-4cb0-980a-cc90194a20cd	2017-07-06 18:26:37.238	2017-07-06 18:26:37.238	f	admin
621	87	female	2017-07-06 18:26:37.238	2017-07-06 18:26:37.238	f	admin
621	90	A17.0	2017-07-06 18:26:37.238	2017-07-06 18:26:37.238	f	admin
621	91	pFfkCSqckDc	2017-07-06 18:26:37.238	2017-07-06 18:26:37.238	f	admin
621	89	7	2017-07-06 18:26:37.242	2017-07-06 18:26:37.242	f	admin
622	86	f640df86-8c4c-4c28-b29d-1842b22c631c	2017-07-06 18:26:37.244	2017-07-06 18:26:37.244	f	admin
622	87	female	2017-07-06 18:26:37.244	2017-07-06 18:26:37.244	f	admin
622	90	B20.-	2017-07-06 18:26:37.244	2017-07-06 18:26:37.244	f	admin
622	91	RkK4m7ZEhAj	2017-07-06 18:26:37.244	2017-07-06 18:26:37.244	f	admin
622	89	53	2017-07-06 18:26:37.248	2017-07-06 18:26:37.248	f	admin
623	86	f99388f3-a2ee-4391-b565-22051be41fde	2017-07-06 18:26:37.251	2017-07-06 18:26:37.251	f	admin
623	87	male	2017-07-06 18:26:37.251	2017-07-06 18:26:37.251	f	admin
623	90	A17.-	2017-07-06 18:26:37.251	2017-07-06 18:26:37.251	f	admin
623	91	RUzNrjf0Ujq	2017-07-06 18:26:37.251	2017-07-06 18:26:37.251	f	admin
623	88	1989-11-30	2017-07-06 18:26:37.254	2017-07-06 18:26:37.254	f	admin
624	86	10ac190c-3b4f-4815-b93f-8cea3499ee98	2017-07-06 18:26:37.257	2017-07-06 18:26:37.257	f	admin
624	87	male	2017-07-06 18:26:37.257	2017-07-06 18:26:37.257	f	admin
624	90	A17.0	2017-07-06 18:26:37.257	2017-07-06 18:26:37.257	f	admin
624	91	THLA8FdNbZe	2017-07-06 18:26:37.257	2017-07-06 18:26:37.257	f	admin
624	88	1960-08-20	2017-07-06 18:26:37.26	2017-07-06 18:26:37.261	f	admin
625	86	c5e2321c-012f-400e-8330-5d7b5ca15498	2017-07-06 18:26:37.263	2017-07-06 18:26:37.263	f	admin
625	87	male	2017-07-06 18:26:37.263	2017-07-06 18:26:37.263	f	admin
625	90	A17.1	2017-07-06 18:26:37.263	2017-07-06 18:26:37.263	f	admin
625	91	nMSEzSK6pLb	2017-07-06 18:26:37.263	2017-07-06 18:26:37.263	f	admin
625	89	88	2017-07-06 18:26:37.267	2017-07-06 18:26:37.267	f	admin
626	86	3fcafabe-164d-4eda-b0db-3321705e9a06	2017-07-06 18:26:37.269	2017-07-06 18:26:37.269	f	admin
626	87	male	2017-07-06 18:26:37.27	2017-07-06 18:26:37.27	f	admin
626	90	B05.-	2017-07-06 18:26:37.27	2017-07-06 18:26:37.27	f	admin
626	91	M2JbMYBB9Gx	2017-07-06 18:26:37.27	2017-07-06 18:26:37.27	f	admin
626	88	2010-05-17	2017-07-06 18:26:37.273	2017-07-06 18:26:37.273	f	admin
627	86	7fa66ef6-3296-40ea-a16b-6f7ec4177d94	2017-07-06 18:26:37.276	2017-07-06 18:26:37.276	f	admin
627	87	female	2017-07-06 18:26:37.276	2017-07-06 18:26:37.276	f	admin
627	90	A17.-	2017-07-06 18:26:37.276	2017-07-06 18:26:37.276	f	admin
627	91	iXq3xYuQNhw	2017-07-06 18:26:37.276	2017-07-06 18:26:37.276	f	admin
627	88	1948-10-23	2017-07-06 18:26:37.28	2017-07-06 18:26:37.28	f	admin
628	86	e6a51174-ecea-4b1b-926d-58f7dbf1fc54	2017-07-06 18:26:37.283	2017-07-06 18:26:37.283	f	admin
628	87	male	2017-07-06 18:26:37.283	2017-07-06 18:26:37.283	f	admin
628	90	A17.8	2017-07-06 18:26:37.283	2017-07-06 18:26:37.283	f	admin
628	91	NmrMlyZhBlL	2017-07-06 18:26:37.283	2017-07-06 18:26:37.283	f	admin
628	88	1938-05-09	2017-07-06 18:26:37.287	2017-07-06 18:26:37.287	f	admin
629	86	bba97250-b479-43e1-a94b-07c9a69df383	2017-07-06 18:26:37.29	2017-07-06 18:26:37.29	f	admin
629	87	male	2017-07-06 18:26:37.29	2017-07-06 18:26:37.29	f	admin
629	90	A17.1	2017-07-06 18:26:37.29	2017-07-06 18:26:37.29	f	admin
629	91	kQ8u5EjxeCF	2017-07-06 18:26:37.29	2017-07-06 18:26:37.29	f	admin
629	89	68	2017-07-06 18:26:37.295	2017-07-06 18:26:37.295	f	admin
630	86	e8d8e467-074a-4719-97ea-26bba5d9c2e3	2017-07-06 18:26:37.298	2017-07-06 18:26:37.298	f	admin
630	87	male	2017-07-06 18:26:37.298	2017-07-06 18:26:37.298	f	admin
630	90	B20.-	2017-07-06 18:26:37.298	2017-07-06 18:26:37.298	f	admin
630	91	pIN35K8jxKT	2017-07-06 18:26:37.298	2017-07-06 18:26:37.298	f	admin
630	88	1920-11-21	2017-07-06 18:26:37.305	2017-07-06 18:26:37.305	f	admin
630	89	95	2017-07-06 18:26:37.305	2017-07-06 18:26:37.305	f	admin
631	86	7cbafa3d-acac-4272-a71c-23711fc35f7b	2017-07-06 18:26:37.313	2017-07-06 18:26:37.313	f	admin
631	87	male	2017-07-06 18:26:37.313	2017-07-06 18:26:37.313	f	admin
631	90	A17.0	2017-07-06 18:26:37.313	2017-07-06 18:26:37.313	f	admin
631	91	L3juenaq6Et	2017-07-06 18:26:37.313	2017-07-06 18:26:37.313	f	admin
631	89	92	2017-07-06 18:26:37.321	2017-07-06 18:26:37.321	f	admin
632	86	59e37c98-841f-4305-a459-186dcbd2f6dc	2017-07-06 18:26:37.326	2017-07-06 18:26:37.326	f	admin
632	87	missing	2017-07-06 18:26:37.326	2017-07-06 18:26:37.326	f	admin
632	90	B05.-	2017-07-06 18:26:37.326	2017-07-06 18:26:37.326	f	admin
632	91	mPr6rR2DgIn	2017-07-06 18:26:37.326	2017-07-06 18:26:37.326	f	admin
632	88	1926-07-07	2017-07-06 18:26:37.333	2017-07-06 18:26:37.333	f	admin
633	86	d3986ef8-1991-4ca5-a2f3-153d80c1ed45	2017-07-06 18:26:37.338	2017-07-06 18:26:37.338	f	admin
633	87	male	2017-07-06 18:26:37.338	2017-07-06 18:26:37.338	f	admin
633	90	B05.-	2017-07-06 18:26:37.338	2017-07-06 18:26:37.338	f	admin
633	91	LaExDNuUE72	2017-07-06 18:26:37.338	2017-07-06 18:26:37.338	f	admin
633	88	2015-08-20	2017-07-06 18:26:37.343	2017-07-06 18:26:37.343	f	admin
633	89	1	2017-07-06 18:26:37.344	2017-07-06 18:26:37.344	f	admin
634	86	dffc045b-a05d-4fd0-ad4c-1148cfee519b	2017-07-06 18:26:37.348	2017-07-06 18:26:37.348	f	admin
634	87	female	2017-07-06 18:26:37.348	2017-07-06 18:26:37.348	f	admin
634	90	A17.8	2017-07-06 18:26:37.348	2017-07-06 18:26:37.348	f	admin
634	91	Ewku5Ut7dzR	2017-07-06 18:26:37.348	2017-07-06 18:26:37.348	f	admin
634	88	1966-03-05	2017-07-06 18:26:37.354	2017-07-06 18:26:37.354	f	admin
634	89	50	2017-07-06 18:26:37.354	2017-07-06 18:26:37.354	f	admin
635	86	3fd9c45b-ddeb-42a5-8eef-32c437c3f02b	2017-07-06 18:26:37.359	2017-07-06 18:26:37.359	f	admin
635	87	male	2017-07-06 18:26:37.359	2017-07-06 18:26:37.359	f	admin
635	90	A17.8	2017-07-06 18:26:37.359	2017-07-06 18:26:37.359	f	admin
635	91	Lxj5QEhUexu	2017-07-06 18:26:37.359	2017-07-06 18:26:37.359	f	admin
635	88	2017-04-08	2017-07-06 18:26:37.365	2017-07-06 18:26:37.365	f	admin
635	89	0	2017-07-06 18:26:37.365	2017-07-06 18:26:37.365	f	admin
636	86	d1859ffd-40ae-46a5-8b14-4dcba11b29a9	2017-07-06 18:26:37.369	2017-07-06 18:26:37.369	f	admin
636	87	unknown	2017-07-06 18:26:37.369	2017-07-06 18:26:37.369	f	admin
636	90	A17.-	2017-07-06 18:26:37.369	2017-07-06 18:26:37.369	f	admin
636	91	MqnE8Hm2Rar	2017-07-06 18:26:37.369	2017-07-06 18:26:37.369	f	admin
636	88	1933-04-27	2017-07-06 18:26:37.374	2017-07-06 18:26:37.374	f	admin
637	86	2f548aec-f568-4d7b-a028-3f8567d181ac	2017-07-06 18:26:37.378	2017-07-06 18:26:37.378	f	admin
637	87	unknown	2017-07-06 18:26:37.378	2017-07-06 18:26:37.378	f	admin
637	90	A17.-	2017-07-06 18:26:37.378	2017-07-06 18:26:37.378	f	admin
637	91	Cd2udtLhXfu	2017-07-06 18:26:37.378	2017-07-06 18:26:37.378	f	admin
637	89	89	2017-07-06 18:26:37.383	2017-07-06 18:26:37.383	f	admin
638	86	b95c219b-ed1f-4b30-8431-033d74a6716f	2017-07-06 18:26:37.387	2017-07-06 18:26:37.387	f	admin
638	87	unknown	2017-07-06 18:26:37.387	2017-07-06 18:26:37.387	f	admin
638	90	A17.8	2017-07-06 18:26:37.387	2017-07-06 18:26:37.387	f	admin
638	91	YpKNWFsRj0d	2017-07-06 18:26:37.387	2017-07-06 18:26:37.387	f	admin
638	88	1945-03-25	2017-07-06 18:26:37.394	2017-07-06 18:26:37.394	f	admin
638	89	71	2017-07-06 18:26:37.394	2017-07-06 18:26:37.394	f	admin
639	86	3f223e98-2000-4b72-b545-dc33b7d60334	2017-07-06 18:26:37.398	2017-07-06 18:26:37.398	f	admin
639	87	unknown	2017-07-06 18:26:37.398	2017-07-06 18:26:37.398	f	admin
639	90	A17.0	2017-07-06 18:26:37.398	2017-07-06 18:26:37.398	f	admin
639	91	iSgRJ1dg6gm	2017-07-06 18:26:37.398	2017-07-06 18:26:37.398	f	admin
639	89	85	2017-07-06 18:26:37.404	2017-07-06 18:26:37.404	f	admin
787	86	bb225117-ae44-414f-af1d-d3d3e72203f0	2017-07-06 18:42:08.349	2017-07-06 18:42:08.349	f	admin
787	87	missing	2017-07-06 18:42:08.35	2017-07-06 18:42:08.35	f	admin
787	90	A17.-	2017-07-06 18:42:08.351	2017-07-06 18:42:08.351	f	admin
787	91	iji5Rqv5u4G	2017-07-06 18:42:08.352	2017-07-06 18:42:08.352	f	admin
787	89	56	2017-07-06 18:42:08.354	2017-07-06 18:42:08.354	f	admin
788	86	ac468995-767f-4e6a-9374-7115379bd3b2	2017-07-06 18:42:08.368	2017-07-06 18:42:08.368	f	admin
788	87	female	2017-07-06 18:42:08.369	2017-07-06 18:42:08.369	f	admin
788	90	A17.0	2017-07-06 18:42:08.37	2017-07-06 18:42:08.37	f	admin
788	91	nJB0bKLwJvx	2017-07-06 18:42:08.37	2017-07-06 18:42:08.37	f	admin
788	88	1920-01-28	2017-07-06 18:42:08.372	2017-07-06 18:42:08.372	f	admin
788	89	97	2017-07-06 18:42:08.373	2017-07-06 18:42:08.373	f	admin
789	86	b1dbdd2d-6377-419c-be7a-bc44125f6684	2017-07-06 18:42:08.374	2017-07-06 18:42:08.374	f	admin
789	87	female	2017-07-06 18:42:08.374	2017-07-06 18:42:08.374	f	admin
789	90	B05.-	2017-07-06 18:42:08.374	2017-07-06 18:42:08.374	f	admin
789	91	x4d9eBNFnQU	2017-07-06 18:42:08.374	2017-07-06 18:42:08.374	f	admin
789	89	92	2017-07-06 18:42:08.379	2017-07-06 18:42:08.379	f	admin
790	86	c9db8025-6928-4684-86b9-cf3953ac89bb	2017-07-06 18:42:08.381	2017-07-06 18:42:08.381	f	admin
790	87	female	2017-07-06 18:42:08.381	2017-07-06 18:42:08.381	f	admin
790	90	E50.-	2017-07-06 18:42:08.381	2017-07-06 18:42:08.381	f	admin
790	91	soTLqovOOTJ	2017-07-06 18:42:08.381	2017-07-06 18:42:08.381	f	admin
790	88	1998-12-04	2017-07-06 18:42:08.389	2017-07-06 18:42:08.389	f	admin
791	86	5cc767ae-cf56-434f-8281-eaddb038ac18	2017-07-06 18:42:08.391	2017-07-06 18:42:08.391	f	admin
791	87	unknown	2017-07-06 18:42:08.391	2017-07-06 18:42:08.391	f	admin
791	90	A17.8	2017-07-06 18:42:08.391	2017-07-06 18:42:08.391	f	admin
791	91	I6PqnXHKVFL	2017-07-06 18:42:08.391	2017-07-06 18:42:08.391	f	admin
791	88	2010-09-13	2017-07-06 18:42:08.394	2017-07-06 18:42:08.394	f	admin
791	89	6	2017-07-06 18:42:08.394	2017-07-06 18:42:08.394	f	admin
792	86	904784ba-47a7-40ae-ab4f-b34040dfbc1d	2017-07-06 18:42:08.396	2017-07-06 18:42:08.396	f	admin
792	87	male	2017-07-06 18:42:08.396	2017-07-06 18:42:08.396	f	admin
792	90	A17.8	2017-07-06 18:42:08.396	2017-07-06 18:42:08.396	f	admin
792	91	aU4t1iGTvtB	2017-07-06 18:42:08.396	2017-07-06 18:42:08.396	f	admin
792	88	1959-12-23	2017-07-06 18:42:08.399	2017-07-06 18:42:08.399	f	admin
792	89	57	2017-07-06 18:42:08.399	2017-07-06 18:42:08.399	f	admin
793	86	9be673f3-cd21-4c9c-a3c0-c16ade98d256	2017-07-06 18:42:08.404	2017-07-06 18:42:08.404	f	admin
793	87	male	2017-07-06 18:42:08.404	2017-07-06 18:42:08.404	f	admin
793	90	B05.-	2017-07-06 18:42:08.404	2017-07-06 18:42:08.404	f	admin
793	91	XSWEyJDfVc4	2017-07-06 18:42:08.404	2017-07-06 18:42:08.404	f	admin
793	89	79	2017-07-06 18:42:08.407	2017-07-06 18:42:08.407	f	admin
794	86	f2682bd7-535b-4edb-aca7-3f16536aca3b	2017-07-06 18:42:08.409	2017-07-06 18:42:08.409	f	admin
794	87	missing	2017-07-06 18:42:08.409	2017-07-06 18:42:08.409	f	admin
794	90	A17.0	2017-07-06 18:42:08.409	2017-07-06 18:42:08.409	f	admin
794	91	THuJaOYHYKz	2017-07-06 18:42:08.409	2017-07-06 18:42:08.409	f	admin
794	88	1949-02-05	2017-07-06 18:42:08.412	2017-07-06 18:42:08.412	f	admin
795	86	0c9300e8-6295-4a3c-91d1-34ea85bdd160	2017-07-06 18:42:08.414	2017-07-06 18:42:08.414	f	admin
795	87	male	2017-07-06 18:42:08.414	2017-07-06 18:42:08.414	f	admin
795	90	A17.0	2017-07-06 18:42:08.414	2017-07-06 18:42:08.414	f	admin
795	91	N6r8LOYqH2K	2017-07-06 18:42:08.414	2017-07-06 18:42:08.414	f	admin
795	88	1924-11-26	2017-07-06 18:42:08.417	2017-07-06 18:42:08.417	f	admin
796	86	995d00cd-0019-47b0-a539-6ef378bcfd64	2017-07-06 18:42:08.419	2017-07-06 18:42:08.419	f	admin
796	87	female	2017-07-06 18:42:08.419	2017-07-06 18:42:08.419	f	admin
796	90	A17.0	2017-07-06 18:42:08.419	2017-07-06 18:42:08.419	f	admin
796	91	Knh850oehat	2017-07-06 18:42:08.419	2017-07-06 18:42:08.419	f	admin
796	88	1975-09-25	2017-07-06 18:42:08.422	2017-07-06 18:42:08.422	f	admin
797	86	0ce9c863-1820-4bd2-93f8-1ea43a66e7da	2017-07-06 18:42:08.424	2017-07-06 18:42:08.424	f	admin
797	87	female	2017-07-06 18:42:08.424	2017-07-06 18:42:08.424	f	admin
797	90	A17.0	2017-07-06 18:42:08.424	2017-07-06 18:42:08.424	f	admin
797	91	YiJ3JuyGmnH	2017-07-06 18:42:08.424	2017-07-06 18:42:08.424	f	admin
797	89	75	2017-07-06 18:42:08.428	2017-07-06 18:42:08.428	f	admin
798	86	044f8594-a3ea-4eff-8bd7-964b92cbd24b	2017-07-06 18:42:08.429	2017-07-06 18:42:08.429	f	admin
798	87	female	2017-07-06 18:42:08.429	2017-07-06 18:42:08.429	f	admin
798	90	A17.8	2017-07-06 18:42:08.429	2017-07-06 18:42:08.429	f	admin
798	91	GTgDOPTS0Yw	2017-07-06 18:42:08.429	2017-07-06 18:42:08.429	f	admin
798	88	1921-12-08	2017-07-06 18:42:08.432	2017-07-06 18:42:08.432	f	admin
799	86	e0c930c0-6197-49b0-937a-7f0716f997ec	2017-07-06 18:42:08.434	2017-07-06 18:42:08.434	f	admin
799	87	male	2017-07-06 18:42:08.434	2017-07-06 18:42:08.434	f	admin
799	90	A17.8	2017-07-06 18:42:08.434	2017-07-06 18:42:08.434	f	admin
799	91	AcWx7hGgKFV	2017-07-06 18:42:08.434	2017-07-06 18:42:08.434	f	admin
799	88	1962-11-13	2017-07-06 18:42:08.437	2017-07-06 18:42:08.437	f	admin
800	86	d2692ff7-dad8-4e84-8cdb-aa18b86d0de3	2017-07-06 18:42:08.44	2017-07-06 18:42:08.44	f	admin
800	87	male	2017-07-06 18:42:08.44	2017-07-06 18:42:08.44	f	admin
800	90	E50.-	2017-07-06 18:42:08.44	2017-07-06 18:42:08.44	f	admin
800	91	hY7AAATZ1pN	2017-07-06 18:42:08.44	2017-07-06 18:42:08.44	f	admin
800	89	25	2017-07-06 18:42:08.444	2017-07-06 18:42:08.444	f	admin
801	86	2b6d7730-ac38-4806-93ef-97454b994a1a	2017-07-06 18:42:08.446	2017-07-06 18:42:08.446	f	admin
801	87	male	2017-07-06 18:42:08.446	2017-07-06 18:42:08.446	f	admin
801	90	A17.1	2017-07-06 18:42:08.446	2017-07-06 18:42:08.446	f	admin
801	91	O3EUvTkv5mp	2017-07-06 18:42:08.446	2017-07-06 18:42:08.446	f	admin
801	88	2004-11-15	2017-07-06 18:42:08.45	2017-07-06 18:42:08.45	f	admin
802	86	82bcc56e-0351-4d13-8350-867bb5898647	2017-07-06 18:42:08.451	2017-07-06 18:42:08.451	f	admin
802	87	female	2017-07-06 18:42:08.451	2017-07-06 18:42:08.451	f	admin
802	90	A17.-	2017-07-06 18:42:08.451	2017-07-06 18:42:08.451	f	admin
802	91	VDbeGLoVIJL	2017-07-06 18:42:08.451	2017-07-06 18:42:08.451	f	admin
802	89	13	2017-07-06 18:42:08.454	2017-07-06 18:42:08.454	f	admin
803	86	ba17654e-4763-4ab9-995d-d950be8c5a60	2017-07-06 18:42:08.456	2017-07-06 18:42:08.456	f	admin
803	87	female	2017-07-06 18:42:08.456	2017-07-06 18:42:08.456	f	admin
803	90	A17.1	2017-07-06 18:42:08.456	2017-07-06 18:42:08.456	f	admin
803	91	kC4Vigw3xYF	2017-07-06 18:42:08.456	2017-07-06 18:42:08.456	f	admin
803	88	1931-01-01	2017-07-06 18:42:08.459	2017-07-06 18:42:08.459	f	admin
803	89	86	2017-07-06 18:42:08.46	2017-07-06 18:42:08.46	f	admin
804	86	519971db-0065-4778-b96a-37db81c9cea9	2017-07-06 18:42:08.462	2017-07-06 18:42:08.462	f	admin
804	87	male	2017-07-06 18:42:08.462	2017-07-06 18:42:08.462	f	admin
804	90	A17.0	2017-07-06 18:42:08.462	2017-07-06 18:42:08.462	f	admin
804	91	LS4KTaPmGM6	2017-07-06 18:42:08.462	2017-07-06 18:42:08.462	f	admin
804	89	47	2017-07-06 18:42:08.465	2017-07-06 18:42:08.465	f	admin
805	86	abccd442-64f7-4e3f-b9f9-3193a64183d7	2017-07-06 18:42:08.467	2017-07-06 18:42:08.467	f	admin
805	87	female	2017-07-06 18:42:08.467	2017-07-06 18:42:08.467	f	admin
805	90	B20.-	2017-07-06 18:42:08.467	2017-07-06 18:42:08.467	f	admin
805	91	skMgbJfjLRI	2017-07-06 18:42:08.467	2017-07-06 18:42:08.467	f	admin
805	89	46	2017-07-06 18:42:08.47	2017-07-06 18:42:08.47	f	admin
806	86	f84e3fbc-cd01-40fb-a407-b8a83f453590	2017-07-06 18:42:08.472	2017-07-06 18:42:08.472	f	admin
806	87	unknown	2017-07-06 18:42:08.472	2017-07-06 18:42:08.472	f	admin
806	90	A17.1	2017-07-06 18:42:08.472	2017-07-06 18:42:08.472	f	admin
806	91	Cih9k2TMpxr	2017-07-06 18:42:08.472	2017-07-06 18:42:08.472	f	admin
806	89	58	2017-07-06 18:42:08.475	2017-07-06 18:42:08.475	f	admin
807	86	f1485f59-ebf6-4d99-af8b-19ab55173a0f	2017-07-06 18:42:08.477	2017-07-06 18:42:08.477	f	admin
807	87	male	2017-07-06 18:42:08.477	2017-07-06 18:42:08.477	f	admin
807	90	A17.1	2017-07-06 18:42:08.477	2017-07-06 18:42:08.477	f	admin
807	91	TfT2j3qoxoM	2017-07-06 18:42:08.477	2017-07-06 18:42:08.477	f	admin
807	88	1921-11-25	2017-07-06 18:42:08.48	2017-07-06 18:42:08.48	f	admin
807	89	94	2017-07-06 18:42:08.48	2017-07-06 18:42:08.48	f	admin
808	86	92236161-01fc-4ee5-940c-8edd8ce593ce	2017-07-06 18:42:08.482	2017-07-06 18:42:08.482	f	admin
808	87	female	2017-07-06 18:42:08.482	2017-07-06 18:42:08.482	f	admin
808	90	E50.-	2017-07-06 18:42:08.482	2017-07-06 18:42:08.482	f	admin
808	91	AreyNz0OAoe	2017-07-06 18:42:08.482	2017-07-06 18:42:08.482	f	admin
808	89	83	2017-07-06 18:42:08.486	2017-07-06 18:42:08.486	f	admin
809	86	d32997a1-d3d9-4ac0-aa1c-ab504ac994d8	2017-07-06 18:42:08.488	2017-07-06 18:42:08.488	f	admin
809	87	female	2017-07-06 18:42:08.488	2017-07-06 18:42:08.488	f	admin
809	90	A17.0	2017-07-06 18:42:08.488	2017-07-06 18:42:08.488	f	admin
809	91	zZRcvl213dS	2017-07-06 18:42:08.488	2017-07-06 18:42:08.488	f	admin
809	88	1933-09-22	2017-07-06 18:42:08.491	2017-07-06 18:42:08.491	f	admin
809	89	82	2017-07-06 18:42:08.491	2017-07-06 18:42:08.491	f	admin
810	86	7eb557cc-4853-4e54-87b0-4569c38d64b5	2017-07-06 18:42:08.493	2017-07-06 18:42:08.493	f	admin
810	87	female	2017-07-06 18:42:08.493	2017-07-06 18:42:08.493	f	admin
810	90	E50.-	2017-07-06 18:42:08.493	2017-07-06 18:42:08.493	f	admin
810	91	WO0GcJCPgkx	2017-07-06 18:42:08.493	2017-07-06 18:42:08.493	f	admin
810	88	1960-12-25	2017-07-06 18:42:08.496	2017-07-06 18:42:08.496	f	admin
811	86	3a5dfdab-84b5-490b-9027-ccc7dd94153c	2017-07-06 18:42:08.499	2017-07-06 18:42:08.499	f	admin
811	87	male	2017-07-06 18:42:08.499	2017-07-06 18:42:08.499	f	admin
811	90	A17.0	2017-07-06 18:42:08.499	2017-07-06 18:42:08.499	f	admin
811	91	DJp3nMb7d0K	2017-07-06 18:42:08.499	2017-07-06 18:42:08.499	f	admin
811	88	1953-05-10	2017-07-06 18:42:08.503	2017-07-06 18:42:08.503	f	admin
811	89	63	2017-07-06 18:42:08.503	2017-07-06 18:42:08.503	f	admin
812	86	57e67145-5414-4d3c-9c4d-5ea42533fbb0	2017-07-06 18:42:08.505	2017-07-06 18:42:08.505	f	admin
812	87	male	2017-07-06 18:42:08.505	2017-07-06 18:42:08.505	f	admin
812	90	A17.8	2017-07-06 18:42:08.505	2017-07-06 18:42:08.505	f	admin
812	91	AvDsIWwe7CR	2017-07-06 18:42:08.505	2017-07-06 18:42:08.505	f	admin
812	88	2009-06-06	2017-07-06 18:42:08.509	2017-07-06 18:42:08.509	f	admin
813	86	291b98eb-cc53-4502-9351-06c1851de59c	2017-07-06 18:42:08.511	2017-07-06 18:42:08.511	f	admin
813	87	female	2017-07-06 18:42:08.511	2017-07-06 18:42:08.511	f	admin
813	90	A17.8	2017-07-06 18:42:08.511	2017-07-06 18:42:08.511	f	admin
813	91	M9CWVAXPe0K	2017-07-06 18:42:08.511	2017-07-06 18:42:08.511	f	admin
813	88	1998-04-07	2017-07-06 18:42:08.515	2017-07-06 18:42:08.515	f	admin
814	86	43758cc5-8e73-415a-ac92-5c17c149a19a	2017-07-06 18:42:08.518	2017-07-06 18:42:08.518	f	admin
814	87	female	2017-07-06 18:42:08.518	2017-07-06 18:42:08.518	f	admin
814	90	A17.1	2017-07-06 18:42:08.518	2017-07-06 18:42:08.518	f	admin
814	91	DCaYGtlLKGw	2017-07-06 18:42:08.518	2017-07-06 18:42:08.518	f	admin
814	88	1916-05-03	2017-07-06 18:42:08.521	2017-07-06 18:42:08.521	f	admin
814	89	100	2017-07-06 18:42:08.521	2017-07-06 18:42:08.521	f	admin
815	86	e20fdb6a-c3f8-4334-8424-4dbd60cd2cec	2017-07-06 18:42:08.523	2017-07-06 18:42:08.523	f	admin
815	87	female	2017-07-06 18:42:08.523	2017-07-06 18:42:08.523	f	admin
815	90	A17.-	2017-07-06 18:42:08.523	2017-07-06 18:42:08.523	f	admin
815	91	OZsm3009RSJ	2017-07-06 18:42:08.523	2017-07-06 18:42:08.523	f	admin
815	88	1929-06-16	2017-07-06 18:42:08.526	2017-07-06 18:42:08.526	f	admin
816	86	7a403ca3-2395-45db-93aa-415c60794130	2017-07-06 18:42:08.528	2017-07-06 18:42:08.528	f	admin
816	87	female	2017-07-06 18:42:08.528	2017-07-06 18:42:08.528	f	admin
816	90	A17.1	2017-07-06 18:42:08.528	2017-07-06 18:42:08.528	f	admin
816	91	fgVSCoG3uDk	2017-07-06 18:42:08.528	2017-07-06 18:42:08.528	f	admin
816	88	1924-07-14	2017-07-06 18:42:08.539	2017-07-06 18:42:08.539	f	admin
817	86	8f13adee-014a-4962-b670-fdbf9a2e3902	2017-07-06 18:42:08.542	2017-07-06 18:42:08.542	f	admin
817	87	female	2017-07-06 18:42:08.542	2017-07-06 18:42:08.542	f	admin
817	90	B20.-	2017-07-06 18:42:08.542	2017-07-06 18:42:08.542	f	admin
817	91	T75L3sLnvdx	2017-07-06 18:42:08.542	2017-07-06 18:42:08.542	f	admin
817	89	34	2017-07-06 18:42:08.545	2017-07-06 18:42:08.545	f	admin
818	86	de528f12-89b6-400d-a831-582cbe245fb2	2017-07-06 18:42:08.547	2017-07-06 18:42:08.547	f	admin
818	87	male	2017-07-06 18:42:08.547	2017-07-06 18:42:08.547	f	admin
818	90	B20.-	2017-07-06 18:42:08.547	2017-07-06 18:42:08.547	f	admin
818	91	zah4sLzGWdV	2017-07-06 18:42:08.547	2017-07-06 18:42:08.547	f	admin
818	88	2009-04-07	2017-07-06 18:42:08.551	2017-07-06 18:42:08.551	f	admin
818	89	7	2017-07-06 18:42:08.551	2017-07-06 18:42:08.551	f	admin
819	86	33dd4ad6-c8f0-4e1e-bde0-ef9ebb569750	2017-07-06 18:42:08.553	2017-07-06 18:42:08.553	f	admin
819	87	male	2017-07-06 18:42:08.553	2017-07-06 18:42:08.553	f	admin
819	90	A17.-	2017-07-06 18:42:08.553	2017-07-06 18:42:08.553	f	admin
819	91	z4Z89X5ampv	2017-07-06 18:42:08.553	2017-07-06 18:42:08.553	f	admin
819	88	1998-05-05	2017-07-06 18:42:08.556	2017-07-06 18:42:08.556	f	admin
819	89	18	2017-07-06 18:42:08.556	2017-07-06 18:42:08.556	f	admin
820	86	7c60440b-f85b-410c-9783-79ad6ae2127d	2017-07-06 18:42:08.559	2017-07-06 18:42:08.559	f	admin
820	87	male	2017-07-06 18:42:08.559	2017-07-06 18:42:08.559	f	admin
820	90	A17.0	2017-07-06 18:42:08.559	2017-07-06 18:42:08.559	f	admin
820	91	SmA6762G3AL	2017-07-06 18:42:08.559	2017-07-06 18:42:08.559	f	admin
820	88	1930-08-10	2017-07-06 18:42:08.562	2017-07-06 18:42:08.562	f	admin
820	89	86	2017-07-06 18:42:08.562	2017-07-06 18:42:08.562	f	admin
821	86	ad5709ca-a77f-4a98-bc8c-ea67a2e2725a	2017-07-06 18:42:08.565	2017-07-06 18:42:08.565	f	admin
821	87	male	2017-07-06 18:42:08.565	2017-07-06 18:42:08.565	f	admin
821	90	A17.0	2017-07-06 18:42:08.565	2017-07-06 18:42:08.565	f	admin
821	91	OKjQGoVbufI	2017-07-06 18:42:08.565	2017-07-06 18:42:08.565	f	admin
821	89	62	2017-07-06 18:42:08.568	2017-07-06 18:42:08.568	f	admin
822	86	4e50fd17-bac6-4cc7-945e-e6f317b6ac46	2017-07-06 18:42:08.571	2017-07-06 18:42:08.571	f	admin
822	87	male	2017-07-06 18:42:08.571	2017-07-06 18:42:08.571	f	admin
822	90	B20.-	2017-07-06 18:42:08.571	2017-07-06 18:42:08.571	f	admin
822	91	Ip5sem36vw7	2017-07-06 18:42:08.571	2017-07-06 18:42:08.571	f	admin
822	88	1981-01-17	2017-07-06 18:42:08.575	2017-07-06 18:42:08.575	f	admin
823	86	5ceac502-d7d9-460d-bc04-e8134e9dc206	2017-07-06 18:42:08.577	2017-07-06 18:42:08.577	f	admin
823	87	male	2017-07-06 18:42:08.577	2017-07-06 18:42:08.577	f	admin
823	90	B20.-	2017-07-06 18:42:08.577	2017-07-06 18:42:08.577	f	admin
823	91	ohlrqDhnvdq	2017-07-06 18:42:08.577	2017-07-06 18:42:08.577	f	admin
823	88	1918-08-31	2017-07-06 18:42:08.581	2017-07-06 18:42:08.581	f	admin
824	86	8ca1089c-475a-4053-90b6-4e62780219eb	2017-07-06 18:42:08.583	2017-07-06 18:42:08.583	f	admin
824	87	male	2017-07-06 18:42:08.583	2017-07-06 18:42:08.583	f	admin
824	90	E50.-	2017-07-06 18:42:08.583	2017-07-06 18:42:08.583	f	admin
824	91	vNMpFBOhtXX	2017-07-06 18:42:08.583	2017-07-06 18:42:08.583	f	admin
824	88	1925-05-22	2017-07-06 18:42:08.586	2017-07-06 18:42:08.586	f	admin
825	86	5fee6ac6-d6a3-4dc3-af2a-6639ef853c6c	2017-07-06 18:42:08.589	2017-07-06 18:42:08.589	f	admin
825	87	unknown	2017-07-06 18:42:08.589	2017-07-06 18:42:08.589	f	admin
825	90	A17.1	2017-07-06 18:42:08.589	2017-07-06 18:42:08.589	f	admin
825	91	hx6FB0bfEGT	2017-07-06 18:42:08.589	2017-07-06 18:42:08.589	f	admin
825	89	45	2017-07-06 18:42:08.592	2017-07-06 18:42:08.592	f	admin
826	86	12d983ac-e4b3-4481-b501-84308c5553cd	2017-07-06 18:42:08.595	2017-07-06 18:42:08.595	f	admin
826	87	female	2017-07-06 18:42:08.595	2017-07-06 18:42:08.595	f	admin
826	90	E50.-	2017-07-06 18:42:08.595	2017-07-06 18:42:08.595	f	admin
826	91	Ko6sKqrppSn	2017-07-06 18:42:08.595	2017-07-06 18:42:08.595	f	admin
826	89	38	2017-07-06 18:42:08.598	2017-07-06 18:42:08.598	f	admin
827	86	c644032b-6c0f-4ea3-9d2e-14aff9ee42fd	2017-07-06 18:42:08.601	2017-07-06 18:42:08.601	f	admin
827	87	female	2017-07-06 18:42:08.601	2017-07-06 18:42:08.601	f	admin
827	90	B20.-	2017-07-06 18:42:08.601	2017-07-06 18:42:08.601	f	admin
827	91	dWlmkxY7sLS	2017-07-06 18:42:08.601	2017-07-06 18:42:08.601	f	admin
827	88	2016-10-17	2017-07-06 18:42:08.604	2017-07-06 18:42:08.604	f	admin
827	89	0	2017-07-06 18:42:08.604	2017-07-06 18:42:08.604	f	admin
828	86	7657eaad-743b-4b21-a62c-a56b1fe86e11	2017-07-06 18:42:08.607	2017-07-06 18:42:08.607	f	admin
828	87	female	2017-07-06 18:42:08.607	2017-07-06 18:42:08.607	f	admin
828	90	A17.-	2017-07-06 18:42:08.607	2017-07-06 18:42:08.607	f	admin
828	91	RQXuDoeybw9	2017-07-06 18:42:08.607	2017-07-06 18:42:08.607	f	admin
828	89	26	2017-07-06 18:42:08.611	2017-07-06 18:42:08.611	f	admin
829	86	3187f9f4-ea3a-4b99-9281-25b952c4d780	2017-07-06 18:42:08.614	2017-07-06 18:42:08.614	f	admin
829	87	male	2017-07-06 18:42:08.614	2017-07-06 18:42:08.614	f	admin
829	90	A17.1	2017-07-06 18:42:08.614	2017-07-06 18:42:08.614	f	admin
829	91	LNqTFtK6rPK	2017-07-06 18:42:08.614	2017-07-06 18:42:08.614	f	admin
829	88	1949-12-28	2017-07-06 18:42:08.617	2017-07-06 18:42:08.617	f	admin
829	89	67	2017-07-06 18:42:08.617	2017-07-06 18:42:08.617	f	admin
830	86	a5bbd466-a660-485a-b143-2bd92fa7212f	2017-07-06 18:42:08.62	2017-07-06 18:42:08.62	f	admin
830	87	female	2017-07-06 18:42:08.62	2017-07-06 18:42:08.62	f	admin
830	90	A17.1	2017-07-06 18:42:08.62	2017-07-06 18:42:08.62	f	admin
830	91	a6zyzEmGdHq	2017-07-06 18:42:08.62	2017-07-06 18:42:08.62	f	admin
830	89	85	2017-07-06 18:42:08.625	2017-07-06 18:42:08.625	f	admin
831	86	9874a7c2-070e-4949-b100-5e477909130d	2017-07-06 18:42:08.628	2017-07-06 18:42:08.628	f	admin
831	87	female	2017-07-06 18:42:08.628	2017-07-06 18:42:08.628	f	admin
831	90	A17.1	2017-07-06 18:42:08.628	2017-07-06 18:42:08.628	f	admin
831	91	OFFep886Y4Q	2017-07-06 18:42:08.628	2017-07-06 18:42:08.628	f	admin
831	88	1952-02-20	2017-07-06 18:42:08.631	2017-07-06 18:42:08.631	f	admin
832	86	2672e1b5-d867-4fd0-9604-6ae2af857487	2017-07-06 18:42:08.634	2017-07-06 18:42:08.634	f	admin
832	87	male	2017-07-06 18:42:08.634	2017-07-06 18:42:08.634	f	admin
832	90	A17.-	2017-07-06 18:42:08.634	2017-07-06 18:42:08.634	f	admin
832	91	meiFCp9taRh	2017-07-06 18:42:08.634	2017-07-06 18:42:08.634	f	admin
832	89	38	2017-07-06 18:42:08.638	2017-07-06 18:42:08.638	f	admin
833	86	9f603cc4-bea9-422e-9de2-d687ec6380b8	2017-07-06 18:42:08.641	2017-07-06 18:42:08.641	f	admin
833	87	female	2017-07-06 18:42:08.641	2017-07-06 18:42:08.641	f	admin
833	90	A17.8	2017-07-06 18:42:08.641	2017-07-06 18:42:08.641	f	admin
833	91	BRinpSCTTui	2017-07-06 18:42:08.641	2017-07-06 18:42:08.641	f	admin
833	88	1968-02-10	2017-07-06 18:42:08.644	2017-07-06 18:42:08.644	f	admin
834	86	de77312b-b56d-4b8b-84ae-57e68733db84	2017-07-06 18:42:08.647	2017-07-06 18:42:08.647	f	admin
834	87	female	2017-07-06 18:42:08.647	2017-07-06 18:42:08.647	f	admin
834	90	A17.0	2017-07-06 18:42:08.647	2017-07-06 18:42:08.647	f	admin
834	91	swx7myqnn11	2017-07-06 18:42:08.647	2017-07-06 18:42:08.647	f	admin
834	89	4	2017-07-06 18:42:08.651	2017-07-06 18:42:08.651	f	admin
835	86	48e9a1d7-630c-4a2e-952d-764da93c1e13	2017-07-06 18:42:08.653	2017-07-06 18:42:08.653	f	admin
835	87	male	2017-07-06 18:42:08.653	2017-07-06 18:42:08.653	f	admin
835	90	B20.-	2017-07-06 18:42:08.653	2017-07-06 18:42:08.653	f	admin
835	91	ShH98xMd8ft	2017-07-06 18:42:08.653	2017-07-06 18:42:08.653	f	admin
835	89	79	2017-07-06 18:42:08.657	2017-07-06 18:42:08.657	f	admin
836	86	9bb14aad-e544-4a73-a04e-cc2a2161da87	2017-07-06 18:42:08.66	2017-07-06 18:42:08.66	f	admin
836	87	male	2017-07-06 18:42:08.66	2017-07-06 18:42:08.66	f	admin
836	90	A17.8	2017-07-06 18:42:08.66	2017-07-06 18:42:08.66	f	admin
836	91	pvYwTEs0ZXq	2017-07-06 18:42:08.66	2017-07-06 18:42:08.66	f	admin
836	89	30	2017-07-06 18:42:08.664	2017-07-06 18:42:08.664	f	admin
837	86	06dd30f5-cec0-4652-8463-9c7201207b4f	2017-07-06 18:42:08.667	2017-07-06 18:42:08.667	f	admin
837	87	male	2017-07-06 18:42:08.667	2017-07-06 18:42:08.667	f	admin
837	90	A17.1	2017-07-06 18:42:08.667	2017-07-06 18:42:08.667	f	admin
837	91	q3PJwqFPPuL	2017-07-06 18:42:08.667	2017-07-06 18:42:08.667	f	admin
837	88	1945-11-26	2017-07-06 18:42:08.675	2017-07-06 18:42:08.675	f	admin
838	86	821af3be-6662-4881-b525-bfd3c43a8396	2017-07-06 18:42:08.686	2017-07-06 18:42:08.686	f	admin
838	87	male	2017-07-06 18:42:08.687	2017-07-06 18:42:08.687	f	admin
838	90	A17.1	2017-07-06 18:42:08.687	2017-07-06 18:42:08.687	f	admin
838	91	zuzbd8kps44	2017-07-06 18:42:08.688	2017-07-06 18:42:08.688	f	admin
838	88	1916-12-23	2017-07-06 18:42:08.69	2017-07-06 18:42:08.69	f	admin
839	86	7aedf611-fb84-48de-8a02-36945bcceaec	2017-07-06 18:42:08.692	2017-07-06 18:42:08.692	f	admin
839	87	female	2017-07-06 18:42:08.692	2017-07-06 18:42:08.692	f	admin
839	90	A17.8	2017-07-06 18:42:08.692	2017-07-06 18:42:08.692	f	admin
839	91	FsDz9NOx0MJ	2017-07-06 18:42:08.692	2017-07-06 18:42:08.692	f	admin
839	88	1980-07-17	2017-07-06 18:42:08.695	2017-07-06 18:42:08.696	f	admin
840	86	c311692a-3833-44cb-840d-de89aa63e2c6	2017-07-06 18:42:08.704	2017-07-06 18:42:08.704	f	admin
840	87	male	2017-07-06 18:42:08.704	2017-07-06 18:42:08.704	f	admin
840	90	B05.-	2017-07-06 18:42:08.704	2017-07-06 18:42:08.704	f	admin
840	91	ngCQIJdTdUx	2017-07-06 18:42:08.704	2017-07-06 18:42:08.704	f	admin
840	89	54	2017-07-06 18:42:08.709	2017-07-06 18:42:08.709	f	admin
841	86	27beccf1-9af7-4797-bfab-1ae4de5ea2da	2017-07-06 18:42:08.719	2017-07-06 18:42:08.719	f	admin
841	87	male	2017-07-06 18:42:08.719	2017-07-06 18:42:08.719	f	admin
841	90	A17.0	2017-07-06 18:42:08.719	2017-07-06 18:42:08.719	f	admin
841	91	C3ttgiBpGLt	2017-07-06 18:42:08.719	2017-07-06 18:42:08.719	f	admin
841	88	2013-08-21	2017-07-06 18:42:08.721	2017-07-06 18:42:08.721	f	admin
841	89	2	2017-07-06 18:42:08.721	2017-07-06 18:42:08.721	f	admin
842	86	60b73fab-f0b5-4480-9afc-68ea6143c713	2017-07-06 18:42:08.723	2017-07-06 18:42:08.723	f	admin
842	87	unknown	2017-07-06 18:42:08.723	2017-07-06 18:42:08.723	f	admin
842	90	A17.0	2017-07-06 18:42:08.723	2017-07-06 18:42:08.723	f	admin
842	91	ohSrk2k5iYk	2017-07-06 18:42:08.723	2017-07-06 18:42:08.723	f	admin
842	88	1939-12-13	2017-07-06 18:42:08.727	2017-07-06 18:42:08.727	f	admin
843	86	4729c859-8e75-4c7f-a247-bae4551cc0a6	2017-07-06 18:42:08.729	2017-07-06 18:42:08.729	f	admin
843	87	female	2017-07-06 18:42:08.729	2017-07-06 18:42:08.729	f	admin
843	90	B20.-	2017-07-06 18:42:08.729	2017-07-06 18:42:08.729	f	admin
843	91	SLwqT6639M0	2017-07-06 18:42:08.729	2017-07-06 18:42:08.729	f	admin
843	88	1937-01-15	2017-07-06 18:42:08.732	2017-07-06 18:42:08.732	f	admin
844	86	18307617-9e6b-40f5-82cd-496342ad5228	2017-07-06 18:42:08.733	2017-07-06 18:42:08.733	f	admin
844	87	male	2017-07-06 18:42:08.733	2017-07-06 18:42:08.733	f	admin
844	90	A17.1	2017-07-06 18:42:08.733	2017-07-06 18:42:08.733	f	admin
844	91	n3u2KWoQd7d	2017-07-06 18:42:08.733	2017-07-06 18:42:08.733	f	admin
844	88	1944-04-17	2017-07-06 18:42:08.736	2017-07-06 18:42:08.736	f	admin
844	89	72	2017-07-06 18:42:08.736	2017-07-06 18:42:08.736	f	admin
845	86	16d2ff67-33f4-4a1b-95c1-f8f7d28e23df	2017-07-06 18:42:08.738	2017-07-06 18:42:08.738	f	admin
845	87	missing	2017-07-06 18:42:08.738	2017-07-06 18:42:08.738	f	admin
845	90	A17.0	2017-07-06 18:42:08.738	2017-07-06 18:42:08.738	f	admin
845	91	n4Dsm6LCnG1	2017-07-06 18:42:08.738	2017-07-06 18:42:08.738	f	admin
845	89	47	2017-07-06 18:42:08.741	2017-07-06 18:42:08.741	f	admin
846	86	e393f598-8dcc-4705-961b-09f662cd8ff1	2017-07-06 18:42:08.743	2017-07-06 18:42:08.743	f	admin
846	87	male	2017-07-06 18:42:08.743	2017-07-06 18:42:08.743	f	admin
846	90	B05.-	2017-07-06 18:42:08.743	2017-07-06 18:42:08.743	f	admin
846	91	wF3WUXP79Am	2017-07-06 18:42:08.743	2017-07-06 18:42:08.743	f	admin
846	88	1936-11-19	2017-07-06 18:42:08.746	2017-07-06 18:42:08.746	f	admin
847	86	faab3552-a8ba-43f1-87af-9caa96ed4492	2017-07-06 18:42:08.747	2017-07-06 18:42:08.747	f	admin
847	87	female	2017-07-06 18:42:08.747	2017-07-06 18:42:08.747	f	admin
847	90	B20.-	2017-07-06 18:42:08.747	2017-07-06 18:42:08.747	f	admin
847	91	nR9eCbKm0Cq	2017-07-06 18:42:08.747	2017-07-06 18:42:08.747	f	admin
847	88	1980-12-14	2017-07-06 18:42:08.75	2017-07-06 18:42:08.75	f	admin
847	89	36	2017-07-06 18:42:08.75	2017-07-06 18:42:08.75	f	admin
848	86	c8879b39-326d-4a8b-acb3-a06e406317ae	2017-07-06 18:42:08.752	2017-07-06 18:42:08.752	f	admin
848	87	male	2017-07-06 18:42:08.752	2017-07-06 18:42:08.752	f	admin
848	90	B05.-	2017-07-06 18:42:08.752	2017-07-06 18:42:08.752	f	admin
848	91	V04lda1BQtE	2017-07-06 18:42:08.752	2017-07-06 18:42:08.752	f	admin
848	88	1982-04-22	2017-07-06 18:42:08.755	2017-07-06 18:42:08.755	f	admin
848	89	33	2017-07-06 18:42:08.755	2017-07-06 18:42:08.755	f	admin
849	86	d51c7844-ecec-4b06-870f-db66b7680b95	2017-07-06 18:42:08.757	2017-07-06 18:42:08.757	f	admin
849	87	male	2017-07-06 18:42:08.757	2017-07-06 18:42:08.757	f	admin
849	90	B20.-	2017-07-06 18:42:08.757	2017-07-06 18:42:08.757	f	admin
849	91	etVK8S5vg9V	2017-07-06 18:42:08.757	2017-07-06 18:42:08.757	f	admin
849	89	34	2017-07-06 18:42:08.761	2017-07-06 18:42:08.761	f	admin
850	86	3a819828-45d0-4157-b700-61c9df3fd0de	2017-07-06 18:42:08.763	2017-07-06 18:42:08.763	f	admin
850	87	male	2017-07-06 18:42:08.763	2017-07-06 18:42:08.763	f	admin
850	90	E50.-	2017-07-06 18:42:08.763	2017-07-06 18:42:08.763	f	admin
850	91	barwJIW1c3l	2017-07-06 18:42:08.763	2017-07-06 18:42:08.763	f	admin
850	89	100	2017-07-06 18:42:08.767	2017-07-06 18:42:08.767	f	admin
851	86	cb6e1720-91a6-4ebb-960b-f14119ba2fb2	2017-07-06 18:42:08.768	2017-07-06 18:42:08.768	f	admin
851	87	unknown	2017-07-06 18:42:08.768	2017-07-06 18:42:08.768	f	admin
851	90	A17.0	2017-07-06 18:42:08.768	2017-07-06 18:42:08.768	f	admin
851	91	k72LZ0tiJ4e	2017-07-06 18:42:08.768	2017-07-06 18:42:08.768	f	admin
851	89	87	2017-07-06 18:42:08.772	2017-07-06 18:42:08.772	f	admin
852	86	bb77f21c-0ab6-410e-9805-c6bf661bf902	2017-07-06 18:42:08.774	2017-07-06 18:42:08.774	f	admin
852	87	missing	2017-07-06 18:42:08.774	2017-07-06 18:42:08.774	f	admin
852	90	B20.-	2017-07-06 18:42:08.774	2017-07-06 18:42:08.774	f	admin
852	91	TVS4lcT2or2	2017-07-06 18:42:08.774	2017-07-06 18:42:08.774	f	admin
852	88	1950-06-18	2017-07-06 18:42:08.777	2017-07-06 18:42:08.777	f	admin
852	89	66	2017-07-06 18:42:08.777	2017-07-06 18:42:08.777	f	admin
853	86	6df26443-3d8a-43e1-b42e-8c9f3c761bd2	2017-07-06 18:42:08.783	2017-07-06 18:42:08.783	f	admin
853	87	missing	2017-07-06 18:42:08.783	2017-07-06 18:42:08.783	f	admin
853	90	A17.8	2017-07-06 18:42:08.783	2017-07-06 18:42:08.783	f	admin
853	91	WWPDwoCoXDG	2017-07-06 18:42:08.783	2017-07-06 18:42:08.783	f	admin
853	88	1953-04-01	2017-07-06 18:42:08.787	2017-07-06 18:42:08.787	f	admin
853	89	63	2017-07-06 18:42:08.787	2017-07-06 18:42:08.787	f	admin
854	86	3994072f-1dd1-4de6-9a24-4faf028a0eb3	2017-07-06 18:42:08.789	2017-07-06 18:42:08.789	f	admin
854	87	unknown	2017-07-06 18:42:08.79	2017-07-06 18:42:08.79	f	admin
854	90	A17.0	2017-07-06 18:42:08.79	2017-07-06 18:42:08.79	f	admin
854	91	d3zM4LmRvNT	2017-07-06 18:42:08.79	2017-07-06 18:42:08.79	f	admin
854	88	1919-09-29	2017-07-06 18:42:08.793	2017-07-06 18:42:08.793	f	admin
854	89	97	2017-07-06 18:42:08.793	2017-07-06 18:42:08.793	f	admin
855	86	5ccc2ec8-b5d5-4b80-b99c-16e110ba98e8	2017-07-06 18:42:08.795	2017-07-06 18:42:08.795	f	admin
855	87	female	2017-07-06 18:42:08.795	2017-07-06 18:42:08.795	f	admin
855	90	A17.0	2017-07-06 18:42:08.795	2017-07-06 18:42:08.795	f	admin
855	91	ugDv8L0Q3Bu	2017-07-06 18:42:08.795	2017-07-06 18:42:08.795	f	admin
855	89	57	2017-07-06 18:42:08.798	2017-07-06 18:42:08.798	f	admin
856	86	c704c3a4-b71c-4991-b25b-a56e4d11dd8d	2017-07-06 18:42:08.8	2017-07-06 18:42:08.8	f	admin
856	87	male	2017-07-06 18:42:08.8	2017-07-06 18:42:08.8	f	admin
856	90	B05.-	2017-07-06 18:42:08.8	2017-07-06 18:42:08.8	f	admin
856	91	Gmd0ALXZleE	2017-07-06 18:42:08.8	2017-07-06 18:42:08.8	f	admin
856	88	1973-08-10	2017-07-06 18:42:08.803	2017-07-06 18:42:08.803	f	admin
857	86	6c3afbf1-4e64-42ea-82fb-d0f10aa942d2	2017-07-06 18:42:08.806	2017-07-06 18:42:08.806	f	admin
857	87	missing	2017-07-06 18:42:08.806	2017-07-06 18:42:08.806	f	admin
857	90	E50.-	2017-07-06 18:42:08.806	2017-07-06 18:42:08.806	f	admin
857	91	mAB6rYDvDy0	2017-07-06 18:42:08.806	2017-07-06 18:42:08.806	f	admin
857	88	1995-02-02	2017-07-06 18:42:08.81	2017-07-06 18:42:08.81	f	admin
857	89	22	2017-07-06 18:42:08.81	2017-07-06 18:42:08.81	f	admin
858	86	42b136c9-f18e-4fcf-927f-b2d7e2aa4675	2017-07-06 18:42:08.813	2017-07-06 18:42:08.813	f	admin
858	87	female	2017-07-06 18:42:08.813	2017-07-06 18:42:08.813	f	admin
858	90	A17.8	2017-07-06 18:42:08.813	2017-07-06 18:42:08.813	f	admin
858	91	Jw53AJZrVAC	2017-07-06 18:42:08.813	2017-07-06 18:42:08.813	f	admin
858	89	13	2017-07-06 18:42:08.816	2017-07-06 18:42:08.816	f	admin
859	86	8d30bc43-16e2-45b8-96fa-570b50fbd4cf	2017-07-06 18:42:08.819	2017-07-06 18:42:08.819	f	admin
859	87	male	2017-07-06 18:42:08.819	2017-07-06 18:42:08.819	f	admin
859	90	A17.0	2017-07-06 18:42:08.819	2017-07-06 18:42:08.819	f	admin
859	91	CdiMS4tR8Hq	2017-07-06 18:42:08.819	2017-07-06 18:42:08.819	f	admin
859	88	2006-09-19	2017-07-06 18:42:08.823	2017-07-06 18:42:08.823	f	admin
860	86	8b9d65c8-faac-45a6-98bc-923fd6dca78d	2017-07-06 18:42:08.826	2017-07-06 18:42:08.826	f	admin
860	87	female	2017-07-06 18:42:08.826	2017-07-06 18:42:08.826	f	admin
860	90	A17.-	2017-07-06 18:42:08.826	2017-07-06 18:42:08.826	f	admin
860	91	ELsWsmidbMt	2017-07-06 18:42:08.826	2017-07-06 18:42:08.826	f	admin
860	88	1927-08-14	2017-07-06 18:42:08.83	2017-07-06 18:42:08.83	f	admin
860	89	88	2017-07-06 18:42:08.83	2017-07-06 18:42:08.83	f	admin
861	86	1463821f-2624-4c01-8e12-a47036e70d17	2017-07-06 18:42:08.832	2017-07-06 18:42:08.832	f	admin
861	87	male	2017-07-06 18:42:08.832	2017-07-06 18:42:08.832	f	admin
861	90	A17.1	2017-07-06 18:42:08.832	2017-07-06 18:42:08.832	f	admin
861	91	aoT7FnjghW2	2017-07-06 18:42:08.832	2017-07-06 18:42:08.832	f	admin
861	88	1991-07-09	2017-07-06 18:42:08.835	2017-07-06 18:42:08.835	f	admin
861	89	25	2017-07-06 18:42:08.835	2017-07-06 18:42:08.835	f	admin
862	86	d7b8c75d-cdc9-4a67-a0de-766adbd682dd	2017-07-06 18:42:08.838	2017-07-06 18:42:08.838	f	admin
862	87	male	2017-07-06 18:42:08.838	2017-07-06 18:42:08.838	f	admin
862	90	A17.-	2017-07-06 18:42:08.838	2017-07-06 18:42:08.838	f	admin
862	91	M3JemRb3lfC	2017-07-06 18:42:08.838	2017-07-06 18:42:08.838	f	admin
862	88	1984-04-02	2017-07-06 18:42:08.842	2017-07-06 18:42:08.842	f	admin
863	86	52fc426c-8711-4fc2-b0dd-d46ab538464b	2017-07-06 18:42:08.844	2017-07-06 18:42:08.844	f	admin
863	87	male	2017-07-06 18:42:08.844	2017-07-06 18:42:08.844	f	admin
863	90	B20.-	2017-07-06 18:42:08.844	2017-07-06 18:42:08.844	f	admin
863	91	zZVTzIEQkHr	2017-07-06 18:42:08.844	2017-07-06 18:42:08.844	f	admin
863	88	1988-11-15	2017-07-06 18:42:08.848	2017-07-06 18:42:08.848	f	admin
863	89	27	2017-07-06 18:42:08.848	2017-07-06 18:42:08.848	f	admin
864	86	81209291-de9c-4b95-a90c-6dd49256c3ea	2017-07-06 18:42:08.85	2017-07-06 18:42:08.85	f	admin
864	87	missing	2017-07-06 18:42:08.85	2017-07-06 18:42:08.85	f	admin
864	90	B05.-	2017-07-06 18:42:08.85	2017-07-06 18:42:08.85	f	admin
864	91	LX7D7ZhKBYD	2017-07-06 18:42:08.85	2017-07-06 18:42:08.85	f	admin
864	89	47	2017-07-06 18:42:08.853	2017-07-06 18:42:08.853	f	admin
865	86	99cf9321-433c-44c2-ad7d-5ed2a3eb4290	2017-07-06 18:42:08.855	2017-07-06 18:42:08.855	f	admin
865	87	female	2017-07-06 18:42:08.855	2017-07-06 18:42:08.855	f	admin
865	90	A17.-	2017-07-06 18:42:08.855	2017-07-06 18:42:08.855	f	admin
865	91	ybfsiSEUSr8	2017-07-06 18:42:08.855	2017-07-06 18:42:08.855	f	admin
865	88	1947-05-02	2017-07-06 18:42:08.859	2017-07-06 18:42:08.859	f	admin
865	89	69	2017-07-06 18:42:08.859	2017-07-06 18:42:08.859	f	admin
866	86	b3295dce-b65a-4f1d-8131-9e090931dfc6	2017-07-06 18:42:08.861	2017-07-06 18:42:08.861	f	admin
866	87	male	2017-07-06 18:42:08.862	2017-07-06 18:42:08.862	f	admin
866	90	A17.8	2017-07-06 18:42:08.862	2017-07-06 18:42:08.862	f	admin
866	91	LZl2Z4yUBUg	2017-07-06 18:42:08.862	2017-07-06 18:42:08.862	f	admin
866	88	1982-08-03	2017-07-06 18:42:08.865	2017-07-06 18:42:08.865	f	admin
867	86	474e3a62-a615-4d83-9a9a-9c7bc479ea73	2017-07-06 18:42:08.867	2017-07-06 18:42:08.867	f	admin
867	87	female	2017-07-06 18:42:08.867	2017-07-06 18:42:08.867	f	admin
867	90	B20.-	2017-07-06 18:42:08.867	2017-07-06 18:42:08.867	f	admin
867	91	fdhYB61dGLc	2017-07-06 18:42:08.867	2017-07-06 18:42:08.867	f	admin
867	88	1984-04-18	2017-07-06 18:42:08.87	2017-07-06 18:42:08.87	f	admin
868	86	43e09291-fe08-4083-815a-8391c9c4ffca	2017-07-06 18:42:08.872	2017-07-06 18:42:08.872	f	admin
868	87	male	2017-07-06 18:42:08.872	2017-07-06 18:42:08.872	f	admin
868	90	A17.0	2017-07-06 18:42:08.872	2017-07-06 18:42:08.872	f	admin
868	91	qdRP0fGOhnr	2017-07-06 18:42:08.872	2017-07-06 18:42:08.872	f	admin
868	88	1993-11-24	2017-07-06 18:42:08.875	2017-07-06 18:42:08.875	f	admin
868	89	22	2017-07-06 18:42:08.875	2017-07-06 18:42:08.875	f	admin
869	86	632d91a3-6f28-4bc5-bb44-3c2e35ec03aa	2017-07-06 18:42:08.878	2017-07-06 18:42:08.878	f	admin
869	87	intermediate	2017-07-06 18:42:08.878	2017-07-06 18:42:08.878	f	admin
869	90	A17.0	2017-07-06 18:42:08.878	2017-07-06 18:42:08.878	f	admin
869	91	nlfhnxyyiiB	2017-07-06 18:42:08.878	2017-07-06 18:42:08.878	f	admin
869	89	9	2017-07-06 18:42:08.881	2017-07-06 18:42:08.881	f	admin
870	86	470830a2-8fe0-4ed0-b55e-4f5db440fe7f	2017-07-06 18:42:08.884	2017-07-06 18:42:08.884	f	admin
870	87	male	2017-07-06 18:42:08.884	2017-07-06 18:42:08.884	f	admin
870	90	E50.-	2017-07-06 18:42:08.884	2017-07-06 18:42:08.884	f	admin
870	91	nNcPZHD3ef3	2017-07-06 18:42:08.884	2017-07-06 18:42:08.884	f	admin
870	88	1932-06-26	2017-07-06 18:42:08.887	2017-07-06 18:42:08.887	f	admin
871	86	48b874d7-43bd-4850-93dd-09acf75c9224	2017-07-06 18:42:08.889	2017-07-06 18:42:08.889	f	admin
871	87	female	2017-07-06 18:42:08.889	2017-07-06 18:42:08.889	f	admin
871	90	A17.1	2017-07-06 18:42:08.889	2017-07-06 18:42:08.889	f	admin
871	91	hr07p3948Ye	2017-07-06 18:42:08.889	2017-07-06 18:42:08.889	f	admin
871	88	2000-10-31	2017-07-06 18:42:08.893	2017-07-06 18:42:08.893	f	admin
871	89	15	2017-07-06 18:42:08.894	2017-07-06 18:42:08.894	f	admin
872	86	8f99b1d8-6b91-468e-8038-e803df318e00	2017-07-06 18:42:08.896	2017-07-06 18:42:08.896	f	admin
872	87	missing	2017-07-06 18:42:08.896	2017-07-06 18:42:08.896	f	admin
872	90	A17.-	2017-07-06 18:42:08.896	2017-07-06 18:42:08.896	f	admin
872	91	xuKtKz33Bcn	2017-07-06 18:42:08.896	2017-07-06 18:42:08.896	f	admin
872	89	11	2017-07-06 18:42:08.899	2017-07-06 18:42:08.899	f	admin
873	86	3fc9f7fe-c763-43da-8827-7e63e1b6669f	2017-07-06 18:42:08.902	2017-07-06 18:42:08.902	f	admin
873	87	male	2017-07-06 18:42:08.902	2017-07-06 18:42:08.902	f	admin
873	90	B20.-	2017-07-06 18:42:08.902	2017-07-06 18:42:08.902	f	admin
873	91	flBwWH9Jm6L	2017-07-06 18:42:08.902	2017-07-06 18:42:08.902	f	admin
873	88	1974-09-05	2017-07-06 18:42:08.905	2017-07-06 18:42:08.905	f	admin
874	86	b256c7b3-c9ef-4e38-afc6-63b1d08438d7	2017-07-06 18:42:08.908	2017-07-06 18:42:08.908	f	admin
874	87	intermediate	2017-07-06 18:42:08.908	2017-07-06 18:42:08.908	f	admin
874	90	B05.-	2017-07-06 18:42:08.908	2017-07-06 18:42:08.908	f	admin
874	91	RwsfwLwHJ95	2017-07-06 18:42:08.908	2017-07-06 18:42:08.908	f	admin
874	89	78	2017-07-06 18:42:08.911	2017-07-06 18:42:08.911	f	admin
875	86	02128ece-04ce-48c5-ad30-ad6d6a1e9562	2017-07-06 18:42:08.914	2017-07-06 18:42:08.914	f	admin
875	87	male	2017-07-06 18:42:08.914	2017-07-06 18:42:08.914	f	admin
875	90	A17.0	2017-07-06 18:42:08.914	2017-07-06 18:42:08.914	f	admin
875	91	E1ZbGLspLLp	2017-07-06 18:42:08.914	2017-07-06 18:42:08.914	f	admin
875	89	0	2017-07-06 18:42:08.918	2017-07-06 18:42:08.918	f	admin
876	86	19c366dd-8ac9-4b79-978a-e1c112dadb5e	2017-07-06 18:42:08.92	2017-07-06 18:42:08.92	f	admin
876	87	female	2017-07-06 18:42:08.92	2017-07-06 18:42:08.92	f	admin
876	90	B20.-	2017-07-06 18:42:08.921	2017-07-06 18:42:08.921	f	admin
876	91	xLdRFsnBFPy	2017-07-06 18:42:08.921	2017-07-06 18:42:08.921	f	admin
876	88	1952-12-10	2017-07-06 18:42:08.924	2017-07-06 18:42:08.924	f	admin
877	86	df48e1cf-fd27-44b5-8c6d-9624c6f2a59c	2017-07-06 18:42:08.926	2017-07-06 18:42:08.926	f	admin
877	87	male	2017-07-06 18:42:08.926	2017-07-06 18:42:08.926	f	admin
877	90	B20.-	2017-07-06 18:42:08.926	2017-07-06 18:42:08.926	f	admin
877	91	QT47Cvbx3rt	2017-07-06 18:42:08.926	2017-07-06 18:42:08.926	f	admin
877	88	1968-05-06	2017-07-06 18:42:08.93	2017-07-06 18:42:08.93	f	admin
877	89	48	2017-07-06 18:42:08.93	2017-07-06 18:42:08.93	f	admin
878	86	a6c9c052-c771-4c02-b67b-6316a7b95968	2017-07-06 18:42:08.934	2017-07-06 18:42:08.934	f	admin
878	87	male	2017-07-06 18:42:08.934	2017-07-06 18:42:08.934	f	admin
878	90	A17.1	2017-07-06 18:42:08.934	2017-07-06 18:42:08.934	f	admin
878	91	hmBcoFSiL4C	2017-07-06 18:42:08.934	2017-07-06 18:42:08.934	f	admin
878	89	63	2017-07-06 18:42:08.939	2017-07-06 18:42:08.939	f	admin
879	86	8d865fda-550e-4809-b7e6-051716a01e3f	2017-07-06 18:42:08.941	2017-07-06 18:42:08.941	f	admin
879	87	missing	2017-07-06 18:42:08.941	2017-07-06 18:42:08.941	f	admin
879	90	A17.8	2017-07-06 18:42:08.941	2017-07-06 18:42:08.941	f	admin
879	91	Yi8wAwaxOKx	2017-07-06 18:42:08.941	2017-07-06 18:42:08.941	f	admin
879	88	1977-01-20	2017-07-06 18:42:08.945	2017-07-06 18:42:08.945	f	admin
879	89	40	2017-07-06 18:42:08.945	2017-07-06 18:42:08.945	f	admin
880	86	6711d15d-dfe5-42aa-b15c-b089f3716bdd	2017-07-06 18:42:08.948	2017-07-06 18:42:08.948	f	admin
880	87	male	2017-07-06 18:42:08.948	2017-07-06 18:42:08.948	f	admin
880	90	E50.-	2017-07-06 18:42:08.948	2017-07-06 18:42:08.948	f	admin
880	91	f8nFmiPlXnV	2017-07-06 18:42:08.948	2017-07-06 18:42:08.948	f	admin
880	88	2007-07-18	2017-07-06 18:42:08.952	2017-07-06 18:42:08.952	f	admin
881	86	7b666bdf-9a64-4d85-848c-1ed03cae0196	2017-07-06 18:42:08.955	2017-07-06 18:42:08.955	f	admin
881	87	female	2017-07-06 18:42:08.955	2017-07-06 18:42:08.955	f	admin
881	90	B20.-	2017-07-06 18:42:08.955	2017-07-06 18:42:08.955	f	admin
881	91	v399PNJf7gq	2017-07-06 18:42:08.955	2017-07-06 18:42:08.955	f	admin
881	88	1935-01-24	2017-07-06 18:42:08.959	2017-07-06 18:42:08.959	f	admin
881	89	81	2017-07-06 18:42:08.959	2017-07-06 18:42:08.959	f	admin
882	86	f3df42a0-1c74-4de5-939b-a7cffa562a78	2017-07-06 18:42:08.961	2017-07-06 18:42:08.961	f	admin
882	87	female	2017-07-06 18:42:08.961	2017-07-06 18:42:08.961	f	admin
882	90	B05.-	2017-07-06 18:42:08.961	2017-07-06 18:42:08.961	f	admin
882	91	Pg3nQedjWh5	2017-07-06 18:42:08.961	2017-07-06 18:42:08.961	f	admin
882	88	2010-06-25	2017-07-06 18:42:08.966	2017-07-06 18:42:08.966	f	admin
883	86	fead24a3-bfda-418e-a03f-94472505e0a9	2017-07-06 18:42:08.972	2017-07-06 18:42:08.972	f	admin
883	87	female	2017-07-06 18:42:08.972	2017-07-06 18:42:08.972	f	admin
883	90	A17.-	2017-07-06 18:42:08.972	2017-07-06 18:42:08.972	f	admin
883	91	fMplRLsT6jB	2017-07-06 18:42:08.972	2017-07-06 18:42:08.972	f	admin
883	88	1930-05-05	2017-07-06 18:42:08.977	2017-07-06 18:42:08.977	f	admin
883	89	85	2017-07-06 18:42:08.977	2017-07-06 18:42:08.977	f	admin
884	86	45bddc86-e8fb-48d4-a603-7f802f52c225	2017-07-06 18:42:08.98	2017-07-06 18:42:08.98	f	admin
884	87	unknown	2017-07-06 18:42:08.98	2017-07-06 18:42:08.98	f	admin
884	90	A17.8	2017-07-06 18:42:08.98	2017-07-06 18:42:08.98	f	admin
884	91	fwN6P7QGzRc	2017-07-06 18:42:08.98	2017-07-06 18:42:08.98	f	admin
884	89	8	2017-07-06 18:42:08.983	2017-07-06 18:42:08.983	f	admin
885	86	6022cc37-325a-4817-8ce5-fb8a162fd808	2017-07-06 18:42:08.986	2017-07-06 18:42:08.986	f	admin
885	87	female	2017-07-06 18:42:08.986	2017-07-06 18:42:08.986	f	admin
885	90	E50.-	2017-07-06 18:42:08.986	2017-07-06 18:42:08.986	f	admin
885	91	f04IdRJ8ZMm	2017-07-06 18:42:08.986	2017-07-06 18:42:08.986	f	admin
885	88	1932-02-10	2017-07-06 18:42:08.99	2017-07-06 18:42:08.99	f	admin
885	89	84	2017-07-06 18:42:08.99	2017-07-06 18:42:08.99	f	admin
886	86	8effeb65-47de-4d93-8528-e9d679b92e34	2017-07-06 18:42:08.993	2017-07-06 18:42:08.993	f	admin
886	87	male	2017-07-06 18:42:08.993	2017-07-06 18:42:08.993	f	admin
886	90	A17.8	2017-07-06 18:42:08.993	2017-07-06 18:42:08.993	f	admin
886	91	wIwvbkaFXZH	2017-07-06 18:42:08.993	2017-07-06 18:42:08.993	f	admin
886	88	2009-06-26	2017-07-06 18:42:08.997	2017-07-06 18:42:08.997	f	admin
886	89	6	2017-07-06 18:42:08.997	2017-07-06 18:42:08.997	f	admin
974	86	f469f26d-6536-4063-a447-5e056d438e84	2017-08-17 06:56:19.848	2017-08-17 06:56:19.848	f	va-demo
974	87	female	2017-08-17 06:56:19.848	2017-08-17 06:56:19.848	f	va-demo
974	90	B05.-	2017-08-17 06:56:19.849	2017-08-17 06:56:19.849	f	va-demo
974	88	1956-03-17	2017-08-17 06:56:19.851	2017-08-17 06:56:19.851	f	va-demo
974	89	60	2017-08-17 06:56:19.852	2017-08-17 06:56:19.852	f	va-demo
975	86	3b334195-f3de-418a-a1cd-46ac1b846684	2017-08-17 06:56:19.866	2017-08-17 06:56:19.866	f	va-demo
975	87	male	2017-08-17 06:56:19.867	2017-08-17 06:56:19.867	f	va-demo
975	90	A17.1	2017-08-17 06:56:19.867	2017-08-17 06:56:19.867	f	va-demo
975	89	11	2017-08-17 06:56:19.869	2017-08-17 06:56:19.869	f	va-demo
976	86	97f80126-fbed-48dc-a4ef-099e26293ba5	2017-08-17 06:56:19.871	2017-08-17 06:56:19.871	f	va-demo
976	87	female	2017-08-17 06:56:19.871	2017-08-17 06:56:19.871	f	va-demo
976	90	B05.-	2017-08-17 06:56:19.871	2017-08-17 06:56:19.871	f	va-demo
976	89	40	2017-08-17 06:56:19.871	2017-08-17 06:56:19.871	f	va-demo
977	86	49fd173b-cc1f-4128-ad27-195cccbcf613	2017-08-17 06:56:19.874	2017-08-17 06:56:19.874	f	va-demo
977	87	male	2017-08-17 06:56:19.874	2017-08-17 06:56:19.874	f	va-demo
977	90	B05.-	2017-08-17 06:56:19.874	2017-08-17 06:56:19.874	f	va-demo
977	88	1929-01-15	2017-08-17 06:56:19.875	2017-08-17 06:56:19.875	f	va-demo
977	89	87	2017-08-17 06:56:19.875	2017-08-17 06:56:19.875	f	va-demo
978	86	a6cfe3ca-72e5-441d-bae8-f31913975124	2017-08-17 06:56:19.877	2017-08-17 06:56:19.877	f	va-demo
978	87	male	2017-08-17 06:56:19.877	2017-08-17 06:56:19.877	f	va-demo
978	90	E50.-	2017-08-17 06:56:19.877	2017-08-17 06:56:19.877	f	va-demo
978	88	1948-04-11	2017-08-17 06:56:19.877	2017-08-17 06:56:19.877	f	va-demo
979	86	bc2f9533-4380-4366-8e92-c056b9fbd4ce	2017-08-17 06:56:19.879	2017-08-17 06:56:19.879	f	va-demo
979	87	male	2017-08-17 06:56:19.879	2017-08-17 06:56:19.879	f	va-demo
979	90	A17.1	2017-08-17 06:56:19.879	2017-08-17 06:56:19.879	f	va-demo
979	88	2001-01-09	2017-08-17 06:56:19.88	2017-08-17 06:56:19.88	f	va-demo
979	89	15	2017-08-17 06:56:19.88	2017-08-17 06:56:19.88	f	va-demo
980	86	22d98c09-f921-410e-90db-13feb48bdbc0	2017-08-17 06:56:19.882	2017-08-17 06:56:19.882	f	va-demo
980	87	male	2017-08-17 06:56:19.882	2017-08-17 06:56:19.882	f	va-demo
980	90	A17.8	2017-08-17 06:56:19.882	2017-08-17 06:56:19.882	f	va-demo
980	89	3	2017-08-17 06:56:19.882	2017-08-17 06:56:19.882	f	va-demo
981	86	a7c4bf34-776a-4877-a50e-68fee618a2ec	2017-08-17 06:56:19.884	2017-08-17 06:56:19.884	f	va-demo
981	87	female	2017-08-17 06:56:19.884	2017-08-17 06:56:19.884	f	va-demo
981	90	B05.-	2017-08-17 06:56:19.884	2017-08-17 06:56:19.884	f	va-demo
981	88	1980-08-20	2017-08-17 06:56:19.884	2017-08-17 06:56:19.884	f	va-demo
981	89	36	2017-08-17 06:56:19.884	2017-08-17 06:56:19.884	f	va-demo
982	86	1b8ce33e-42a7-4a6d-a341-c6be768af2fe	2017-08-17 06:56:19.886	2017-08-17 06:56:19.886	f	va-demo
982	87	male	2017-08-17 06:56:19.886	2017-08-17 06:56:19.886	f	va-demo
982	90	A17.8	2017-08-17 06:56:19.886	2017-08-17 06:56:19.886	f	va-demo
982	88	1953-04-10	2017-08-17 06:56:19.886	2017-08-17 06:56:19.886	f	va-demo
983	86	ce9f360a-48f7-48e2-af48-48fa6c409cdb	2017-08-17 06:56:19.891	2017-08-17 06:56:19.891	f	va-demo
983	87	missing	2017-08-17 06:56:19.891	2017-08-17 06:56:19.891	f	va-demo
983	90	A17.8	2017-08-17 06:56:19.891	2017-08-17 06:56:19.891	f	va-demo
983	88	2003-12-14	2017-08-17 06:56:19.891	2017-08-17 06:56:19.891	f	va-demo
\.


--
-- Data for Name: trackedentitydatavalueaudit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentitydatavalueaudit (trackedentitydatavalueauditid, programstageinstanceid, dataelementid, value, created, providedelsewhere, modifiedby, audittype) FROM stdin;
111	109	86	452435sft345sdf	2017-07-05 16:51:33.36	f	admin	UPDATE
112	109	87	male	2017-07-05 16:51:33.369	f	admin	UPDATE
113	109	88	2006-07-04	2017-07-05 16:51:33.382	f	admin	UPDATE
114	109	90	A17.1	2017-07-05 16:51:33.4	f	admin	UPDATE
115	109	91	IjmqTYdr41h	2017-07-05 16:51:33.419	f	admin	UPDATE
930	344	91	SN8XBUzMYHi	2017-07-07 07:32:21.327	f	admin	DELETE
\.


--
-- Data for Name: trackedentityinstance; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentityinstance (trackedentityinstanceid, uid, code, created, lastupdated, inactive, representativeid, organisationunitid, trackedentityid) FROM stdin;
\.


--
-- Data for Name: trackedentityprogramindicatordimension; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentityprogramindicatordimension (trackedentityprogramindicatordimensionid, programindicatorid, legendsetid, filter) FROM stdin;
\.


--
-- Data for Name: trackedentitytranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trackedentitytranslations (trackedentityid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: userapps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY userapps (userinfoid, sort_order, app) FROM stdin;
\.


--
-- Data for Name: userattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY userattributevalues (userinfoid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: userdatavieworgunits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY userdatavieworgunits (userinfoid, organisationunitid) FROM stdin;
46	49
102	49
\.


--
-- Data for Name: usergroup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY usergroup (usergroupid, uid, code, created, lastupdated, name, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: usergroupaccess; Type: TABLE DATA; Schema: public; Owner: -
--

COPY usergroupaccess (usergroupaccessid, access, usergroupid) FROM stdin;
\.


--
-- Data for Name: usergroupattributevalues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY usergroupattributevalues (usergroupid, attributevalueid) FROM stdin;
\.


--
-- Data for Name: usergroupmanaged; Type: TABLE DATA; Schema: public; Owner: -
--

COPY usergroupmanaged (managedbygroupid, managedgroupid) FROM stdin;
\.


--
-- Data for Name: usergroupmembers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY usergroupmembers (userid, usergroupid) FROM stdin;
\.


--
-- Data for Name: usergrouptranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY usergrouptranslations (usergroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: usergroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY usergroupusergroupaccesses (usergroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: userinfo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY userinfo (userinfoid, uid, code, lastupdated, created, surname, firstname, email, phonenumber, jobtitle, introduction, gender, birthday, nationality, employer, education, interests, languages, lastcheckedinterpretations) FROM stdin;
46	M5zQapPyTZI	admin	2017-07-04 14:06:44.718	2017-07-04 13:46:29.027	admin	admin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
102	kS2yVmRMcAY	\N	2017-07-04 19:03:37.965	2017-07-04 16:58:51.23	Demo	VA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: userkeyjsonvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY userkeyjsonvalue (userkeyjsonvalueid, uid, code, created, lastupdated, userid, namespace, userkey, value, encrypted_value, encrypted) FROM stdin;
\.


--
-- Data for Name: usermembership; Type: TABLE DATA; Schema: public; Owner: -
--

COPY usermembership (userinfoid, organisationunitid) FROM stdin;
46	49
102	51
\.


--
-- Data for Name: usermessage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY usermessage (usermessageid, usermessagekey, userid, isread, isfollowup) FROM stdin;
\.


--
-- Data for Name: userrole; Type: TABLE DATA; Schema: public; Owner: -
--

COPY userrole (userroleid, uid, code, created, lastupdated, name, description, userid, publicaccess) FROM stdin;
47	yrB6vc5Ip3r	Superuser	2017-07-04 13:46:29.037	2017-07-04 13:46:29.037	Superuser	Superuser	\N	--------
101	QfDffuTuxva	\N	2017-07-04 16:57:38.553	2017-07-04 16:57:38.553	VA demo	\N	46	rw------
\.


--
-- Data for Name: userroleauthorities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY userroleauthorities (userroleid, authority) FROM stdin;
47	F_USERGROUP_MANAGING_RELATIONSHIPS_ADD
47	F_ORGUNITGROUP_PRIVATE_ADD
47	F_DATAELEMENTGROUP_PUBLIC_ADD
47	F_USER_GROUPS_READ_ONLY_ADD_MEMBERS
47	F_DATAELEMENT_DELETE
47	F_OPTIONGROUP_DELETE
47	F_LEGEND_SET_PRIVATE_ADD
47	F_CATEGORY_PRIVATE_ADD
47	F_INDICATORGROUPSET_PUBLIC_ADD
47	F_EXTERNAL_MAP_LAYER_PRIVATE_ADD
47	F_REPORTTABLE_EXTERNAL
47	F_CATEGORY_OPTION_PRIVATE_ADD
47	F_GIS_ADMIN
47	F_CATEGORY_OPTION_GROUP_PUBLIC_ADD
47	F_ORGUNITGROUPSET_DELETE
47	F_INDICATOR_DELETE
47	F_ORGUNITGROUPSET_PRIVATE_ADD
47	F_VIEW_UNAPPROVED_DATA
47	F_USERGROUP_MANAGING_RELATIONSHIPS_VIEW
47	F_PREDICTOR_ADD
47	F_OPTIONGROUPSET_DELETE
47	F_USERGROUP_PUBLIC_ADD
47	F_OAUTH2_CLIENT_MANAGE
47	F_APPROVE_DATA_LOWER_LEVELS
47	F_ORGUNITGROUP_PUBLIC_ADD
47	F_REPORTTABLE_PUBLIC_ADD
47	F_CATEGORY_COMBO_PRIVATE_ADD
47	F_TRACKED_ENTITY_INSTANCE_DELETE
47	F_OPTIONSET_PUBLIC_ADD
47	F_ORGANISATIONUNIT_MOVE
47	F_EXTERNAL_MAP_LAYER_PUBLIC_ADD
47	F_INDICATORGROUP_DELETE
47	F_ORGANISATIONUNIT_DELETE
47	F_OPTIONGROUPSET_PRIVATE_ADD
47	F_ORGUNITGROUPSET_PUBLIC_ADD
47	F_SQLVIEW_EXTERNAL
47	F_CATEGORY_COMBO_DELETE
47	F_DASHBOARD_PUBLIC_ADD
47	F_CONSTANT_DELETE
47	F_METADATA_IMPORT
47	F_INDICATORGROUPSET_PRIVATE_ADD
47	F_PREDICTOR_DELETE
47	F_CHART_PUBLIC_ADD
47	F_CHART_EXTERNAL
47	F_METADATA_EXPORT
47	F_PROGRAM_UNENROLLMENT
47	F_DATAELEMENTGROUP_PRIVATE_ADD
47	F_APPROVE_DATA
47	F_CATEGORY_OPTION_GROUP_SET_PUBLIC_ADD
47	F_METADATA_MANAGE
47	F_DATAELEMENT_PRIVATE_ADD
47	F_TRACKED_ENTITY_INSTANCE_SEARCH_IN_ALL_ORGUNITS
47	ALL
47	F_LEGEND_DELETE
47	F_CATEGORY_OPTION_GROUP_SET_PRIVATE_ADD
47	F_MAP_PUBLIC_ADD
47	F_CATEGORY_OPTION_GROUP_SET_DELETE
47	F_USER_ADD_WITHIN_MANAGED_GROUP
47	F_PROGRAM_ENROLLMENT
47	F_ORGANISATIONUNIT_ADD
47	F_LEGEND_SET_PUBLIC_ADD
47	F_CONSTANT_ADD
47	F_PUSH_ANALYSIS_DELETE
47	F_REPLICATE_USER
47	F_INSERT_CUSTOM_JS_CSS
47	F_DATAELEMENTGROUPSET_DELETE
47	F_LEGEND_SET_DELETE
47	F_INDICATORTYPE_ADD
47	F_INDICATOR_PUBLIC_ADD
47	F_INDICATORGROUP_PUBLIC_ADD
47	F_INDICATOR_PRIVATE_ADD
47	F_TRACKED_ENTITY_INSTANCE_ADD
47	F_PUSH_ANALYSIS_ADD
47	F_EXTERNAL_MAP_LAYER_DELETE
47	F_PROGRAM_DASHBOARD_CONFIG_ADMIN
47	F_ATTRIBUTE_ADD
47	F_ORGANISATIONUNITLEVEL_UPDATE
47	F_CATEGORY_OPTION_PUBLIC_ADD
47	F_CATEGORY_OPTION_DELETE
47	F_DATAELEMENT_PUBLIC_ADD
47	F_OPTIONSET_PRIVATE_ADD
47	F_CATEGORY_OPTION_GROUP_DELETE
47	F_OPTIONGROUP_PRIVATE_ADD
47	F_TRACKED_ENTITY_INSTANCE_SEARCH
47	F_ORGUNITGROUP_DELETE
47	F_DATAELEMENTGROUPSET_PRIVATE_ADD
47	F_LEGEND_ADD
47	F_CATEGORY_OPTION_GROUP_PRIVATE_ADD
47	F_CATEGORY_PUBLIC_ADD
47	F_ATTRIBUTE_DELETE
47	F_OPTIONSET_DELETE
47	F_CATEGORY_COMBO_PUBLIC_ADD
47	F_INDICATORGROUPSET_DELETE
47	F_ACCEPT_DATA_LOWER_LEVELS
47	F_OPTIONGROUPSET_PUBLIC_ADD
47	F_CATEGORY_DELETE
47	F_OPTIONGROUP_PUBLIC_ADD
47	F_TRACKED_ENTITY_DATAVALUE_ADD
47	F_INDICATORTYPE_DELETE
47	F_MAP_EXTERNAL
47	F_INDICATORGROUP_PRIVATE_ADD
47	F_TRACKED_ENTITY_DATAVALUE_DELETE
47	F_DATAELEMENTGROUP_DELETE
47	F_DATAELEMENTGROUPSET_PUBLIC_ADD
101	F_DATAVALUE_DELETE
101	M_dhis-web-cache-cleaner
101	F_TRACKED_ENTITY_DATAVALUE_ADD
101	M_dhis-web-dashboard-integration
101	M_dhis-web-event-capture
101	F_DATAVALUE_ADD
101	F_TRACKED_ENTITY_DATAVALUE_DELETE
\.


--
-- Data for Name: userroledataset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY userroledataset (userroleid, datasetid) FROM stdin;
\.


--
-- Data for Name: userrolemembers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY userrolemembers (userid, userroleid) FROM stdin;
46	47
102	101
\.


--
-- Data for Name: userroletranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY userroletranslations (userroleid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: userroleusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY userroleusergroupaccesses (userroleid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (userid, uid, code, created, lastupdated, creatoruserid, username, password, externalauth, openid, ldapid, passwordlastupdated, lastlogin, restoretoken, restorecode, restoreexpiry, selfregistered, invitation, disabled) FROM stdin;
102	SLLixojcRBo	\N	2017-07-04 16:58:51.094	2017-08-17 06:54:23.285	46	va-demo	$2a$10$kD1INKcay/J89oVL6Yt2GeWQTylM/7jIjaOD7z.9cQkC8I9QxuNWa	f	\N	\N	2017-07-04 16:58:51.095	2017-08-17 06:54:23.283	\N	\N	\N	f	f	f
46	KvMx6c1eoYo	admin	2017-07-04 13:46:29.089	2017-08-23 09:45:50.306	46	admin	$2a$10$mNoaHmaYWaemPv1bgmnjb.gKkPtbuW/hNSR3lHdMoGSSa.1RCZaUC	f	\N	\N	2017-07-04 14:06:44.612	2017-08-23 09:45:50.303	\N	\N	\N	f	f	f
\.


--
-- Data for Name: users_catdimensionconstraints; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users_catdimensionconstraints (userid, dataelementcategoryid) FROM stdin;
\.


--
-- Data for Name: users_cogsdimensionconstraints; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users_cogsdimensionconstraints (userid, categoryoptiongroupsetid) FROM stdin;
\.


--
-- Data for Name: usersetting; Type: TABLE DATA; Schema: public; Owner: -
--

COPY usersetting (userinfoid, name, value) FROM stdin;
46	keyUiLocale	\\xaced0005737200106a6176612e7574696c2e4c6f63616c657ef811609c30f9ec03000649000868617368636f64654c0007636f756e7472797400124c6a6176612f6c616e672f537472696e673b4c000a657874656e73696f6e7371007e00014c00086c616e677561676571007e00014c000673637269707471007e00014c000776617269616e7471007e00017870ffffffff74000071007e0003740002656e71007e000371007e000378
46	keyDbLocale	\N
102	keyUiLocale	\\xaced0005737200106a6176612e7574696c2e4c6f63616c657ef811609c30f9ec03000649000868617368636f64654c0007636f756e7472797400124c6a6176612f6c616e672f537472696e673b4c000a657874656e73696f6e7371007e00014c00086c616e677561676571007e00014c000673637269707471007e00014c000776617269616e7471007e00017870ffffffff74000071007e0003740002656e71007e000371007e000378
102	keyDbLocale	\N
\.


--
-- Data for Name: userteisearchorgunits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY userteisearchorgunits (userinfoid, organisationunitid) FROM stdin;
\.


--
-- Data for Name: validationcriteria; Type: TABLE DATA; Schema: public; Owner: -
--

COPY validationcriteria (validationcriteriaid, uid, code, created, lastupdated, name, description, property, operator, value) FROM stdin;
\.


--
-- Data for Name: validationcriteriatranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY validationcriteriatranslations (validationcriteriaid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: validationrule; Type: TABLE DATA; Schema: public; Owner: -
--

COPY validationrule (validationruleid, uid, code, created, lastupdated, name, description, instruction, importance, operator, leftexpressionid, rightexpressionid, periodtypeid) FROM stdin;
\.


--
-- Data for Name: validationrulegroup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY validationrulegroup (validationrulegroupid, uid, code, created, lastupdated, name, description, alertbyorgunits, userid, publicaccess) FROM stdin;
\.


--
-- Data for Name: validationrulegroupmembers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY validationrulegroupmembers (validationgroupid, validationruleid) FROM stdin;
\.


--
-- Data for Name: validationrulegrouptranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY validationrulegrouptranslations (validationrulegroupid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: validationrulegroupusergroupaccesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY validationrulegroupusergroupaccesses (validationrulegroupid, usergroupaccessid) FROM stdin;
\.


--
-- Data for Name: validationrulegroupusergroupstoalert; Type: TABLE DATA; Schema: public; Owner: -
--

COPY validationrulegroupusergroupstoalert (validationgroupid, usergroupid) FROM stdin;
\.


--
-- Data for Name: validationruletranslations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY validationruletranslations (validationruleid, objecttranslationid) FROM stdin;
\.


--
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: -
--

COPY version (versionid, versionkey, versionvalue) FROM stdin;
48	organisationUnit	9a3e2f6f-8def-49c8-9134-920ae4e94b98
\.


--
-- Name: attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY attribute
    ADD CONSTRAINT attribute_pkey PRIMARY KEY (attributeid);


--
-- Name: attributetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY attributetranslations
    ADD CONSTRAINT attributetranslations_pkey PRIMARY KEY (attributeid, objecttranslationid);


--
-- Name: attributevalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY attributevalue
    ADD CONSTRAINT attributevalue_pkey PRIMARY KEY (attributevalueid);


--
-- Name: categories_categoryoptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categories_categoryoptions
    ADD CONSTRAINT categories_categoryoptions_pkey PRIMARY KEY (categoryid, sort_order);


--
-- Name: categorycombo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categorycombo
    ADD CONSTRAINT categorycombo_pkey PRIMARY KEY (categorycomboid);


--
-- Name: categorycombos_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categorycombos_categories
    ADD CONSTRAINT categorycombos_categories_pkey PRIMARY KEY (categorycomboid, sort_order);


--
-- Name: categorycombos_optioncombos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categorycombos_optioncombos
    ADD CONSTRAINT categorycombos_optioncombos_pkey PRIMARY KEY (categoryoptioncomboid);


--
-- Name: categorycombotranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categorycombotranslations
    ADD CONSTRAINT categorycombotranslations_pkey PRIMARY KEY (categorycomboid, objecttranslationid);


--
-- Name: categorycombousergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categorycombousergroupaccesses
    ADD CONSTRAINT categorycombousergroupaccesses_pkey PRIMARY KEY (categorycomboid, usergroupaccessid);


--
-- Name: categorydimension_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categorydimension_items
    ADD CONSTRAINT categorydimension_items_pkey PRIMARY KEY (categorydimensionid, sort_order);


--
-- Name: categorydimension_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categorydimension
    ADD CONSTRAINT categorydimension_pkey PRIMARY KEY (categorydimensionid);


--
-- Name: categoryoption_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoption_organisationunits
    ADD CONSTRAINT categoryoption_organisationunits_pkey PRIMARY KEY (categoryoptionid, organisationunitid);


--
-- Name: categoryoptioncombo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptioncombo
    ADD CONSTRAINT categoryoptioncombo_pkey PRIMARY KEY (categoryoptioncomboid);


--
-- Name: categoryoptioncomboattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptioncomboattributevalues
    ADD CONSTRAINT categoryoptioncomboattributevalues_pkey PRIMARY KEY (categoryoptioncomboid, attributevalueid);


--
-- Name: categoryoptioncombos_categoryoptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptioncombos_categoryoptions
    ADD CONSTRAINT categoryoptioncombos_categoryoptions_pkey PRIMARY KEY (categoryoptioncomboid, categoryoptionid);


--
-- Name: categoryoptioncombotranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptioncombotranslations
    ADD CONSTRAINT categoryoptioncombotranslations_pkey PRIMARY KEY (categoryoptioncomboid, objecttranslationid);


--
-- Name: categoryoptiongroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongroup
    ADD CONSTRAINT categoryoptiongroup_pkey PRIMARY KEY (categoryoptiongroupid);


--
-- Name: categoryoptiongroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongroupattributevalues
    ADD CONSTRAINT categoryoptiongroupattributevalues_pkey PRIMARY KEY (categoryoptiongroupid, attributevalueid);


--
-- Name: categoryoptiongroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongroupmembers
    ADD CONSTRAINT categoryoptiongroupmembers_pkey PRIMARY KEY (categoryoptiongroupid, categoryoptionid);


--
-- Name: categoryoptiongroupset_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongroupset
    ADD CONSTRAINT categoryoptiongroupset_pkey PRIMARY KEY (categoryoptiongroupsetid);


--
-- Name: categoryoptiongroupsetmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongroupsetmembers
    ADD CONSTRAINT categoryoptiongroupsetmembers_pkey PRIMARY KEY (categoryoptiongroupsetid, sort_order);


--
-- Name: categoryoptiongroupsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongroupsettranslations
    ADD CONSTRAINT categoryoptiongroupsettranslations_pkey PRIMARY KEY (categoryoptiongroupsetid, objecttranslationid);


--
-- Name: categoryoptiongroupsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongroupsetusergroupaccesses
    ADD CONSTRAINT categoryoptiongroupsetusergroupaccesses_pkey PRIMARY KEY (categoryoptiongroupsetid, usergroupaccessid);


--
-- Name: categoryoptiongrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongrouptranslations
    ADD CONSTRAINT categoryoptiongrouptranslations_pkey PRIMARY KEY (categoryoptiongroupid, objecttranslationid);


--
-- Name: categoryoptiongroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongroupusergroupaccesses
    ADD CONSTRAINT categoryoptiongroupusergroupaccesses_pkey PRIMARY KEY (categoryoptiongroupid, usergroupaccessid);


--
-- Name: categoryoptiontranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiontranslations
    ADD CONSTRAINT categoryoptiontranslations_pkey PRIMARY KEY (categoryoptionid, objecttranslationid);


--
-- Name: chart_categorydimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chart_categorydimensions
    ADD CONSTRAINT chart_categorydimensions_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_categoryoptiongroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chart_categoryoptiongroups
    ADD CONSTRAINT chart_categoryoptiongroups_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_datadimensionitems_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chart_datadimensionitems
    ADD CONSTRAINT chart_datadimensionitems_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_dataelementgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chart_dataelementgroups
    ADD CONSTRAINT chart_dataelementgroups_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chart_filters
    ADD CONSTRAINT chart_filters_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_itemorgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chart_itemorgunitgroups
    ADD CONSTRAINT chart_itemorgunitgroups_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chart_organisationunits
    ADD CONSTRAINT chart_organisationunits_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_orgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chart_orgunitgroups
    ADD CONSTRAINT chart_orgunitgroups_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_orgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chart_orgunitlevels
    ADD CONSTRAINT chart_orgunitlevels_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chart_periods
    ADD CONSTRAINT chart_periods_pkey PRIMARY KEY (chartid, sort_order);


--
-- Name: chart_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chart
    ADD CONSTRAINT chart_pkey PRIMARY KEY (chartid);


--
-- Name: charttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY charttranslations
    ADD CONSTRAINT charttranslations_pkey PRIMARY KEY (chartid, objecttranslationid);


--
-- Name: chartusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chartusergroupaccesses
    ADD CONSTRAINT chartusergroupaccesses_pkey PRIMARY KEY (chartid, usergroupaccessid);


--
-- Name: color_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY color
    ADD CONSTRAINT color_pkey PRIMARY KEY (colorid);


--
-- Name: colorset_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY colorset_colors
    ADD CONSTRAINT colorset_colors_pkey PRIMARY KEY (colorsetid, sort_order);


--
-- Name: colorset_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY colorset
    ADD CONSTRAINT colorset_pkey PRIMARY KEY (colorsetid);


--
-- Name: colorsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY colorsettranslations
    ADD CONSTRAINT colorsettranslations_pkey PRIMARY KEY (colorsetid, objecttranslationid);


--
-- Name: colortranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY colortranslations
    ADD CONSTRAINT colortranslations_pkey PRIMARY KEY (colorid, objecttranslationid);


--
-- Name: completedatasetregistration_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY completedatasetregistration
    ADD CONSTRAINT completedatasetregistration_pkey PRIMARY KEY (datasetid, periodid, sourceid, attributeoptioncomboid);


--
-- Name: configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT configuration_pkey PRIMARY KEY (configurationid);


--
-- Name: constant_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY constant
    ADD CONSTRAINT constant_pkey PRIMARY KEY (constantid);


--
-- Name: constantattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY constantattributevalues
    ADD CONSTRAINT constantattributevalues_pkey PRIMARY KEY (constantid, attributevalueid);


--
-- Name: constanttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY constanttranslations
    ADD CONSTRAINT constanttranslations_pkey PRIMARY KEY (colorid, objecttranslationid);


--
-- Name: constantusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY constantusergroupaccesses
    ADD CONSTRAINT constantusergroupaccesses_pkey PRIMARY KEY (constantid, usergroupaccessid);


--
-- Name: dashboard_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashboard_items
    ADD CONSTRAINT dashboard_items_pkey PRIMARY KEY (dashboardid, sort_order);


--
-- Name: dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashboard
    ADD CONSTRAINT dashboard_pkey PRIMARY KEY (dashboardid);


--
-- Name: dashboarditem_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT dashboarditem_pkey PRIMARY KEY (dashboarditemid);


--
-- Name: dashboarditem_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashboarditem_reports
    ADD CONSTRAINT dashboarditem_reports_pkey PRIMARY KEY (dashboarditemid, sort_order);


--
-- Name: dashboarditem_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashboarditem_resources
    ADD CONSTRAINT dashboarditem_resources_pkey PRIMARY KEY (dashboarditemid, sort_order);


--
-- Name: dashboarditem_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashboarditem_users
    ADD CONSTRAINT dashboarditem_users_pkey PRIMARY KEY (dashboarditemid, sort_order);


--
-- Name: dashboarditemtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashboarditemtranslations
    ADD CONSTRAINT dashboarditemtranslations_pkey PRIMARY KEY (dashboarditemid, objecttranslationid);


--
-- Name: dashboardtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashboardtranslations
    ADD CONSTRAINT dashboardtranslations_pkey PRIMARY KEY (dashboardid, objecttranslationid);


--
-- Name: dashboardusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashboardusergroupaccesses
    ADD CONSTRAINT dashboardusergroupaccesses_pkey PRIMARY KEY (dashboardid, usergroupaccessid);


--
-- Name: dataapproval_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT dataapproval_pkey PRIMARY KEY (dataapprovalid);


--
-- Name: dataapproval_unique_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT dataapproval_unique_key UNIQUE (dataapprovallevelid, workflowid, periodid, organisationunitid, attributeoptioncomboid);


--
-- Name: dataapprovallevel_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapprovallevel
    ADD CONSTRAINT dataapprovallevel_pkey PRIMARY KEY (dataapprovallevelid);


--
-- Name: dataapprovalleveltranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapprovalleveltranslations
    ADD CONSTRAINT dataapprovalleveltranslations_pkey PRIMARY KEY (dataapprovallevelid, objecttranslationid);


--
-- Name: dataapprovallevelusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapprovallevelusergroupaccesses
    ADD CONSTRAINT dataapprovallevelusergroupaccesses_pkey PRIMARY KEY (dataapprovallevelid, usergroupaccessid);


--
-- Name: dataapprovalworkflow_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapprovalworkflow
    ADD CONSTRAINT dataapprovalworkflow_pkey PRIMARY KEY (workflowid);


--
-- Name: dataapprovalworkflowlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapprovalworkflowlevels
    ADD CONSTRAINT dataapprovalworkflowlevels_pkey PRIMARY KEY (workflowid, dataapprovallevelid);


--
-- Name: dataapprovalworkflowtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapprovalworkflowtranslations
    ADD CONSTRAINT dataapprovalworkflowtranslations_pkey PRIMARY KEY (workflowid, objecttranslationid);


--
-- Name: dataapprovalworkflowusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapprovalworkflowusergroupaccesses
    ADD CONSTRAINT dataapprovalworkflowusergroupaccesses_pkey PRIMARY KEY (workflowid, usergroupaccessid);


--
-- Name: datadimensionitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT datadimensionitem_pkey PRIMARY KEY (datadimensionitemid);


--
-- Name: dataelement_code_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT dataelement_code_key UNIQUE (code);


--
-- Name: dataelement_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT dataelement_pkey PRIMARY KEY (dataelementid);


--
-- Name: dataelementaggregationlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementaggregationlevels
    ADD CONSTRAINT dataelementaggregationlevels_pkey PRIMARY KEY (dataelementid, sort_order);


--
-- Name: dataelementattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementattributevalues
    ADD CONSTRAINT dataelementattributevalues_pkey PRIMARY KEY (dataelementid, attributevalueid);


--
-- Name: dataelementcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementcategory
    ADD CONSTRAINT dataelementcategory_pkey PRIMARY KEY (categoryid);


--
-- Name: dataelementcategoryoption_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementcategoryoption
    ADD CONSTRAINT dataelementcategoryoption_pkey PRIMARY KEY (categoryoptionid);


--
-- Name: dataelementcategoryoptionattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementcategoryoptionattributevalues
    ADD CONSTRAINT dataelementcategoryoptionattributevalues_pkey PRIMARY KEY (categoryoptionid, attributevalueid);


--
-- Name: dataelementcategoryoptionusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementcategoryoptionusergroupaccesses
    ADD CONSTRAINT dataelementcategoryoptionusergroupaccesses_pkey PRIMARY KEY (categoryoptionid, usergroupaccessid);


--
-- Name: dataelementcategorytranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementcategorytranslations
    ADD CONSTRAINT dataelementcategorytranslations_pkey PRIMARY KEY (categoryid, objecttranslationid);


--
-- Name: dataelementcategoryusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementcategoryusergroupaccesses
    ADD CONSTRAINT dataelementcategoryusergroupaccesses_pkey PRIMARY KEY (categoryid, usergroupaccessid);


--
-- Name: dataelementgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgroup
    ADD CONSTRAINT dataelementgroup_pkey PRIMARY KEY (dataelementgroupid);


--
-- Name: dataelementgroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgroupattributevalues
    ADD CONSTRAINT dataelementgroupattributevalues_pkey PRIMARY KEY (dataelementgroupid, attributevalueid);


--
-- Name: dataelementgroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgroupmembers
    ADD CONSTRAINT dataelementgroupmembers_pkey PRIMARY KEY (dataelementgroupid, dataelementid);


--
-- Name: dataelementgroupset_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgroupset
    ADD CONSTRAINT dataelementgroupset_pkey PRIMARY KEY (dataelementgroupsetid);


--
-- Name: dataelementgroupsetmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgroupsetmembers
    ADD CONSTRAINT dataelementgroupsetmembers_pkey PRIMARY KEY (dataelementgroupsetid, sort_order);


--
-- Name: dataelementgroupsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgroupsettranslations
    ADD CONSTRAINT dataelementgroupsettranslations_pkey PRIMARY KEY (dataelementgroupsetid, objecttranslationid);


--
-- Name: dataelementgroupsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgroupsetusergroupaccesses
    ADD CONSTRAINT dataelementgroupsetusergroupaccesses_pkey PRIMARY KEY (dataelementgroupsetid, usergroupaccessid);


--
-- Name: dataelementgrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgrouptranslations
    ADD CONSTRAINT dataelementgrouptranslations_pkey PRIMARY KEY (dataelementgroupid, objecttranslationid);


--
-- Name: dataelementgroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgroupusergroupaccesses
    ADD CONSTRAINT dataelementgroupusergroupaccesses_pkey PRIMARY KEY (dataelementgroupid, usergroupaccessid);


--
-- Name: dataelementoperand_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementoperand
    ADD CONSTRAINT dataelementoperand_pkey PRIMARY KEY (dataelementoperandid);


--
-- Name: dataelementtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementtranslations
    ADD CONSTRAINT dataelementtranslations_pkey PRIMARY KEY (dataelementid, objecttranslationid);


--
-- Name: dataelementusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementusergroupaccesses
    ADD CONSTRAINT dataelementusergroupaccesses_pkey PRIMARY KEY (dataelementid, usergroupaccessid);


--
-- Name: dataentryform_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataentryform
    ADD CONSTRAINT dataentryform_pkey PRIMARY KEY (dataentryformid);


--
-- Name: dataentryformtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataentryformtranslations
    ADD CONSTRAINT dataentryformtranslations_pkey PRIMARY KEY (dataentryformid, objecttranslationid);


--
-- Name: dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT dataset_pkey PRIMARY KEY (datasetid);


--
-- Name: datasetattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datasetattributevalues
    ADD CONSTRAINT datasetattributevalues_pkey PRIMARY KEY (datasetid, attributevalueid);


--
-- Name: datasetelement_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datasetelement
    ADD CONSTRAINT datasetelement_pkey PRIMARY KEY (datasetelementid);


--
-- Name: datasetelement_unique_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datasetelement
    ADD CONSTRAINT datasetelement_unique_key UNIQUE (datasetid, dataelementid);


--
-- Name: datasetindicators_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datasetindicators
    ADD CONSTRAINT datasetindicators_pkey PRIMARY KEY (datasetid, indicatorid);


--
-- Name: datasetoperands_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datasetoperands
    ADD CONSTRAINT datasetoperands_pkey PRIMARY KEY (datasetid, dataelementoperandid);


--
-- Name: datasetsectiontranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datasetsectiontranslations
    ADD CONSTRAINT datasetsectiontranslations_pkey PRIMARY KEY (sectionid, objecttranslationid);


--
-- Name: datasetsource_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datasetsource
    ADD CONSTRAINT datasetsource_pkey PRIMARY KEY (datasetid, sourceid);


--
-- Name: datasettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datasettranslations
    ADD CONSTRAINT datasettranslations_pkey PRIMARY KEY (datasetid, objecttranslationid);


--
-- Name: datasetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datasetusergroupaccesses
    ADD CONSTRAINT datasetusergroupaccesses_pkey PRIMARY KEY (datasetid, usergroupaccessid);


--
-- Name: datastatistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datastatistics
    ADD CONSTRAINT datastatistics_pkey PRIMARY KEY (statisticsid);


--
-- Name: datastatisticsevent_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datastatisticsevent
    ADD CONSTRAINT datastatisticsevent_pkey PRIMARY KEY (eventid);


--
-- Name: datavalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datavalue
    ADD CONSTRAINT datavalue_pkey PRIMARY KEY (dataelementid, periodid, sourceid, categoryoptioncomboid, attributeoptioncomboid);


--
-- Name: datavalueaudit_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datavalueaudit
    ADD CONSTRAINT datavalueaudit_pkey PRIMARY KEY (datavalueauditid);


--
-- Name: document_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY document
    ADD CONSTRAINT document_pkey PRIMARY KEY (documentid);


--
-- Name: documentattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY documentattributevalues
    ADD CONSTRAINT documentattributevalues_pkey PRIMARY KEY (documentid, attributevalueid);


--
-- Name: documenttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY documenttranslations
    ADD CONSTRAINT documenttranslations_pkey PRIMARY KEY (documentid, objecttranslationid);


--
-- Name: documentusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY documentusergroupaccesses
    ADD CONSTRAINT documentusergroupaccesses_pkey PRIMARY KEY (documentid, usergroupaccessid);


--
-- Name: eventchart_attributedimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchart_attributedimensions
    ADD CONSTRAINT eventchart_attributedimensions_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchart_columns
    ADD CONSTRAINT eventchart_columns_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_dataelementdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchart_dataelementdimensions
    ADD CONSTRAINT eventchart_dataelementdimensions_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchart_filters
    ADD CONSTRAINT eventchart_filters_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_itemorgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchart_itemorgunitgroups
    ADD CONSTRAINT eventchart_itemorgunitgroups_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchart_organisationunits
    ADD CONSTRAINT eventchart_organisationunits_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_orgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchart_orgunitgroups
    ADD CONSTRAINT eventchart_orgunitgroups_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_orgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchart_orgunitlevels
    ADD CONSTRAINT eventchart_orgunitlevels_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchart_periods
    ADD CONSTRAINT eventchart_periods_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT eventchart_pkey PRIMARY KEY (eventchartid);


--
-- Name: eventchart_programindicatordimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchart_programindicatordimensions
    ADD CONSTRAINT eventchart_programindicatordimensions_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventchart_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchart_rows
    ADD CONSTRAINT eventchart_rows_pkey PRIMARY KEY (eventchartid, sort_order);


--
-- Name: eventcharttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventcharttranslations
    ADD CONSTRAINT eventcharttranslations_pkey PRIMARY KEY (eventchartid, objecttranslationid);


--
-- Name: eventchartusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchartusergroupaccesses
    ADD CONSTRAINT eventchartusergroupaccesses_pkey PRIMARY KEY (eventchartid, usergroupaccessid);


--
-- Name: eventreport_attributedimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreport_attributedimensions
    ADD CONSTRAINT eventreport_attributedimensions_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreport_columns
    ADD CONSTRAINT eventreport_columns_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_dataelementdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreport_dataelementdimensions
    ADD CONSTRAINT eventreport_dataelementdimensions_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreport_filters
    ADD CONSTRAINT eventreport_filters_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_itemorgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreport_itemorgunitgroups
    ADD CONSTRAINT eventreport_itemorgunitgroups_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreport_organisationunits
    ADD CONSTRAINT eventreport_organisationunits_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_orgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreport_orgunitgroups
    ADD CONSTRAINT eventreport_orgunitgroups_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_orgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreport_orgunitlevels
    ADD CONSTRAINT eventreport_orgunitlevels_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreport_periods
    ADD CONSTRAINT eventreport_periods_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT eventreport_pkey PRIMARY KEY (eventreportid);


--
-- Name: eventreport_programindicatordimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreport_programindicatordimensions
    ADD CONSTRAINT eventreport_programindicatordimensions_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreport_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreport_rows
    ADD CONSTRAINT eventreport_rows_pkey PRIMARY KEY (eventreportid, sort_order);


--
-- Name: eventreporttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreporttranslations
    ADD CONSTRAINT eventreporttranslations_pkey PRIMARY KEY (eventreportid, objecttranslationid);


--
-- Name: eventreportusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreportusergroupaccesses
    ADD CONSTRAINT eventreportusergroupaccesses_pkey PRIMARY KEY (eventreportid, usergroupaccessid);


--
-- Name: expression_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY expression
    ADD CONSTRAINT expression_pkey PRIMARY KEY (expressionid);


--
-- Name: expressiondataelement_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY expressiondataelement
    ADD CONSTRAINT expressiondataelement_pkey PRIMARY KEY (expressionid, dataelementid);


--
-- Name: expressionsampleelement_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY expressionsampleelement
    ADD CONSTRAINT expressionsampleelement_pkey PRIMARY KEY (expressionid, dataelementid);


--
-- Name: externalfileresource_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY externalfileresource
    ADD CONSTRAINT externalfileresource_pkey PRIMARY KEY (externalfileresourceid);


--
-- Name: externalmaplayer_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY externalmaplayer
    ADD CONSTRAINT externalmaplayer_pkey PRIMARY KEY (externalmaplayerid);


--
-- Name: externalmaplayerusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY externalmaplayerusergroupaccesses
    ADD CONSTRAINT externalmaplayerusergroupaccesses_pkey PRIMARY KEY (externalmaplayerid, usergroupaccessid);


--
-- Name: fileresource_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fileresource
    ADD CONSTRAINT fileresource_pkey PRIMARY KEY (fileresourceid);


--
-- Name: i18nlocale_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY i18nlocale
    ADD CONSTRAINT i18nlocale_pkey PRIMARY KEY (i18nlocaleid);


--
-- Name: incomingsms_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY incomingsms
    ADD CONSTRAINT incomingsms_pkey PRIMARY KEY (id);


--
-- Name: indicator_code_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicator
    ADD CONSTRAINT indicator_code_key UNIQUE (code);


--
-- Name: indicator_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicator
    ADD CONSTRAINT indicator_pkey PRIMARY KEY (indicatorid);


--
-- Name: indicatorattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatorattributevalues
    ADD CONSTRAINT indicatorattributevalues_pkey PRIMARY KEY (indicatorid, attributevalueid);


--
-- Name: indicatorgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatorgroup
    ADD CONSTRAINT indicatorgroup_pkey PRIMARY KEY (indicatorgroupid);


--
-- Name: indicatorgroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatorgroupattributevalues
    ADD CONSTRAINT indicatorgroupattributevalues_pkey PRIMARY KEY (indicatorgroupid, attributevalueid);


--
-- Name: indicatorgroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatorgroupmembers
    ADD CONSTRAINT indicatorgroupmembers_pkey PRIMARY KEY (indicatorgroupid, indicatorid);


--
-- Name: indicatorgroupset_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatorgroupset
    ADD CONSTRAINT indicatorgroupset_pkey PRIMARY KEY (indicatorgroupsetid);


--
-- Name: indicatorgroupsetmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatorgroupsetmembers
    ADD CONSTRAINT indicatorgroupsetmembers_pkey PRIMARY KEY (indicatorgroupsetid, sort_order);


--
-- Name: indicatorgroupsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatorgroupsettranslations
    ADD CONSTRAINT indicatorgroupsettranslations_pkey PRIMARY KEY (indicatorgroupsetid, objecttranslationid);


--
-- Name: indicatorgroupsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatorgroupsetusergroupaccesses
    ADD CONSTRAINT indicatorgroupsetusergroupaccesses_pkey PRIMARY KEY (indicatorgroupsetid, usergroupaccessid);


--
-- Name: indicatorgrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatorgrouptranslations
    ADD CONSTRAINT indicatorgrouptranslations_pkey PRIMARY KEY (indicatorgroupid, objecttranslationid);


--
-- Name: indicatorgroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatorgroupusergroupaccesses
    ADD CONSTRAINT indicatorgroupusergroupaccesses_pkey PRIMARY KEY (indicatorgroupid, usergroupaccessid);


--
-- Name: indicatortranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatortranslations
    ADD CONSTRAINT indicatortranslations_pkey PRIMARY KEY (indicatorid, objecttranslationid);


--
-- Name: indicatortype_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatortype
    ADD CONSTRAINT indicatortype_pkey PRIMARY KEY (indicatortypeid);


--
-- Name: indicatortypetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatortypetranslations
    ADD CONSTRAINT indicatortypetranslations_pkey PRIMARY KEY (indicatortypeid, objecttranslationid);


--
-- Name: indicatorusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatorusergroupaccesses
    ADD CONSTRAINT indicatorusergroupaccesses_pkey PRIMARY KEY (indicatorid, usergroupaccessid);


--
-- Name: intepretation_likedby_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY intepretation_likedby
    ADD CONSTRAINT intepretation_likedby_pkey PRIMARY KEY (interpretationid, userid);


--
-- Name: interpretation_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY interpretation_comments
    ADD CONSTRAINT interpretation_comments_pkey PRIMARY KEY (interpretationid, sort_order);


--
-- Name: interpretation_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT interpretation_pkey PRIMARY KEY (interpretationid);


--
-- Name: interpretationcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY interpretationcomment
    ADD CONSTRAINT interpretationcomment_pkey PRIMARY KEY (interpretationcommentid);


--
-- Name: interpretationusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY interpretationusergroupaccesses
    ADD CONSTRAINT interpretationusergroupaccesses_pkey PRIMARY KEY (interpretationid, usergroupaccessid);


--
-- Name: key_sectionnamedataset; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY section
    ADD CONSTRAINT key_sectionnamedataset UNIQUE (name, datasetid);


--
-- Name: keyjsonvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY keyjsonvalue
    ADD CONSTRAINT keyjsonvalue_pkey PRIMARY KEY (keyjsonvalueid);


--
-- Name: keyjsonvalue_unique_key_in_namespace; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY keyjsonvalue
    ADD CONSTRAINT keyjsonvalue_unique_key_in_namespace UNIQUE (namespace, namespacekey);


--
-- Name: legendsetattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY legendsetattributevalues
    ADD CONSTRAINT legendsetattributevalues_pkey PRIMARY KEY (legendsetid, attributevalueid);


--
-- Name: legendsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY legendsetusergroupaccesses
    ADD CONSTRAINT legendsetusergroupaccesses_pkey PRIMARY KEY (maplegendsetid, usergroupaccessid);


--
-- Name: lockexception_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lockexception
    ADD CONSTRAINT lockexception_pkey PRIMARY KEY (lockexceptionid);


--
-- Name: map_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY map
    ADD CONSTRAINT map_pkey PRIMARY KEY (mapid);


--
-- Name: maplegend_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY maplegend
    ADD CONSTRAINT maplegend_pkey PRIMARY KEY (maplegendid);


--
-- Name: maplegendset_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY maplegendset
    ADD CONSTRAINT maplegendset_pkey PRIMARY KEY (maplegendsetid);


--
-- Name: maplegendsetmaplegend_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY maplegendsetmaplegend
    ADD CONSTRAINT maplegendsetmaplegend_pkey PRIMARY KEY (legendsetid, maplegendid);


--
-- Name: maplegendsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY maplegendsettranslations
    ADD CONSTRAINT maplegendsettranslations_pkey PRIMARY KEY (maplegendsetid, objecttranslationid);


--
-- Name: maplegendtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY maplegendtranslations
    ADD CONSTRAINT maplegendtranslations_pkey PRIMARY KEY (maplegendid, objecttranslationid);


--
-- Name: mapmapviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mapmapviews
    ADD CONSTRAINT mapmapviews_pkey PRIMARY KEY (mapid, sort_order);


--
-- Name: mapusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mapusergroupaccesses
    ADD CONSTRAINT mapusergroupaccesses_pkey PRIMARY KEY (mapid, usergroupaccessid);


--
-- Name: mapview_attributedimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mapview_attributedimensions
    ADD CONSTRAINT mapview_attributedimensions_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mapview_columns
    ADD CONSTRAINT mapview_columns_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_datadimensionitems_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mapview_datadimensionitems
    ADD CONSTRAINT mapview_datadimensionitems_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_dataelementdimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mapview_dataelementdimensions
    ADD CONSTRAINT mapview_dataelementdimensions_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_itemorgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mapview_itemorgunitgroups
    ADD CONSTRAINT mapview_itemorgunitgroups_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mapview_organisationunits
    ADD CONSTRAINT mapview_organisationunits_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_orgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mapview_orgunitlevels
    ADD CONSTRAINT mapview_orgunitlevels_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mapview_periods
    ADD CONSTRAINT mapview_periods_pkey PRIMARY KEY (mapviewid, sort_order);


--
-- Name: mapview_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT mapview_pkey PRIMARY KEY (mapviewid);


--
-- Name: mapviewtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mapviewtranslations
    ADD CONSTRAINT mapviewtranslations_pkey PRIMARY KEY (mapviewid, objecttranslationid);


--
-- Name: message_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY message
    ADD CONSTRAINT message_pkey PRIMARY KEY (messageid);


--
-- Name: messageconversation_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY messageconversation_messages
    ADD CONSTRAINT messageconversation_messages_pkey PRIMARY KEY (messageconversationid, sort_order);


--
-- Name: messageconversation_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY messageconversation
    ADD CONSTRAINT messageconversation_pkey PRIMARY KEY (messageconversationid);


--
-- Name: messageconversation_usermessages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY messageconversation_usermessages
    ADD CONSTRAINT messageconversation_usermessages_pkey PRIMARY KEY (messageconversationid, usermessageid);


--
-- Name: metadataversion_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY metadataversion
    ADD CONSTRAINT metadataversion_pkey PRIMARY KEY (versionid);


--
-- Name: minmaxdataelement_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY minmaxdataelement
    ADD CONSTRAINT minmaxdataelement_pkey PRIMARY KEY (minmaxdataelementid);


--
-- Name: oauth2client_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oauth2client
    ADD CONSTRAINT oauth2client_pkey PRIMARY KEY (oauth2clientid);


--
-- Name: oauth2clientgranttypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oauth2clientgranttypes
    ADD CONSTRAINT oauth2clientgranttypes_pkey PRIMARY KEY (oauth2clientid, sort_order);


--
-- Name: oauth2clientredirecturis_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oauth2clientredirecturis
    ADD CONSTRAINT oauth2clientredirecturis_pkey PRIMARY KEY (oauth2clientid, sort_order);


--
-- Name: oauth_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oauth_access_token
    ADD CONSTRAINT oauth_access_token_pkey PRIMARY KEY (authentication_id);


--
-- Name: objecttranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY objecttranslation
    ADD CONSTRAINT objecttranslation_pkey PRIMARY KEY (objecttranslationid);


--
-- Name: optionattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optionattributevalues
    ADD CONSTRAINT optionattributevalues_pkey PRIMARY KEY (optionvalueid, attributevalueid);


--
-- Name: optiongroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroup
    ADD CONSTRAINT optiongroup_pkey PRIMARY KEY (optiongroupid);


--
-- Name: optiongroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroupattributevalues
    ADD CONSTRAINT optiongroupattributevalues_pkey PRIMARY KEY (optiongroupid, attributevalueid);


--
-- Name: optiongroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroupmembers
    ADD CONSTRAINT optiongroupmembers_pkey PRIMARY KEY (optiongroupid, optionid);


--
-- Name: optiongroupset_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroupset
    ADD CONSTRAINT optiongroupset_pkey PRIMARY KEY (optiongroupsetid);


--
-- Name: optiongroupsetmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroupsetmembers
    ADD CONSTRAINT optiongroupsetmembers_pkey PRIMARY KEY (optiongroupsetid, sort_order);


--
-- Name: optiongroupsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroupsettranslations
    ADD CONSTRAINT optiongroupsettranslations_pkey PRIMARY KEY (optiongroupsetid, objecttranslationid);


--
-- Name: optiongroupsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroupsetusergroupaccesses
    ADD CONSTRAINT optiongroupsetusergroupaccesses_pkey PRIMARY KEY (optiongroupsetid, usergroupaccessid);


--
-- Name: optiongrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongrouptranslations
    ADD CONSTRAINT optiongrouptranslations_pkey PRIMARY KEY (optiongroupid, objecttranslationid);


--
-- Name: optiongroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroupusergroupaccesses
    ADD CONSTRAINT optiongroupusergroupaccesses_pkey PRIMARY KEY (optiongroupid, usergroupaccessid);


--
-- Name: optionset_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optionset
    ADD CONSTRAINT optionset_pkey PRIMARY KEY (optionsetid);


--
-- Name: optionsetattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optionsetattributevalues
    ADD CONSTRAINT optionsetattributevalues_pkey PRIMARY KEY (optionsetid, attributevalueid);


--
-- Name: optionsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optionsettranslations
    ADD CONSTRAINT optionsettranslations_pkey PRIMARY KEY (optionsetid, objecttranslationid);


--
-- Name: optionsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optionsetusergroupaccesses
    ADD CONSTRAINT optionsetusergroupaccesses_pkey PRIMARY KEY (optionsetid, usergroupaccessid);


--
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (optionvalueid);


--
-- Name: optionvaluetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optionvaluetranslations
    ADD CONSTRAINT optionvaluetranslations_pkey PRIMARY KEY (optionvalueid, objecttranslationid);


--
-- Name: organisationunit_code_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organisationunit
    ADD CONSTRAINT organisationunit_code_key UNIQUE (code);


--
-- Name: organisationunit_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organisationunit
    ADD CONSTRAINT organisationunit_pkey PRIMARY KEY (organisationunitid);


--
-- Name: organisationunitattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organisationunitattributevalues
    ADD CONSTRAINT organisationunitattributevalues_pkey PRIMARY KEY (organisationunitid, attributevalueid);


--
-- Name: organisationunittranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organisationunittranslations
    ADD CONSTRAINT organisationunittranslations_pkey PRIMARY KEY (organisationunitid, objecttranslationid);


--
-- Name: orgunitgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroup
    ADD CONSTRAINT orgunitgroup_name_key UNIQUE (name);


--
-- Name: orgunitgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroup
    ADD CONSTRAINT orgunitgroup_pkey PRIMARY KEY (orgunitgroupid);


--
-- Name: orgunitgroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroupattributevalues
    ADD CONSTRAINT orgunitgroupattributevalues_pkey PRIMARY KEY (orgunitgroupid, attributevalueid);


--
-- Name: orgunitgroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroupmembers
    ADD CONSTRAINT orgunitgroupmembers_pkey PRIMARY KEY (orgunitgroupid, organisationunitid);


--
-- Name: orgunitgroupset_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroupset
    ADD CONSTRAINT orgunitgroupset_name_key UNIQUE (name);


--
-- Name: orgunitgroupset_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroupset
    ADD CONSTRAINT orgunitgroupset_pkey PRIMARY KEY (orgunitgroupsetid);


--
-- Name: orgunitgroupsetattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroupsetattributevalues
    ADD CONSTRAINT orgunitgroupsetattributevalues_pkey PRIMARY KEY (orgunitgroupsetid, attributevalueid);


--
-- Name: orgunitgroupsetmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroupsetmembers
    ADD CONSTRAINT orgunitgroupsetmembers_pkey PRIMARY KEY (orgunitgroupsetid, orgunitgroupid);


--
-- Name: orgunitgroupsettranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroupsettranslations
    ADD CONSTRAINT orgunitgroupsettranslations_pkey PRIMARY KEY (orgunitgroupsetid, objecttranslationid);


--
-- Name: orgunitgroupsetusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroupsetusergroupaccesses
    ADD CONSTRAINT orgunitgroupsetusergroupaccesses_pkey PRIMARY KEY (orgunitgroupsetid, usergroupaccessid);


--
-- Name: orgunitgrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgrouptranslations
    ADD CONSTRAINT orgunitgrouptranslations_pkey PRIMARY KEY (orgunitgroupid, objecttranslationid);


--
-- Name: orgunitgroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroupusergroupaccesses
    ADD CONSTRAINT orgunitgroupusergroupaccesses_pkey PRIMARY KEY (orgunitgroupid, usergroupaccessid);


--
-- Name: orgunitlevel_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitlevel
    ADD CONSTRAINT orgunitlevel_pkey PRIMARY KEY (orgunitlevelid);


--
-- Name: orgunitleveltranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitleveltranslations
    ADD CONSTRAINT orgunitleveltranslations_pkey PRIMARY KEY (orgunitlevelid, objecttranslationid);


--
-- Name: outbound_sms_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY outbound_sms
    ADD CONSTRAINT outbound_sms_pkey PRIMARY KEY (id);


--
-- Name: period_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY period
    ADD CONSTRAINT period_pkey PRIMARY KEY (periodid);


--
-- Name: periodtype_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY periodtype
    ADD CONSTRAINT periodtype_pkey PRIMARY KEY (periodtypeid);


--
-- Name: predictor_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT predictor_pkey PRIMARY KEY (predictorid);


--
-- Name: predictororgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY predictororgunitlevels
    ADD CONSTRAINT predictororgunitlevels_pkey PRIMARY KEY (predictorid, orgunitlevelid);


--
-- Name: program_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY program_attributes
    ADD CONSTRAINT program_attributes_pkey PRIMARY KEY (programtrackedentityattributeid);


--
-- Name: program_criteria_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY program_criteria
    ADD CONSTRAINT program_criteria_pkey PRIMARY KEY (programid, validationcriteriaid);


--
-- Name: program_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY program_organisationunits
    ADD CONSTRAINT program_organisationunits_pkey PRIMARY KEY (programid, organisationunitid);


--
-- Name: program_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY program
    ADD CONSTRAINT program_pkey PRIMARY KEY (programid);


--
-- Name: program_userroles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY program_userroles
    ADD CONSTRAINT program_userroles_pkey PRIMARY KEY (userroleid, programid);


--
-- Name: programattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programattributevalues
    ADD CONSTRAINT programattributevalues_pkey PRIMARY KEY (programid, attributevalueid);


--
-- Name: programdataelement_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programdataelement
    ADD CONSTRAINT programdataelement_pkey PRIMARY KEY (programdataelementid);


--
-- Name: programdataelement_unique_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programdataelement
    ADD CONSTRAINT programdataelement_unique_key UNIQUE (programid, dataelementid);


--
-- Name: programdataelementtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programdataelementtranslations
    ADD CONSTRAINT programdataelementtranslations_pkey PRIMARY KEY (programdataelementid, objecttranslationid);


--
-- Name: programexpression_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programexpression
    ADD CONSTRAINT programexpression_pkey PRIMARY KEY (programexpressionid);


--
-- Name: programindicator_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programindicator
    ADD CONSTRAINT programindicator_pkey PRIMARY KEY (programindicatorid);


--
-- Name: programindicatorattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programindicatorattributevalues
    ADD CONSTRAINT programindicatorattributevalues_pkey PRIMARY KEY (programindicatorid, attributevalueid);


--
-- Name: programindicatorgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programindicatorgroup
    ADD CONSTRAINT programindicatorgroup_pkey PRIMARY KEY (programindicatorgroupid);


--
-- Name: programindicatorgroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programindicatorgroupattributevalues
    ADD CONSTRAINT programindicatorgroupattributevalues_pkey PRIMARY KEY (programindicatorgroupid, attributevalueid);


--
-- Name: programindicatorgroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programindicatorgroupmembers
    ADD CONSTRAINT programindicatorgroupmembers_pkey PRIMARY KEY (programindicatorgroupid, programindicatorid);


--
-- Name: programindicatorgrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programindicatorgrouptranslations
    ADD CONSTRAINT programindicatorgrouptranslations_pkey PRIMARY KEY (programindicatorgroupid, objecttranslationid);


--
-- Name: programindicatorgroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programindicatorgroupusergroupaccesses
    ADD CONSTRAINT programindicatorgroupusergroupaccesses_pkey PRIMARY KEY (programindicatorgroupid, usergroupaccessid);


--
-- Name: programindicatortranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programindicatortranslations
    ADD CONSTRAINT programindicatortranslations_pkey PRIMARY KEY (programindicatorid, objecttranslationid);


--
-- Name: programindicatorusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programindicatorusergroupaccesses
    ADD CONSTRAINT programindicatorusergroupaccesses_pkey PRIMARY KEY (programindicatorid, usergroupaccessid);


--
-- Name: programinstance_messageconversation_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programinstance_messageconversation
    ADD CONSTRAINT programinstance_messageconversation_pkey PRIMARY KEY (programinstanceid, sort_order);


--
-- Name: programinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programinstance
    ADD CONSTRAINT programinstance_pkey PRIMARY KEY (programinstanceid);


--
-- Name: programinstancecomments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programinstancecomments
    ADD CONSTRAINT programinstancecomments_pkey PRIMARY KEY (programinstanceid, sort_order);


--
-- Name: programmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programmessage
    ADD CONSTRAINT programmessage_pkey PRIMARY KEY (id);


--
-- Name: programmessagetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programmessagetranslations
    ADD CONSTRAINT programmessagetranslations_pkey PRIMARY KEY (id, objecttranslationid);


--
-- Name: programnotificationtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programnotificationtemplate
    ADD CONSTRAINT programnotificationtemplate_pkey PRIMARY KEY (programnotificationtemplateid);


--
-- Name: programrule_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programrule
    ADD CONSTRAINT programrule_pkey PRIMARY KEY (programruleid);


--
-- Name: programruleaction_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT programruleaction_pkey PRIMARY KEY (programruleactionid);


--
-- Name: programruletranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programruletranslations
    ADD CONSTRAINT programruletranslations_pkey PRIMARY KEY (programruleid, objecttranslationid);


--
-- Name: programrulevariable_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programrulevariable
    ADD CONSTRAINT programrulevariable_pkey PRIMARY KEY (programrulevariableid);


--
-- Name: programstage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstage
    ADD CONSTRAINT programstage_pkey PRIMARY KEY (programstageid);


--
-- Name: programstageattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstageattributevalues
    ADD CONSTRAINT programstageattributevalues_pkey PRIMARY KEY (programstageid, attributevalueid);


--
-- Name: programstagedataelement_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstagedataelement
    ADD CONSTRAINT programstagedataelement_pkey PRIMARY KEY (programstagedataelementid);


--
-- Name: programstagedataelement_unique_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstagedataelement
    ADD CONSTRAINT programstagedataelement_unique_key UNIQUE (programstageid, dataelementid);


--
-- Name: programstageinstance_messageconversation_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstageinstance_messageconversation
    ADD CONSTRAINT programstageinstance_messageconversation_pkey PRIMARY KEY (programstageinstanceid, sort_order);


--
-- Name: programstageinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstageinstance
    ADD CONSTRAINT programstageinstance_pkey PRIMARY KEY (programstageinstanceid);


--
-- Name: programstageinstancecomments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstageinstancecomments
    ADD CONSTRAINT programstageinstancecomments_pkey PRIMARY KEY (programstageinstanceid, sort_order);


--
-- Name: programstagesection_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstagesection
    ADD CONSTRAINT programstagesection_pkey PRIMARY KEY (programstagesectionid);


--
-- Name: programstagesection_programindicators_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstagesection_programindicators
    ADD CONSTRAINT programstagesection_programindicators_pkey PRIMARY KEY (programstagesectionid, sort_order);


--
-- Name: programstagesectiontranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstagesectiontranslations
    ADD CONSTRAINT programstagesectiontranslations_pkey PRIMARY KEY (programstagesectionid, objecttranslationid);


--
-- Name: programstagetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstagetranslations
    ADD CONSTRAINT programstagetranslations_pkey PRIMARY KEY (programstageid, objecttranslationid);


--
-- Name: programtrackedentityattribute_unique_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY program_attributes
    ADD CONSTRAINT programtrackedentityattribute_unique_key UNIQUE (programid, trackedentityattributeid);


--
-- Name: programtranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programtranslations
    ADD CONSTRAINT programtranslations_pkey PRIMARY KEY (programid, objecttranslationid);


--
-- Name: programusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programusergroupaccesses
    ADD CONSTRAINT programusergroupaccesses_pkey PRIMARY KEY (programid, usergroupaccessid);


--
-- Name: pushanalysis_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pushanalysis
    ADD CONSTRAINT pushanalysis_pkey PRIMARY KEY (pushanalysisid);


--
-- Name: pushanalysisrecipientusergroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pushanalysisrecipientusergroups
    ADD CONSTRAINT pushanalysisrecipientusergroups_pkey PRIMARY KEY (usergroupid, elt);


--
-- Name: relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relationship
    ADD CONSTRAINT relationship_pkey PRIMARY KEY (relationshipid);


--
-- Name: relationshiptype_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relationshiptype
    ADD CONSTRAINT relationshiptype_pkey PRIMARY KEY (relationshiptypeid);


--
-- Name: relationshiptypetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relationshiptypetranslations
    ADD CONSTRAINT relationshiptypetranslations_pkey PRIMARY KEY (relationshiptypeid, objecttranslationid);


--
-- Name: relativeperiods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relativeperiods
    ADD CONSTRAINT relativeperiods_pkey PRIMARY KEY (relativeperiodsid);


--
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (reportid);


--
-- Name: reporttable_categorydimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable_categorydimensions
    ADD CONSTRAINT reporttable_categorydimensions_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_categoryoptiongroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable_categoryoptiongroups
    ADD CONSTRAINT reporttable_categoryoptiongroups_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable_columns
    ADD CONSTRAINT reporttable_columns_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_datadimensionitems_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable_datadimensionitems
    ADD CONSTRAINT reporttable_datadimensionitems_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_dataelementgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable_dataelementgroups
    ADD CONSTRAINT reporttable_dataelementgroups_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable_filters
    ADD CONSTRAINT reporttable_filters_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_itemorgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable_itemorgunitgroups
    ADD CONSTRAINT reporttable_itemorgunitgroups_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_organisationunits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable_organisationunits
    ADD CONSTRAINT reporttable_organisationunits_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_orgunitgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable_orgunitgroups
    ADD CONSTRAINT reporttable_orgunitgroups_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_orgunitlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable_orgunitlevels
    ADD CONSTRAINT reporttable_orgunitlevels_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable_periods
    ADD CONSTRAINT reporttable_periods_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttable_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable
    ADD CONSTRAINT reporttable_pkey PRIMARY KEY (reporttableid);


--
-- Name: reporttable_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable_rows
    ADD CONSTRAINT reporttable_rows_pkey PRIMARY KEY (reporttableid, sort_order);


--
-- Name: reporttabletranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttabletranslations
    ADD CONSTRAINT reporttabletranslations_pkey PRIMARY KEY (reporttableid, objecttranslationid);


--
-- Name: reporttableusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttableusergroupaccesses
    ADD CONSTRAINT reporttableusergroupaccesses_pkey PRIMARY KEY (reporttableid, usergroupaccessid);


--
-- Name: reporttranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttranslations
    ADD CONSTRAINT reporttranslations_pkey PRIMARY KEY (reportid, objecttranslationid);


--
-- Name: reportusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reportusergroupaccesses
    ADD CONSTRAINT reportusergroupaccesses_pkey PRIMARY KEY (reportid, usergroupaccessid);


--
-- Name: section_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY section
    ADD CONSTRAINT section_pkey PRIMARY KEY (sectionid);


--
-- Name: sectionattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sectionattributevalues
    ADD CONSTRAINT sectionattributevalues_pkey PRIMARY KEY (sectionid, attributevalueid);


--
-- Name: sectiondataelements_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sectiondataelements
    ADD CONSTRAINT sectiondataelements_pkey PRIMARY KEY (sectionid, sort_order);


--
-- Name: sectiongreyedfields_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sectiongreyedfields
    ADD CONSTRAINT sectiongreyedfields_pkey PRIMARY KEY (sectionid, dataelementoperandid);


--
-- Name: sectionindicators_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sectionindicators
    ADD CONSTRAINT sectionindicators_pkey PRIMARY KEY (sectionid, sort_order);


--
-- Name: smscodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY smscodes
    ADD CONSTRAINT smscodes_pkey PRIMARY KEY (smscodeid);


--
-- Name: smscommandcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY smscommandcodes
    ADD CONSTRAINT smscommandcodes_pkey PRIMARY KEY (id, codeid);


--
-- Name: smscommands_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY smscommands
    ADD CONSTRAINT smscommands_pkey PRIMARY KEY (smscommandid);


--
-- Name: smscommandspecialcharacters_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY smscommandspecialcharacters
    ADD CONSTRAINT smscommandspecialcharacters_pkey PRIMARY KEY (smscommandid, specialcharacterid);


--
-- Name: smsspecialcharacter_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY smsspecialcharacter
    ADD CONSTRAINT smsspecialcharacter_pkey PRIMARY KEY (specialcharacterid);


--
-- Name: sqlview_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sqlview
    ADD CONSTRAINT sqlview_pkey PRIMARY KEY (sqlviewid);


--
-- Name: sqlviewattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sqlviewattributevalues
    ADD CONSTRAINT sqlviewattributevalues_pkey PRIMARY KEY (sqlviewid, attributevalueid);


--
-- Name: sqlviewusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sqlviewusergroupaccesses
    ADD CONSTRAINT sqlviewusergroupaccesses_pkey PRIMARY KEY (sqlviewid, usergroupaccessid);


--
-- Name: systemsetting_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY systemsetting
    ADD CONSTRAINT systemsetting_pkey PRIMARY KEY (systemsettingid);


--
-- Name: trackedentity_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentity
    ADD CONSTRAINT trackedentity_pkey PRIMARY KEY (trackedentityid);


--
-- Name: trackedentityattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT trackedentityattribute_pkey PRIMARY KEY (trackedentityattributeid);


--
-- Name: trackedentityattributeattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattributeattributevalues
    ADD CONSTRAINT trackedentityattributeattributevalues_pkey PRIMARY KEY (trackedentityattributeid, attributevalueid);


--
-- Name: trackedentityattributedimension_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattributedimension
    ADD CONSTRAINT trackedentityattributedimension_pkey PRIMARY KEY (trackedentityattributedimensionid);


--
-- Name: trackedentityattributegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattributegroup
    ADD CONSTRAINT trackedentityattributegroup_pkey PRIMARY KEY (trackedentityattributegroupid);


--
-- Name: trackedentityattributegrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattributegrouptranslations
    ADD CONSTRAINT trackedentityattributegrouptranslations_pkey PRIMARY KEY (trackedentityattributegroupid, objecttranslationid);


--
-- Name: trackedentityattributereservedvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattributereservedvalue
    ADD CONSTRAINT trackedentityattributereservedvalue_pkey PRIMARY KEY (trackedentityattributereservedvalueid);


--
-- Name: trackedentityattributetranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattributetranslations
    ADD CONSTRAINT trackedentityattributetranslations_pkey PRIMARY KEY (trackedentityattributeid, objecttranslationid);


--
-- Name: trackedentityattributeusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattributeusergroupaccesses
    ADD CONSTRAINT trackedentityattributeusergroupaccesses_pkey PRIMARY KEY (trackedentityattributeid, usergroupaccessid);


--
-- Name: trackedentityattributevalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattributevalue
    ADD CONSTRAINT trackedentityattributevalue_pkey PRIMARY KEY (trackedentityinstanceid, trackedentityattributeid);


--
-- Name: trackedentityattributevalueaudit_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattributevalueaudit
    ADD CONSTRAINT trackedentityattributevalueaudit_pkey PRIMARY KEY (trackedentityattributevalueauditid);


--
-- Name: trackedentityattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattributevalues
    ADD CONSTRAINT trackedentityattributevalues_pkey PRIMARY KEY (trackedentityid, attributevalueid);


--
-- Name: trackedentitycomment_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentitycomment
    ADD CONSTRAINT trackedentitycomment_pkey PRIMARY KEY (trackedentitycommentid);


--
-- Name: trackedentitydataelementdimension_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentitydataelementdimension
    ADD CONSTRAINT trackedentitydataelementdimension_pkey PRIMARY KEY (trackedentitydataelementdimensionid);


--
-- Name: trackedentitydatavalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentitydatavalue
    ADD CONSTRAINT trackedentitydatavalue_pkey PRIMARY KEY (programstageinstanceid, dataelementid);


--
-- Name: trackedentitydatavalueaudit_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentitydatavalueaudit
    ADD CONSTRAINT trackedentitydatavalueaudit_pkey PRIMARY KEY (trackedentitydatavalueauditid);


--
-- Name: trackedentityinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityinstance
    ADD CONSTRAINT trackedentityinstance_pkey PRIMARY KEY (trackedentityinstanceid);


--
-- Name: trackedentityprogramindicatordimension_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityprogramindicatordimension
    ADD CONSTRAINT trackedentityprogramindicatordimension_pkey PRIMARY KEY (trackedentityprogramindicatordimensionid);


--
-- Name: trackedentitytranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentitytranslations
    ADD CONSTRAINT trackedentitytranslations_pkey PRIMARY KEY (trackedentityid, objecttranslationid);


--
-- Name: uk_13x63e3skbl5qj4mc1qgq2xex; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationrule
    ADD CONSTRAINT uk_13x63e3skbl5qj4mc1qgq2xex UNIQUE (code);


--
-- Name: uk_1774shfid1uaopl9tu8am19fq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY attribute
    ADD CONSTRAINT uk_1774shfid1uaopl9tu8am19fq UNIQUE (code);


--
-- Name: uk_18b68rcofdwt1sbr6rf55poog; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT uk_18b68rcofdwt1sbr6rf55poog UNIQUE (uid);


--
-- Name: uk_1dw8gju4leg7iud4gpsr5r1ng; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT uk_1dw8gju4leg7iud4gpsr5r1ng UNIQUE (uid);


--
-- Name: uk_1ev6xqtcsfr4wv6rel0lkg44n; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementcategory
    ADD CONSTRAINT uk_1ev6xqtcsfr4wv6rel0lkg44n UNIQUE (uid);


--
-- Name: uk_1ie06vhy3begtwuuvrv0f71se; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY report
    ADD CONSTRAINT uk_1ie06vhy3begtwuuvrv0f71se UNIQUE (uid);


--
-- Name: uk_1lvk8ftq028jrr28qouou9q3c; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationrulegroup
    ADD CONSTRAINT uk_1lvk8ftq028jrr28qouou9q3c UNIQUE (code);


--
-- Name: uk_1qlw3rts2pog96ye7r6fqd122; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programmessage
    ADD CONSTRAINT uk_1qlw3rts2pog96ye7r6fqd122 UNIQUE (uid);


--
-- Name: uk_1sp445tglu49hyfwokjqn5bf6; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chart
    ADD CONSTRAINT uk_1sp445tglu49hyfwokjqn5bf6 UNIQUE (uid);


--
-- Name: uk_1tcaydw2p91wi8ib0qqa1jcfs; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY program
    ADD CONSTRAINT uk_1tcaydw2p91wi8ib0qqa1jcfs UNIQUE (shortname);


--
-- Name: uk_1xk8j7j0a3li8o0ukblanosky; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgroupset
    ADD CONSTRAINT uk_1xk8j7j0a3li8o0ukblanosky UNIQUE (name);


--
-- Name: uk_22wt9yk9idujmywno44v9qf66; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstagesection
    ADD CONSTRAINT uk_22wt9yk9idujmywno44v9qf66 UNIQUE (code);


--
-- Name: uk_2boebaetgus89t1k8nn4dac65; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroupset
    ADD CONSTRAINT uk_2boebaetgus89t1k8nn4dac65 UNIQUE (uid);


--
-- Name: uk_2ejl9l5vm4rhtqj8eit31g0u6; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstagedataelement
    ADD CONSTRAINT uk_2ejl9l5vm4rhtqj8eit31g0u6 UNIQUE (code);


--
-- Name: uk_2l0ovv74pjtairmeyiwy4i2ui; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY i18nlocale
    ADD CONSTRAINT uk_2l0ovv74pjtairmeyiwy4i2ui UNIQUE (uid);


--
-- Name: uk_2nhc265rlfu3dlc3qouvjdprl; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT uk_2nhc265rlfu3dlc3qouvjdprl UNIQUE (name);


--
-- Name: uk_2p9x16ryxtek0g6bqwd49et0c; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programindicatorgroup
    ADD CONSTRAINT uk_2p9x16ryxtek0g6bqwd49et0c UNIQUE (uid);


--
-- Name: uk_2pimmculf9ttu2dxquomb9ram; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programnotificationtemplate
    ADD CONSTRAINT uk_2pimmculf9ttu2dxquomb9ram UNIQUE (uid);


--
-- Name: uk_2r18tvmbtksk69j35uxpwej44; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapprovallevel
    ADD CONSTRAINT uk_2r18tvmbtksk69j35uxpwej44 UNIQUE (code);


--
-- Name: uk_2ubxwwtgyqd0h2mvy46u3prfq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userkeyjsonvalue
    ADD CONSTRAINT uk_2ubxwwtgyqd0h2mvy46u3prfq UNIQUE (code);


--
-- Name: uk_37l2m3o1xfuagpki90gfh5kqb; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY map
    ADD CONSTRAINT uk_37l2m3o1xfuagpki90gfh5kqb UNIQUE (code);


--
-- Name: uk_3a4ee92kxafw85hsopq4qle47; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categorycombo
    ADD CONSTRAINT uk_3a4ee92kxafw85hsopq4qle47 UNIQUE (code);


--
-- Name: uk_3c2n8db21er764e4skh3qg57w; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT uk_3c2n8db21er764e4skh3qg57w UNIQUE (uid);


--
-- Name: uk_3cl2o6ha8naw5w6my3q4el6gk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationrulegroup
    ADD CONSTRAINT uk_3cl2o6ha8naw5w6my3q4el6gk UNIQUE (name);


--
-- Name: uk_3idqsvkpmxpehxqv615s952vd; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT uk_3idqsvkpmxpehxqv615s952vd UNIQUE (uid);


--
-- Name: uk_3phvecdmy2msmcpitqifpcy3c; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroup
    ADD CONSTRAINT uk_3phvecdmy2msmcpitqifpcy3c UNIQUE (code);


--
-- Name: uk_3r6dr8m9qwa89afngtr43x9jh; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT uk_3r6dr8m9qwa89afngtr43x9jh UNIQUE (uid);


--
-- Name: uk_3svwn20y9qda34bmatesg5c0j; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapprovalworkflow
    ADD CONSTRAINT uk_3svwn20y9qda34bmatesg5c0j UNIQUE (code);


--
-- Name: uk_3vgkycs0lsgpxaqtytfijr1ji; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programmessage
    ADD CONSTRAINT uk_3vgkycs0lsgpxaqtytfijr1ji UNIQUE (code);


--
-- Name: uk_478bg522jkn8460hkeshlw1j1; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY report
    ADD CONSTRAINT uk_478bg522jkn8460hkeshlw1j1 UNIQUE (relativeperiodsid);


--
-- Name: uk_4b97sdsm2p477cc05eody10lm; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT uk_4b97sdsm2p477cc05eody10lm UNIQUE (name);


--
-- Name: uk_4dlqoc6s8ilws9yhacy5qkddb; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fileresource
    ADD CONSTRAINT uk_4dlqoc6s8ilws9yhacy5qkddb UNIQUE (code);


--
-- Name: uk_4k3a3mf7dgr4b2btftg5jkmt7; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userkeyjsonvalue
    ADD CONSTRAINT uk_4k3a3mf7dgr4b2btftg5jkmt7 UNIQUE (uid);


--
-- Name: uk_4pi5lfmisrt8un89dnb17xrdy; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementcategoryoption
    ADD CONSTRAINT uk_4pi5lfmisrt8un89dnb17xrdy UNIQUE (uid);


--
-- Name: uk_50aqn6tun6lt4u3ablvdxgoi6; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sqlview
    ADD CONSTRAINT uk_50aqn6tun6lt4u3ablvdxgoi6 UNIQUE (code);


--
-- Name: uk_581ayy658kxytmijcfd2rxnq0; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY externalmaplayer
    ADD CONSTRAINT uk_581ayy658kxytmijcfd2rxnq0 UNIQUE (name);


--
-- Name: uk_59abitsfd3u0jx4ntrrblven0; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programindicator
    ADD CONSTRAINT uk_59abitsfd3u0jx4ntrrblven0 UNIQUE (uid);


--
-- Name: uk_5km0xiwk0dg7pnoru5yfvqsdo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitlevel
    ADD CONSTRAINT uk_5km0xiwk0dg7pnoru5yfvqsdo UNIQUE (uid);


--
-- Name: uk_5mq4bmpyevmr1ddkkopweted1; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapprovallevel
    ADD CONSTRAINT uk_5mq4bmpyevmr1ddkkopweted1 UNIQUE (name);


--
-- Name: uk_5w429v9hdlvivan4a69x3ntx5; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT uk_5w429v9hdlvivan4a69x3ntx5 UNIQUE (relativeperiodsid);


--
-- Name: uk_60p9gh2un0pb7l9tctfd4o3b3; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptioncombo
    ADD CONSTRAINT uk_60p9gh2un0pb7l9tctfd4o3b3 UNIQUE (code);


--
-- Name: uk_64w4wa4oc3hkxo86hjo63cd1x; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY externalmaplayer
    ADD CONSTRAINT uk_64w4wa4oc3hkxo86hjo63cd1x UNIQUE (uid);


--
-- Name: uk_679r4uoqpust6h694bed8nrh9; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT uk_679r4uoqpust6h694bed8nrh9 UNIQUE (uid);


--
-- Name: uk_694heqsv2ixy46tqm3a0q52ev; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datasetelement
    ADD CONSTRAINT uk_694heqsv2ixy46tqm3a0q52ev UNIQUE (uid);


--
-- Name: uk_6dyim42vl218i9e9waqrvw36k; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT uk_6dyim42vl218i9e9waqrvw36k UNIQUE (code);


--
-- Name: uk_6itpx2frqt3msln8p32rk7qta; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongroupset
    ADD CONSTRAINT uk_6itpx2frqt3msln8p32rk7qta UNIQUE (uid);


--
-- Name: uk_6ni8qsiimdcy626hwls002flo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroup
    ADD CONSTRAINT uk_6ni8qsiimdcy626hwls002flo UNIQUE (name);


--
-- Name: uk_6nm3ynkrtuj01bpo1uwcryq06; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT uk_6nm3ynkrtuj01bpo1uwcryq06 UNIQUE (code);


--
-- Name: uk_6npcwcyput5ybrd56d07v9q4m; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datasetelement
    ADD CONSTRAINT uk_6npcwcyput5ybrd56d07v9q4m UNIQUE (code);


--
-- Name: uk_6x37lph70r5mh15a71pf1tj17; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgroup
    ADD CONSTRAINT uk_6x37lph70r5mh15a71pf1tj17 UNIQUE (shortname);


--
-- Name: uk_71vrxovabe8x9tom8xwefi3e7; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_71vrxovabe8x9tom8xwefi3e7 UNIQUE (code);


--
-- Name: uk_7b9jcu4di1s4yxwfrbv790h3o; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programdataelement
    ADD CONSTRAINT uk_7b9jcu4di1s4yxwfrbv790h3o UNIQUE (uid);


--
-- Name: uk_7carnwjb5dtsk6i5dn43wy9ck; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programindicatorgroup
    ADD CONSTRAINT uk_7carnwjb5dtsk6i5dn43wy9ck UNIQUE (name);


--
-- Name: uk_7if26yibpw5hn2gjsrn2xst0m; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable
    ADD CONSTRAINT uk_7if26yibpw5hn2gjsrn2xst0m UNIQUE (uid);


--
-- Name: uk_7odx4uo6s5bg55kt1fxky4a8v; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programrule
    ADD CONSTRAINT uk_7odx4uo6s5bg55kt1fxky4a8v UNIQUE (code);


--
-- Name: uk_7rnfvkitq6l0kr5ju2slxopfi; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relationshiptype
    ADD CONSTRAINT uk_7rnfvkitq6l0kr5ju2slxopfi UNIQUE (uid);


--
-- Name: uk_7udjng39j4ddafjn57r58v7oq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programindicator
    ADD CONSTRAINT uk_7udjng39j4ddafjn57r58v7oq UNIQUE (name);


--
-- Name: uk_81gfx3yt7ngwmkk0t8qgcovhi; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optionset
    ADD CONSTRAINT uk_81gfx3yt7ngwmkk0t8qgcovhi UNIQUE (uid);


--
-- Name: uk_842ips1xb81udqc3dw5uax7u5; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY maplegendset
    ADD CONSTRAINT uk_842ips1xb81udqc3dw5uax7u5 UNIQUE (name);


--
-- Name: uk_8alvmsgu0onl4i0a0sqb6mqx; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationrulegroup
    ADD CONSTRAINT uk_8alvmsgu0onl4i0a0sqb6mqx UNIQUE (uid);


--
-- Name: uk_8d4xrx2gygb4aivpcwrp613hj; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relationshiptype
    ADD CONSTRAINT uk_8d4xrx2gygb4aivpcwrp613hj UNIQUE (name);


--
-- Name: uk_8dcmrupnoi7hiiom466aoa2y; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatortype
    ADD CONSTRAINT uk_8dcmrupnoi7hiiom466aoa2y UNIQUE (code);


--
-- Name: uk_8eyremdx683wcd9owh1t5jufs; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT uk_8eyremdx683wcd9owh1t5jufs UNIQUE (relativeperiodsid);


--
-- Name: uk_8ua8n1965xfvefwmpl7xld6lf; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattributegroup
    ADD CONSTRAINT uk_8ua8n1965xfvefwmpl7xld6lf UNIQUE (uid);


--
-- Name: uk_8v1lxgqdnnocvm9ah6clxmjf; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY externalfileresource
    ADD CONSTRAINT uk_8v1lxgqdnnocvm9ah6clxmjf UNIQUE (code);


--
-- Name: uk_94srnunkibylfaxt4knxfn58e; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT uk_94srnunkibylfaxt4knxfn58e UNIQUE (code);


--
-- Name: uk_9csrw908a1fvfwbhjwm0jfl4e; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY maplegend
    ADD CONSTRAINT uk_9csrw908a1fvfwbhjwm0jfl4e UNIQUE (uid);


--
-- Name: uk_9hvlbsw019hscf35xb5behfx9; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY section
    ADD CONSTRAINT uk_9hvlbsw019hscf35xb5behfx9 UNIQUE (code);


--
-- Name: uk_9j6xjgegveyc0uqs506yy2wrp; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY i18nlocale
    ADD CONSTRAINT uk_9j6xjgegveyc0uqs506yy2wrp UNIQUE (locale);


--
-- Name: uk_9k7bv5o2ut4t0unxcwfyf1ay0; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY metadataversion
    ADD CONSTRAINT uk_9k7bv5o2ut4t0unxcwfyf1ay0 UNIQUE (code);


--
-- Name: uk_9mqbhximifdn1n8ru52lan3fw; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY attribute
    ADD CONSTRAINT uk_9mqbhximifdn1n8ru52lan3fw UNIQUE (uid);


--
-- Name: uk_9nbu5m63pd0n13liu13i3nvb5; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chart
    ADD CONSTRAINT uk_9nbu5m63pd0n13liu13i3nvb5 UNIQUE (relativeperiodsid);


--
-- Name: uk_9ut6k8m3216v5kjcryy7d2y9w; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationrule
    ADD CONSTRAINT uk_9ut6k8m3216v5kjcryy7d2y9w UNIQUE (name);


--
-- Name: uk_a50otc0l2chm0heii6scpit4k; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY section
    ADD CONSTRAINT uk_a50otc0l2chm0heii6scpit4k UNIQUE (uid);


--
-- Name: uk_actuoxkkqulslxjpj5hagib9r; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatorgroupset
    ADD CONSTRAINT uk_actuoxkkqulslxjpj5hagib9r UNIQUE (code);


--
-- Name: uk_aee54nmg1ci2cpitnpiwa845p; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroupset
    ADD CONSTRAINT uk_aee54nmg1ci2cpitnpiwa845p UNIQUE (name);


--
-- Name: uk_aqbaj76r9qxmnylr6p8kj9g37; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgroup
    ADD CONSTRAINT uk_aqbaj76r9qxmnylr6p8kj9g37 UNIQUE (name);


--
-- Name: uk_aygjfui3fpgrsxbj6qj782h6f; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY constant
    ADD CONSTRAINT uk_aygjfui3fpgrsxbj6qj782h6f UNIQUE (shortname);


--
-- Name: uk_ayk5ey2r1fh1akknxtpcpyp9r; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT uk_ayk5ey2r1fh1akknxtpcpyp9r UNIQUE (uid);


--
-- Name: uk_b0aojuanxabfuylrbc2k6xk20; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentity
    ADD CONSTRAINT uk_b0aojuanxabfuylrbc2k6xk20 UNIQUE (name);


--
-- Name: uk_b0ii4jdfy88pffbapohsr2lor; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementcategory
    ADD CONSTRAINT uk_b0ii4jdfy88pffbapohsr2lor UNIQUE (name);


--
-- Name: uk_b39cpkfasrbt96274tbaedtmp; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable
    ADD CONSTRAINT uk_b39cpkfasrbt96274tbaedtmp UNIQUE (relativeperiodsid);


--
-- Name: uk_b3oan3noe4cj9dvyi0amofndv; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstage
    ADD CONSTRAINT uk_b3oan3noe4cj9dvyi0amofndv UNIQUE (uid);


--
-- Name: uk_badofxhbq3oi2d4u7fj8w1kt8; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_badofxhbq3oi2d4u7fj8w1kt8 UNIQUE (openid);


--
-- Name: uk_bjs0n874pj6eoag98jmeidy9a; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongroupset
    ADD CONSTRAINT uk_bjs0n874pj6eoag98jmeidy9a UNIQUE (code);


--
-- Name: uk_bv71u83esume24hp4gsaj5p4f; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY maplegendset
    ADD CONSTRAINT uk_bv71u83esume24hp4gsaj5p4f UNIQUE (code);


--
-- Name: uk_by4pqq1ans00ffmrgqqh9ehog; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapprovalworkflow
    ADD CONSTRAINT uk_by4pqq1ans00ffmrgqqh9ehog UNIQUE (uid);


--
-- Name: uk_c8bnosb06cchme5sig7b54uot; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT uk_c8bnosb06cchme5sig7b54uot UNIQUE (code);


--
-- Name: uk_cbnc5ktj6whhh690w32k8cyh8; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY color
    ADD CONSTRAINT uk_cbnc5ktj6whhh690w32k8cyh8 UNIQUE (code);


--
-- Name: uk_ccwoighljmk4fy165ipnwl5n4; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY externalfileresource
    ADD CONSTRAINT uk_ccwoighljmk4fy165ipnwl5n4 UNIQUE (uid);


--
-- Name: uk_cswvqawieb2sfq5qsy5wpqp1k; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datastatistics
    ADD CONSTRAINT uk_cswvqawieb2sfq5qsy5wpqp1k UNIQUE (code);


--
-- Name: uk_cto4jvd9q49voite13v0egy3i; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programrulevariable
    ADD CONSTRAINT uk_cto4jvd9q49voite13v0egy3i UNIQUE (code);


--
-- Name: uk_d3lsa2h8me94ksyp53l6rpe3g; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programinstance
    ADD CONSTRAINT uk_d3lsa2h8me94ksyp53l6rpe3g UNIQUE (uid);


--
-- Name: uk_d3qpxp187x8t4c1rsn64crgqu; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY metadataversion
    ADD CONSTRAINT uk_d3qpxp187x8t4c1rsn64crgqu UNIQUE (hashcode);


--
-- Name: uk_d4gp8a84gn643g0r28hdnn4so; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY externalfileresource
    ADD CONSTRAINT uk_d4gp8a84gn643g0r28hdnn4so UNIQUE (fileresourceid);


--
-- Name: uk_d4l5rkqnmc6qdfa6hh11g3h74; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationcriteria
    ADD CONSTRAINT uk_d4l5rkqnmc6qdfa6hh11g3h74 UNIQUE (name);


--
-- Name: uk_dhl0qt8y7hht7krbiym1e9x3n; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataentryform
    ADD CONSTRAINT uk_dhl0qt8y7hht7krbiym1e9x3n UNIQUE (code);


--
-- Name: uk_dlhi39gmt2e0dun73f04w7w7u; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categorycombo
    ADD CONSTRAINT uk_dlhi39gmt2e0dun73f04w7w7u UNIQUE (uid);


--
-- Name: uk_do17h5nk71uvc3xjry6kgevj9; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programindicator
    ADD CONSTRAINT uk_do17h5nk71uvc3xjry6kgevj9 UNIQUE (code);


--
-- Name: uk_do99wgsyk5wflbhb937u5av8m; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY systemsetting
    ADD CONSTRAINT uk_do99wgsyk5wflbhb937u5av8m UNIQUE (name);


--
-- Name: uk_dt8m81o2pw5p9ttid369e92bg; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroup
    ADD CONSTRAINT uk_dt8m81o2pw5p9ttid369e92bg UNIQUE (code);


--
-- Name: uk_dvxv0mw5bonk4pb38o8rctku3; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationcriteria
    ADD CONSTRAINT uk_dvxv0mw5bonk4pb38o8rctku3 UNIQUE (uid);


--
-- Name: uk_e5mhmtj1h7xdfiio2panhapgg; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programrulevariable
    ADD CONSTRAINT uk_e5mhmtj1h7xdfiio2panhapgg UNIQUE (uid);


--
-- Name: uk_e6s6o9jau6tx04m62t7ey4i81; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstage
    ADD CONSTRAINT uk_e6s6o9jau6tx04m62t7ey4i81 UNIQUE (code);


--
-- Name: uk_ec7ehyocpresxxhm7yjstdnwt; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY maplegendset
    ADD CONSTRAINT uk_ec7ehyocpresxxhm7yjstdnwt UNIQUE (uid);


--
-- Name: uk_edy7cktu2fqg01r3n0fjyk1kk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY constant
    ADD CONSTRAINT uk_edy7cktu2fqg01r3n0fjyk1kk UNIQUE (code);


--
-- Name: uk_efqukogbk7i0poucwoy2qie74; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_efqukogbk7i0poucwoy2qie74 UNIQUE (uid);


--
-- Name: uk_eh2epuhchf9mci86ihl06i31g; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fileresource
    ADD CONSTRAINT uk_eh2epuhchf9mci86ihl06i31g UNIQUE (uid);


--
-- Name: uk_eh4c3whbwi94nhh772q6l5t7m; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT uk_eh4c3whbwi94nhh772q6l5t7m UNIQUE (code);


--
-- Name: uk_ehl4v33tq7hlkmc28vbno1b4n; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organisationunit
    ADD CONSTRAINT uk_ehl4v33tq7hlkmc28vbno1b4n UNIQUE (code);


--
-- Name: uk_ekb018cvmpvll5dgtn97leerj; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usergroup
    ADD CONSTRAINT uk_ekb018cvmpvll5dgtn97leerj UNIQUE (uid);


--
-- Name: uk_elt3kiqdmmm5fwqfxsxk9lvh0; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY document
    ADD CONSTRAINT uk_elt3kiqdmmm5fwqfxsxk9lvh0 UNIQUE (code);


--
-- Name: uk_em6b7qxcas7dn6y506i3nd2x6; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY keyjsonvalue
    ADD CONSTRAINT uk_em6b7qxcas7dn6y506i3nd2x6 UNIQUE (uid);


--
-- Name: uk_emoyyyy114ofh6cwo6do8xsi0; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY version
    ADD CONSTRAINT uk_emoyyyy114ofh6cwo6do8xsi0 UNIQUE (versionkey);


--
-- Name: uk_emyh4fed0f1kknqhimmrhnek8; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashboard
    ADD CONSTRAINT uk_emyh4fed0f1kknqhimmrhnek8 UNIQUE (code);


--
-- Name: uk_en3k8g2rnmf5telm4y4ofoo5t; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongrouptranslations
    ADD CONSTRAINT uk_en3k8g2rnmf5telm4y4ofoo5t UNIQUE (objecttranslationid);


--
-- Name: uk_enhquk04unrpri78inaske3jq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT uk_enhquk04unrpri78inaske3jq UNIQUE (uid);


--
-- Name: uk_eqd95mucf5pd856dqlwe6y36c; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT uk_eqd95mucf5pd856dqlwe6y36c UNIQUE (code);


--
-- Name: uk_evp7d8obarxt3kewepigkwahc; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT uk_evp7d8obarxt3kewepigkwahc UNIQUE (name);


--
-- Name: uk_eyke73kujhkth5elabmkpy4ca; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chart
    ADD CONSTRAINT uk_eyke73kujhkth5elabmkpy4ca UNIQUE (code);


--
-- Name: uk_f7wfef3jx1yl73stqs7b45ewb; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programindicatorgroup
    ADD CONSTRAINT uk_f7wfef3jx1yl73stqs7b45ewb UNIQUE (code);


--
-- Name: uk_f93o7l4afmkassm3t4f2op9ps; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY metadataversion
    ADD CONSTRAINT uk_f93o7l4afmkassm3t4f2op9ps UNIQUE (name);


--
-- Name: uk_fbferisvig2o4f5owb5lnygf3; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT uk_fbferisvig2o4f5owb5lnygf3 UNIQUE (code);


--
-- Name: uk_ff1da38in40mg91rlgqhw02ff; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userrole
    ADD CONSTRAINT uk_ff1da38in40mg91rlgqhw02ff UNIQUE (uid);


--
-- Name: uk_fps2ja521pudngaitlp0805du; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sqlview
    ADD CONSTRAINT uk_fps2ja521pudngaitlp0805du UNIQUE (uid);


--
-- Name: uk_fuentbuhbbr0ix49td9jqlfe5; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroupset
    ADD CONSTRAINT uk_fuentbuhbbr0ix49td9jqlfe5 UNIQUE (uid);


--
-- Name: uk_fuq6kda6folarp19oggaf02vb; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY program
    ADD CONSTRAINT uk_fuq6kda6folarp19oggaf02vb UNIQUE (code);


--
-- Name: uk_fvgc7isaflcan55g51ysm9df2; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitlevel
    ADD CONSTRAINT uk_fvgc7isaflcan55g51ysm9df2 UNIQUE (code);


--
-- Name: uk_fwso2d10icu8j6720w82tywmq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY colorset
    ADD CONSTRAINT uk_fwso2d10icu8j6720w82tywmq UNIQUE (code);


--
-- Name: uk_fx3xx9xe0xpurjt6v5p7rv8da; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oauth2client
    ADD CONSTRAINT uk_fx3xx9xe0xpurjt6v5p7rv8da UNIQUE (uid);


--
-- Name: uk_fymtho48lmccwmlag2amy7gc1; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentity
    ADD CONSTRAINT uk_fymtho48lmccwmlag2amy7gc1 UNIQUE (uid);


--
-- Name: uk_g1nrfjv5x04ap1ceohiwah380; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organisationunit
    ADD CONSTRAINT uk_g1nrfjv5x04ap1ceohiwah380 UNIQUE (uid);


--
-- Name: uk_gdfuf3j66jxnvwwnksjxqysac; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oauth2client
    ADD CONSTRAINT uk_gdfuf3j66jxnvwwnksjxqysac UNIQUE (code);


--
-- Name: uk_ge3y4pf6qlne9p7rfmhlvg941; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongroup
    ADD CONSTRAINT uk_ge3y4pf6qlne9p7rfmhlvg941 UNIQUE (code);


--
-- Name: uk_gg9gc0pyaqjuxi8mr4y93i03w; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT uk_gg9gc0pyaqjuxi8mr4y93i03w UNIQUE (shortname);


--
-- Name: uk_gio4nn8l23jikmebud3jwql43; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relationshiptype
    ADD CONSTRAINT uk_gio4nn8l23jikmebud3jwql43 UNIQUE (code);


--
-- Name: uk_gky85ptfkcumyuqhr5yvjxwsa; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userinfo
    ADD CONSTRAINT uk_gky85ptfkcumyuqhr5yvjxwsa UNIQUE (code);


--
-- Name: uk_grp9b5jne53f806pc92sfd5s8; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY map
    ADD CONSTRAINT uk_grp9b5jne53f806pc92sfd5s8 UNIQUE (uid);


--
-- Name: uk_gy44hufdeduoma7eeh3j6abm7; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstageinstance
    ADD CONSTRAINT uk_gy44hufdeduoma7eeh3j6abm7 UNIQUE (uid);


--
-- Name: uk_h4omjcs2ktifdrf2m36u886ae; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY program
    ADD CONSTRAINT uk_h4omjcs2ktifdrf2m36u886ae UNIQUE (uid);


--
-- Name: uk_h97pko7n41oky8pfptkflp8l6; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categorycombo
    ADD CONSTRAINT uk_h97pko7n41oky8pfptkflp8l6 UNIQUE (name);


--
-- Name: uk_hebhkhm8gpwg9xsp8q4f7wlx1; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userrole
    ADD CONSTRAINT uk_hebhkhm8gpwg9xsp8q4f7wlx1 UNIQUE (code);


--
-- Name: uk_hjocbvo9fla04bgj7ku32vwsn; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userrole
    ADD CONSTRAINT uk_hjocbvo9fla04bgj7ku32vwsn UNIQUE (name);


--
-- Name: uk_hpwum0iq12fs4ej5d0tgy6wsn; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY attribute
    ADD CONSTRAINT uk_hpwum0iq12fs4ej5d0tgy6wsn UNIQUE (name);


--
-- Name: uk_hqekpuhjg3g4k4t7xdnu10jy4; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapprovallevel
    ADD CONSTRAINT uk_hqekpuhjg3g4k4t7xdnu10jy4 UNIQUE (orgunitlevel, categoryoptiongroupsetid);


--
-- Name: uk_hs57i9hma97ps6jpsrbb24lm9; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroupset
    ADD CONSTRAINT uk_hs57i9hma97ps6jpsrbb24lm9 UNIQUE (code);


--
-- Name: uk_i1uhc0c8jgxkhlswl9fujsicf; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapprovallevel
    ADD CONSTRAINT uk_i1uhc0c8jgxkhlswl9fujsicf UNIQUE (uid);


--
-- Name: uk_id4stsb5slq35axmjeojnjnoa; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY maplegend
    ADD CONSTRAINT uk_id4stsb5slq35axmjeojnjnoa UNIQUE (code);


--
-- Name: uk_iedy6hh42wl3gr3m87ntd6so8; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sqlview
    ADD CONSTRAINT uk_iedy6hh42wl3gr3m87ntd6so8 UNIQUE (name);


--
-- Name: uk_j9oya1t1tvj8yn5h8fega4ltr; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongroup
    ADD CONSTRAINT uk_j9oya1t1tvj8yn5h8fega4ltr UNIQUE (name);


--
-- Name: uk_jc27pe1xeptws5xprct7mgxrj; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT uk_jc27pe1xeptws5xprct7mgxrj UNIQUE (shortname);


--
-- Name: uk_jkg0r5akwcxtamstsq9kv4t4p; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_jkg0r5akwcxtamstsq9kv4t4p UNIQUE (ldapid);


--
-- Name: uk_jo65jc3wyrxfekiu3upk80mtr; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgroup
    ADD CONSTRAINT uk_jo65jc3wyrxfekiu3upk80mtr UNIQUE (code);


--
-- Name: uk_jxodv1lvot26euasttk021jio; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY document
    ADD CONSTRAINT uk_jxodv1lvot26euasttk021jio UNIQUE (uid);


--
-- Name: uk_jxqj907hbrng860p6mypvl63k; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fileresource
    ADD CONSTRAINT uk_jxqj907hbrng860p6mypvl63k UNIQUE (storagekey);


--
-- Name: uk_kbqnrdakcjfooofmti30d4p8x; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT uk_kbqnrdakcjfooofmti30d4p8x UNIQUE (uid);


--
-- Name: uk_kc1wmcky1ooleovi36oqcqmqe; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY report
    ADD CONSTRAINT uk_kc1wmcky1ooleovi36oqcqmqe UNIQUE (code);


--
-- Name: uk_ke8p30sy68dl7fggednkimdb6; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongroupset
    ADD CONSTRAINT uk_ke8p30sy68dl7fggednkimdb6 UNIQUE (name);


--
-- Name: uk_kmpefoaw81v4bxpoey6y1y3xl; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicator
    ADD CONSTRAINT uk_kmpefoaw81v4bxpoey6y1y3xl UNIQUE (code);


--
-- Name: uk_kqbwxccoqctky1kdkimjya03s; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatorgroup
    ADD CONSTRAINT uk_kqbwxccoqctky1kdkimjya03s UNIQUE (uid);


--
-- Name: uk_krm9w69donjqsejkmfw17jbcx; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY i18nlocale
    ADD CONSTRAINT uk_krm9w69donjqsejkmfw17jbcx UNIQUE (code);


--
-- Name: uk_ktwf16f728hce9ahtpmm7w5lx; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY metadataversion
    ADD CONSTRAINT uk_ktwf16f728hce9ahtpmm7w5lx UNIQUE (uid);


--
-- Name: uk_lgju00pi2jk7y6sl4dkhaykux; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY program_attributes
    ADD CONSTRAINT uk_lgju00pi2jk7y6sl4dkhaykux UNIQUE (uid);


--
-- Name: uk_lnnx8vmalkhkmneryv1ytjq68; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT uk_lnnx8vmalkhkmneryv1ytjq68 UNIQUE (uid);


--
-- Name: uk_lrnagoy2wi83nwmataolh7t6d; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongroup
    ADD CONSTRAINT uk_lrnagoy2wi83nwmataolh7t6d UNIQUE (shortname);


--
-- Name: uk_lswbn93sime7vmdqqe9lks7ge; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroup
    ADD CONSTRAINT uk_lswbn93sime7vmdqqe9lks7ge UNIQUE (uid);


--
-- Name: uk_ltwhby0s0iwayxrcdu6yefeqt; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitlevel
    ADD CONSTRAINT uk_ltwhby0s0iwayxrcdu6yefeqt UNIQUE (level);


--
-- Name: uk_lu295rc1y01c7p7t76y6ajaas; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgroupset
    ADD CONSTRAINT uk_lu295rc1y01c7p7t76y6ajaas UNIQUE (uid);


--
-- Name: uk_lvk31hlxg4sl301nxyt1iupd6; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporttable
    ADD CONSTRAINT uk_lvk31hlxg4sl301nxyt1iupd6 UNIQUE (code);


--
-- Name: uk_lycal9jdw3cs0wwebxciswwgr; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstagesection
    ADD CONSTRAINT uk_lycal9jdw3cs0wwebxciswwgr UNIQUE (uid);


--
-- Name: uk_mihkls5oq503326b4dvvf2vas; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroupsettranslations
    ADD CONSTRAINT uk_mihkls5oq503326b4dvvf2vas UNIQUE (objecttranslationid);


--
-- Name: uk_mlop2afk26fwowa69lr9a138y; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementcategoryoption
    ADD CONSTRAINT uk_mlop2afk26fwowa69lr9a138y UNIQUE (code);


--
-- Name: uk_myox13mr8r27oxl7ts33ntpd5; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashboard
    ADD CONSTRAINT uk_myox13mr8r27oxl7ts33ntpd5 UNIQUE (uid);


--
-- Name: uk_n18s4feicujvngv2ajoesdgio; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataapprovalworkflow
    ADD CONSTRAINT uk_n18s4feicujvngv2ajoesdgio UNIQUE (name);


--
-- Name: uk_n4xputyk31femiaxls6lbl2rw; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatorgroupset
    ADD CONSTRAINT uk_n4xputyk31femiaxls6lbl2rw UNIQUE (uid);


--
-- Name: uk_n5ax669vkj63nx3rrvlushqdm; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pushanalysis
    ADD CONSTRAINT uk_n5ax669vkj63nx3rrvlushqdm UNIQUE (code);


--
-- Name: uk_n8mbmryeksa80ucyxj0vg6p9b; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatortype
    ADD CONSTRAINT uk_n8mbmryeksa80ucyxj0vg6p9b UNIQUE (name);


--
-- Name: uk_ni7epmbxtn4jcax3ya324ff9w; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oauth2client
    ADD CONSTRAINT uk_ni7epmbxtn4jcax3ya324ff9w UNIQUE (cid);


--
-- Name: uk_nipo7t010a80osh7okxswav2g; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroup
    ADD CONSTRAINT uk_nipo7t010a80osh7okxswav2g UNIQUE (uid);


--
-- Name: uk_nwgvrevv2slj1bvc9m01p89lf; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oauth2client
    ADD CONSTRAINT uk_nwgvrevv2slj1bvc9m01p89lf UNIQUE (name);


--
-- Name: uk_nwomu20vyjce2jxwdjdfx29lx; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattributegroup
    ADD CONSTRAINT uk_nwomu20vyjce2jxwdjdfx29lx UNIQUE (name);


--
-- Name: uk_nwq3y4xqct21tdl0l77bvmpoe; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroup
    ADD CONSTRAINT uk_nwq3y4xqct21tdl0l77bvmpoe UNIQUE (shortname);


--
-- Name: uk_nywvip5682tuvxrnwjomeyg6y; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY constant
    ADD CONSTRAINT uk_nywvip5682tuvxrnwjomeyg6y UNIQUE (uid);


--
-- Name: uk_o0v1fdqiyte40ffm9q3nhcj4v; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT uk_o0v1fdqiyte40ffm9q3nhcj4v UNIQUE (code);


--
-- Name: uk_o2xbcli806eba6dkdfco0o3kc; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY constant
    ADD CONSTRAINT uk_o2xbcli806eba6dkdfco0o3kc UNIQUE (name);


--
-- Name: uk_oaeinmk3jp70e5pkrffra5oak; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityattributegroup
    ADD CONSTRAINT uk_oaeinmk3jp70e5pkrffra5oak UNIQUE (code);


--
-- Name: uk_oeni5ndit5g033f1s1j08bdry; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT uk_oeni5ndit5g033f1s1j08bdry UNIQUE (code);


--
-- Name: uk_ofc2a89rccimogdp9ownwcuy1; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY colorset
    ADD CONSTRAINT uk_ofc2a89rccimogdp9ownwcuy1 UNIQUE (name);


--
-- Name: uk_oj2bhkjfgcl9rcwlf579dl1d6; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY colorset
    ADD CONSTRAINT uk_oj2bhkjfgcl9rcwlf579dl1d6 UNIQUE (uid);


--
-- Name: uk_ol8n7oq6clgxvqjedlpn85aqo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptiongroup
    ADD CONSTRAINT uk_ol8n7oq6clgxvqjedlpn85aqo UNIQUE (uid);


--
-- Name: uk_orq3pwtro2yu9yydh046bn40j; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityinstance
    ADD CONSTRAINT uk_orq3pwtro2yu9yydh046bn40j UNIQUE (code);


--
-- Name: uk_os4r1umsvtmbuqm2bo25s5ej0; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programstagedataelement
    ADD CONSTRAINT uk_os4r1umsvtmbuqm2bo25s5ej0 UNIQUE (uid);


--
-- Name: uk_ot8a05g9d4k5l67xi062xx5w6; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programnotificationtemplate
    ADD CONSTRAINT uk_ot8a05g9d4k5l67xi062xx5w6 UNIQUE (code);


--
-- Name: uk_otvwcgv4bxjtqfj3flhrnmgf7; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgroup
    ADD CONSTRAINT uk_otvwcgv4bxjtqfj3flhrnmgf7 UNIQUE (uid);


--
-- Name: uk_p0p3bwhgbsdemu14v23p47qne; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatortype
    ADD CONSTRAINT uk_p0p3bwhgbsdemu14v23p47qne UNIQUE (uid);


--
-- Name: uk_p0rvldurcmk0x3mx39lt5uvsd; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optionset
    ADD CONSTRAINT uk_p0rvldurcmk0x3mx39lt5uvsd UNIQUE (name);


--
-- Name: uk_p7arcbl58mmcrj2didtr0ruqh; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programrule
    ADD CONSTRAINT uk_p7arcbl58mmcrj2didtr0ruqh UNIQUE (uid);


--
-- Name: uk_p7egnv3sj4ugyl23mk4vga40k; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementgroupset
    ADD CONSTRAINT uk_p7egnv3sj4ugyl23mk4vga40k UNIQUE (code);


--
-- Name: uk_p8tvo9tqrdn5tb45d0g5cko5o; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataentryform
    ADD CONSTRAINT uk_p8tvo9tqrdn5tb45d0g5cko5o UNIQUE (name);


--
-- Name: uk_pbj3u1nk9vnuof8f47utvowmv; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementcategoryoption
    ADD CONSTRAINT uk_pbj3u1nk9vnuof8f47utvowmv UNIQUE (name);


--
-- Name: uk_ppi146eky8fodu97t1o21vkd8; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY datastatistics
    ADD CONSTRAINT uk_ppi146eky8fodu97t1o21vkd8 UNIQUE (uid);


--
-- Name: uk_pw2bgc9ykjad2obefeqha28t4; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organisationunit
    ADD CONSTRAINT uk_pw2bgc9ykjad2obefeqha28t4 UNIQUE (path);


--
-- Name: uk_pw87bi64e3ev11k7dwrmljo78; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementcategory
    ADD CONSTRAINT uk_pw87bi64e3ev11k7dwrmljo78 UNIQUE (code);


--
-- Name: uk_q0obvr5rvxhlnjs367y1f0bav; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataentryform
    ADD CONSTRAINT uk_q0obvr5rvxhlnjs367y1f0bav UNIQUE (uid);


--
-- Name: uk_q0oyainj1lis9c8kkh5sky2ri; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT uk_q0oyainj1lis9c8kkh5sky2ri UNIQUE (relativeperiodsid);


--
-- Name: uk_q20sh82vk885ooi7fekwtboej; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usergroup
    ADD CONSTRAINT uk_q20sh82vk885ooi7fekwtboej UNIQUE (code);


--
-- Name: uk_q9jv2e3fy49hc1havuwnr0res; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optiongroupset
    ADD CONSTRAINT uk_q9jv2e3fy49hc1havuwnr0res UNIQUE (code);


--
-- Name: uk_qki43s9vdndg15c9tyv718u1j; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categoryoptioncombo
    ADD CONSTRAINT uk_qki43s9vdndg15c9tyv718u1j UNIQUE (uid);


--
-- Name: uk_qogg9a7yy4qconomxt4j4upql; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY i18nlocale
    ADD CONSTRAINT uk_qogg9a7yy4qconomxt4j4upql UNIQUE (name);


--
-- Name: uk_qp9201a4m6jl53sei0huh4l6s; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementcategoryoption
    ADD CONSTRAINT uk_qp9201a4m6jl53sei0huh4l6s UNIQUE (shortname);


--
-- Name: uk_qunv1hucv9wi5pt92tur929mr; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pushanalysis
    ADD CONSTRAINT uk_qunv1hucv9wi5pt92tur929mr UNIQUE (uid);


--
-- Name: uk_qwk9qdapql867enp5r7fa0uic; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroup
    ADD CONSTRAINT uk_qwk9qdapql867enp5r7fa0uic UNIQUE (name);


--
-- Name: uk_r2f9o8i6th2w8vqdexdfo72ui; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY program_attributes
    ADD CONSTRAINT uk_r2f9o8i6th2w8vqdexdfo72ui UNIQUE (code);


--
-- Name: uk_r3ugbbibdsyn234isip3346v4; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY externalmaplayer
    ADD CONSTRAINT uk_r3ugbbibdsyn234isip3346v4 UNIQUE (code);


--
-- Name: uk_r43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- Name: uk_r7hbkahkkbgfg9xtxlp9mhq3q; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentity
    ADD CONSTRAINT uk_r7hbkahkkbgfg9xtxlp9mhq3q UNIQUE (code);


--
-- Name: uk_rbr4kyuk4s0kb4jo1r77cuaq9; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackedentityinstance
    ADD CONSTRAINT uk_rbr4kyuk4s0kb4jo1r77cuaq9 UNIQUE (uid);


--
-- Name: uk_rrv70c7ej18sptdwj7h6ac5rv; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY color
    ADD CONSTRAINT uk_rrv70c7ej18sptdwj7h6ac5rv UNIQUE (uid);


--
-- Name: uk_rvfiukug5ui7qidoiln3el3aa; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optionset
    ADD CONSTRAINT uk_rvfiukug5ui7qidoiln3el3aa UNIQUE (code);


--
-- Name: uk_rwk01y8pn2jo3plo7ap28tgb6; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programdataelement
    ADD CONSTRAINT uk_rwk01y8pn2jo3plo7ap28tgb6 UNIQUE (code);


--
-- Name: uk_skin40axv0jcme3bhsbb7156i; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationcriteria
    ADD CONSTRAINT uk_skin40axv0jcme3bhsbb7156i UNIQUE (code);


--
-- Name: uk_sspviu4m0l0lf7ef3t3cagfxd; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicatorgroup
    ADD CONSTRAINT uk_sspviu4m0l0lf7ef3t3cagfxd UNIQUE (code);


--
-- Name: uk_t0dg39dopew9f6y64ucsx7194; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationrule
    ADD CONSTRAINT uk_t0dg39dopew9f6y64ucsx7194 UNIQUE (uid);


--
-- Name: uk_t0srkng3akwg3pcp5qlwcx06n; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroup
    ADD CONSTRAINT uk_t0srkng3akwg3pcp5qlwcx06n UNIQUE (shortname);


--
-- Name: uk_t5lxvc1km3ylon5st1fuabsgl; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgunitgroupset
    ADD CONSTRAINT uk_t5lxvc1km3ylon5st1fuabsgl UNIQUE (name);


--
-- Name: uk_ta80keoi67443tkvvmx8l872x; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY indicator
    ADD CONSTRAINT uk_ta80keoi67443tkvvmx8l872x UNIQUE (uid);


--
-- Name: uk_tbkbjga8h4j5u33d7hbcuk66t; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY period
    ADD CONSTRAINT uk_tbkbjga8h4j5u33d7hbcuk66t UNIQUE (periodtypeid, startdate, enddate);


--
-- Name: uk_tikknlgl0im3w68yvlb0swrgd; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY keyjsonvalue
    ADD CONSTRAINT uk_tikknlgl0im3w68yvlb0swrgd UNIQUE (code);


--
-- Name: userapps_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userapps
    ADD CONSTRAINT userapps_pkey PRIMARY KEY (userinfoid, sort_order);


--
-- Name: userattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userattributevalues
    ADD CONSTRAINT userattributevalues_pkey PRIMARY KEY (userinfoid, attributevalueid);


--
-- Name: userdatavieworgunits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userdatavieworgunits
    ADD CONSTRAINT userdatavieworgunits_pkey PRIMARY KEY (userinfoid, organisationunitid);


--
-- Name: usergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usergroup
    ADD CONSTRAINT usergroup_pkey PRIMARY KEY (usergroupid);


--
-- Name: usergroupaccess_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usergroupaccess
    ADD CONSTRAINT usergroupaccess_pkey PRIMARY KEY (usergroupaccessid);


--
-- Name: usergroupattributevalues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usergroupattributevalues
    ADD CONSTRAINT usergroupattributevalues_pkey PRIMARY KEY (usergroupid, attributevalueid);


--
-- Name: usergroupmanaged_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usergroupmanaged
    ADD CONSTRAINT usergroupmanaged_pkey PRIMARY KEY (managedbygroupid, managedgroupid);


--
-- Name: usergroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usergroupmembers
    ADD CONSTRAINT usergroupmembers_pkey PRIMARY KEY (usergroupid, userid);


--
-- Name: usergrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usergrouptranslations
    ADD CONSTRAINT usergrouptranslations_pkey PRIMARY KEY (usergroupid, objecttranslationid);


--
-- Name: usergroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usergroupusergroupaccesses
    ADD CONSTRAINT usergroupusergroupaccesses_pkey PRIMARY KEY (usergroupid, usergroupaccessid);


--
-- Name: userinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userinfo
    ADD CONSTRAINT userinfo_pkey PRIMARY KEY (userinfoid);


--
-- Name: userkeyjsonvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userkeyjsonvalue
    ADD CONSTRAINT userkeyjsonvalue_pkey PRIMARY KEY (userkeyjsonvalueid);


--
-- Name: userkeyjsonvalue_unique_key_on_user_and_namespace; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userkeyjsonvalue
    ADD CONSTRAINT userkeyjsonvalue_unique_key_on_user_and_namespace UNIQUE (userid, namespace, userkey);


--
-- Name: usermembership_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usermembership
    ADD CONSTRAINT usermembership_pkey PRIMARY KEY (userinfoid, organisationunitid);


--
-- Name: usermessage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usermessage
    ADD CONSTRAINT usermessage_pkey PRIMARY KEY (usermessageid);


--
-- Name: userrole_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userrole
    ADD CONSTRAINT userrole_pkey PRIMARY KEY (userroleid);


--
-- Name: userroledataset_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userroledataset
    ADD CONSTRAINT userroledataset_pkey PRIMARY KEY (userroleid, datasetid);


--
-- Name: userrolemembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userrolemembers
    ADD CONSTRAINT userrolemembers_pkey PRIMARY KEY (userid, userroleid);


--
-- Name: userroletranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userroletranslations
    ADD CONSTRAINT userroletranslations_pkey PRIMARY KEY (userroleid, objecttranslationid);


--
-- Name: userroleusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userroleusergroupaccesses
    ADD CONSTRAINT userroleusergroupaccesses_pkey PRIMARY KEY (userroleid, usergroupaccessid);


--
-- Name: users_catdimensionconstraints_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users_catdimensionconstraints
    ADD CONSTRAINT users_catdimensionconstraints_pkey PRIMARY KEY (userid, dataelementcategoryid);


--
-- Name: users_cogsdimensionconstraints_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users_cogsdimensionconstraints
    ADD CONSTRAINT users_cogsdimensionconstraints_pkey PRIMARY KEY (userid, categoryoptiongroupsetid);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: usersetting_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usersetting
    ADD CONSTRAINT usersetting_pkey PRIMARY KEY (userinfoid, name);


--
-- Name: userteisearchorgunits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userteisearchorgunits
    ADD CONSTRAINT userteisearchorgunits_pkey PRIMARY KEY (userinfoid, organisationunitid);


--
-- Name: validationcriteria_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationcriteria
    ADD CONSTRAINT validationcriteria_pkey PRIMARY KEY (validationcriteriaid);


--
-- Name: validationcriteriatranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationcriteriatranslations
    ADD CONSTRAINT validationcriteriatranslations_pkey PRIMARY KEY (validationcriteriaid, objecttranslationid);


--
-- Name: validationrule_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationrule
    ADD CONSTRAINT validationrule_pkey PRIMARY KEY (validationruleid);


--
-- Name: validationrulegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationrulegroup
    ADD CONSTRAINT validationrulegroup_pkey PRIMARY KEY (validationrulegroupid);


--
-- Name: validationrulegroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationrulegroupmembers
    ADD CONSTRAINT validationrulegroupmembers_pkey PRIMARY KEY (validationgroupid, validationruleid);


--
-- Name: validationrulegrouptranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationrulegrouptranslations
    ADD CONSTRAINT validationrulegrouptranslations_pkey PRIMARY KEY (validationrulegroupid, objecttranslationid);


--
-- Name: validationrulegroupusergroupaccesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationrulegroupusergroupaccesses
    ADD CONSTRAINT validationrulegroupusergroupaccesses_pkey PRIMARY KEY (validationrulegroupid, usergroupaccessid);


--
-- Name: validationrulegroupusergroupstoalert_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationrulegroupusergroupstoalert
    ADD CONSTRAINT validationrulegroupusergroupstoalert_pkey PRIMARY KEY (validationgroupid, usergroupid);


--
-- Name: validationruletranslations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validationruletranslations
    ADD CONSTRAINT validationruletranslations_pkey PRIMARY KEY (validationruleid, objecttranslationid);


--
-- Name: version_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY version
    ADD CONSTRAINT version_pkey PRIMARY KEY (versionid);


--
-- Name: version_versionkey_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY version
    ADD CONSTRAINT version_versionkey_key UNIQUE (versionkey);


--
-- Name: id_datavalueaudit_created; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX id_datavalueaudit_created ON datavalueaudit USING btree (created);


--
-- Name: in_dataapprovallevel_level; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX in_dataapprovallevel_level ON dataapprovallevel USING btree (level);


--
-- Name: in_datavalue_deleted; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX in_datavalue_deleted ON datavalue USING btree (deleted);


--
-- Name: in_datavalue_lastupdated; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX in_datavalue_lastupdated ON datavalue USING btree (lastupdated);


--
-- Name: in_datavalueaudit; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX in_datavalueaudit ON datavalueaudit USING btree (dataelementid, periodid, organisationunitid, categoryoptioncomboid, attributeoptioncomboid);


--
-- Name: in_organisationunit_hierarchylevel; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX in_organisationunit_hierarchylevel ON organisationunit USING btree (hierarchylevel);


--
-- Name: in_organisationunit_path; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX in_organisationunit_path ON organisationunit USING btree (path);


--
-- Name: in_parentid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX in_parentid ON organisationunit USING btree (parentid);


--
-- Name: in_trackedentityattributevalue_attributeid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX in_trackedentityattributevalue_attributeid ON trackedentityattributevalue USING btree (trackedentityattributeid);


--
-- Name: index_minmaxdataelement; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_minmaxdataelement ON minmaxdataelement USING btree (sourceid, dataelementid, categoryoptioncomboid);


--
-- Name: index_programinstance; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_programinstance ON programinstance USING btree (programinstanceid);


--
-- Name: interpretation_lastupdated; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX interpretation_lastupdated ON interpretation USING btree (lastupdated);


--
-- Name: maplegend_endvalue; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX maplegend_endvalue ON maplegend USING btree (endvalue);


--
-- Name: maplegend_startvalue; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX maplegend_startvalue ON maplegend USING btree (startvalue);


--
-- Name: messageconversation_lastmessage; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX messageconversation_lastmessage ON messageconversation USING btree (lastmessage);


--
-- Name: outbound_sms_status_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX outbound_sms_status_index ON outbound_sms USING btree (status);


--
-- Name: programstageinstance_executiondate; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX programstageinstance_executiondate ON programstageinstance USING btree (executiondate);


--
-- Name: programstageinstance_organisationunitid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX programstageinstance_organisationunitid ON programstageinstance USING btree (organisationunitid);


--
-- Name: sms_originator_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX sms_originator_index ON incomingsms USING btree (originator);


--
-- Name: sms_status_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX sms_status_index ON incomingsms USING btree (status);


--
-- Name: userkeyjsonvalue_user; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX userkeyjsonvalue_user ON userkeyjsonvalue USING btree (userid);


--
-- Name: usermessage_isread; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX usermessage_isread ON usermessage USING btree (isread);


--
-- Name: usermessage_userid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX usermessage_userid ON usermessage USING btree (userid);


--
-- Name: fk14vlc8tv4kna36p6qonceo8ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasetattributevalues
    ADD CONSTRAINT fk14vlc8tv4kna36p6qonceo8ma FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk1nlm1116kc90wbuo78notvb9v; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgroupusergroupaccesses
    ADD CONSTRAINT fk1nlm1116kc90wbuo78notvb9v FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk1swcppe8kkvl6xbm4q47r0gal; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstagesectiontranslations
    ADD CONSTRAINT fk1swcppe8kkvl6xbm4q47r0gal FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk1ucfah0si2drvdg2k3j9nj2e9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicatorgroupattributevalues
    ADD CONSTRAINT fk1ucfah0si2drvdg2k3j9nj2e9 FOREIGN KEY (programindicatorgroupid) REFERENCES programindicatorgroup(programindicatorgroupid);


--
-- Name: fk25i3g1nx0hyjsim5cybdi73ly; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usergroupattributevalues
    ADD CONSTRAINT fk25i3g1nx0hyjsim5cybdi73ly FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk25krkr877ipngidd8k4qkpb38; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttableusergroupaccesses
    ADD CONSTRAINT fk25krkr877ipngidd8k4qkpb38 FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk2ks20e418jsxjhn02ljypa9tq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY constanttranslations
    ADD CONSTRAINT fk2ks20e418jsxjhn02ljypa9tq FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk2n7d98hdtlwjacpfd8f7bnpgy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sqlviewattributevalues
    ADD CONSTRAINT fk2n7d98hdtlwjacpfd8f7bnpgy FOREIGN KEY (sqlviewid) REFERENCES sqlview(sqlviewid);


--
-- Name: fk2n9ay939q2uwmieldeypms4cq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY charttranslations
    ADD CONSTRAINT fk2n9ay939q2uwmieldeypms4cq FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk2sd8w7egccvxbau38rraunkri; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usergrouptranslations
    ADD CONSTRAINT fk2sd8w7egccvxbau38rraunkri FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk2tjsnauyet9p1qwk3nnbo7tm3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicatorgroupusergroupaccesses
    ADD CONSTRAINT fk2tjsnauyet9p1qwk3nnbo7tm3 FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk2vbi3ug5jo15ao7pql8ap283j; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categorycombousergroupaccesses
    ADD CONSTRAINT fk2vbi3ug5jo15ao7pql8ap283j FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk2wqhml4htbnncy911df1io95h; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongroupusergroupaccesses
    ADD CONSTRAINT fk2wqhml4htbnncy911df1io95h FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk2y3uap3vg76fuvmg2mit64y70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongroupattributevalues
    ADD CONSTRAINT fk2y3uap3vg76fuvmg2mit64y70 FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fk3408hwfswvwfqyfngk1tf5ju8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programmessage_phonenumbers
    ADD CONSTRAINT fk3408hwfswvwfqyfngk1tf5ju8 FOREIGN KEY (programmessagephonenumberid) REFERENCES programmessage(id);


--
-- Name: fk3ewb5ew4m1rarec33519cwcsq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programmessagetranslations
    ADD CONSTRAINT fk3ewb5ew4m1rarec33519cwcsq FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk3isuwff5den8kdikhctgye0eo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapprovalworkflowtranslations
    ADD CONSTRAINT fk3isuwff5den8kdikhctgye0eo FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk3ln0aibaca9diedgu5s8mohbb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicatortranslations
    ADD CONSTRAINT fk3ln0aibaca9diedgu5s8mohbb FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk3s1raibq34uci95vn5fqihjbs; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributeattributevalues
    ADD CONSTRAINT fk3s1raibq34uci95vn5fqihjbs FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fk3tej1kap633bf97p6qdrd7ivi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributeusergroupaccesses
    ADD CONSTRAINT fk3tej1kap633bf97p6qdrd7ivi FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk3x7f8b9rivyb7mrc7nf2wgn6v; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroupattributevalues
    ADD CONSTRAINT fk3x7f8b9rivyb7mrc7nf2wgn6v FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fk40ivchljqy3lak45vpxj1spvq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongroupsetusergroupaccesses
    ADD CONSTRAINT fk40ivchljqy3lak45vpxj1spvq FOREIGN KEY (optiongroupsetid) REFERENCES optiongroupset(optiongroupsetid);


--
-- Name: fk445gf30dsp88q10ukoktc675d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sqlviewattributevalues
    ADD CONSTRAINT fk445gf30dsp88q10ukoktc675d FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fk45uc7wfpi4u5gunpl127ehkn2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programnotificationtemplate_deliverychannel
    ADD CONSTRAINT fk45uc7wfpi4u5gunpl127ehkn2 FOREIGN KEY (programnotificationtemplatedeliverychannelid) REFERENCES programnotificationtemplate(programnotificationtemplateid);


--
-- Name: fk46kfj29g8ql52esjjwvfkelas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgrouptranslations
    ADD CONSTRAINT fk46kfj29g8ql52esjjwvfkelas FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk48oqounwggpawxkgo97qgq42m; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentitytranslations
    ADD CONSTRAINT fk48oqounwggpawxkgo97qgq42m FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk48rkjqk7sell3prjhvgb2wcu0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasetsectiontranslations
    ADD CONSTRAINT fk48rkjqk7sell3prjhvgb2wcu0 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk4ddpmtxupf3k972xqi2jmwcnb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatortypetranslations
    ADD CONSTRAINT fk4ddpmtxupf3k972xqi2jmwcnb FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk4hgup0pvaq2lnb5wl0iqrwty1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementtranslations
    ADD CONSTRAINT fk4hgup0pvaq2lnb5wl0iqrwty1 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk4j6haj9rbsdi5mg4h2g9bp5f4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorattributevalues
    ADD CONSTRAINT fk4j6haj9rbsdi5mg4h2g9bp5f4 FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fk4uq2bl31hdu2s4e07rltemk3d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programnotificationtemplate
    ADD CONSTRAINT fk4uq2bl31hdu2s4e07rltemk3d FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk55kladmsl0xiqpe7b3kfus2kx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionattributevalues
    ADD CONSTRAINT fk55kladmsl0xiqpe7b3kfus2kx FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fk57fqx6vjg8e4yxdr49rh4e2cg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interpretationusergroupaccesses
    ADD CONSTRAINT fk57fqx6vjg8e4yxdr49rh4e2cg FOREIGN KEY (interpretationid) REFERENCES interpretation(interpretationid);


--
-- Name: fk5lkioy2ni66gkhk1py1lg2ksk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapprovallevelusergroupaccesses
    ADD CONSTRAINT fk5lkioy2ni66gkhk1py1lg2ksk FOREIGN KEY (dataapprovallevelid) REFERENCES dataapprovallevel(dataapprovallevelid);


--
-- Name: fk5mc47seuei76yjk4pne9xco4y; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongroupusergroupaccesses
    ADD CONSTRAINT fk5mc47seuei76yjk4pne9xco4y FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk5s4d4l1e7unmm6gholgprl718; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongroupsettranslations
    ADD CONSTRAINT fk5s4d4l1e7unmm6gholgprl718 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk5ueo0ouvw1w8ym3bl5a4gy7jb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapprovalworkflowusergroupaccesses
    ADD CONSTRAINT fk5ueo0ouvw1w8ym3bl5a4gy7jb FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk5uw9e42m1bbvtvco3u05w7jtg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY maplegendsettranslations
    ADD CONSTRAINT fk5uw9e42m1bbvtvco3u05w7jtg FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk6ai10kbk2id10jrjljspsrwsx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisationunittranslations
    ADD CONSTRAINT fk6ai10kbk2id10jrjljspsrwsx FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk6eqh97iasvtf9f786haw0fne; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroupsetattributevalues
    ADD CONSTRAINT fk6eqh97iasvtf9f786haw0fne FOREIGN KEY (orgunitgroupsetid) REFERENCES orgunitgroupset(orgunitgroupsetid);


--
-- Name: fk6q6o2a3x04ku7vfng6c08dl6m; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY legendsetusergroupaccesses
    ADD CONSTRAINT fk6q6o2a3x04ku7vfng6c08dl6m FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk6xa8m39mn0dpitxo4eehwikla; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relationshiptypetranslations
    ADD CONSTRAINT fk6xa8m39mn0dpitxo4eehwikla FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk7a1b7xygd4kd7364syo7igha; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgroupusergroupaccesses
    ADD CONSTRAINT fk7a1b7xygd4kd7364syo7igha FOREIGN KEY (indicatorgroupid) REFERENCES indicatorgroup(indicatorgroupid);


--
-- Name: fk7aq28bhq2xnps53lpjrgchpoo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgroupattributevalues
    ADD CONSTRAINT fk7aq28bhq2xnps53lpjrgchpoo FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fk7f289ja52ca48pnmc2are4k2k; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataentryformtranslations
    ADD CONSTRAINT fk7f289ja52ca48pnmc2are4k2k FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk7foo7k55ee6dko9a0a0jtxavx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicatorattributevalues
    ADD CONSTRAINT fk7foo7k55ee6dko9a0a0jtxavx FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fk7gxwqyqxq8cdxbwpl7unmmi9j; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY constantattributevalues
    ADD CONSTRAINT fk7gxwqyqxq8cdxbwpl7unmmi9j FOREIGN KEY (constantid) REFERENCES constant(constantid);


--
-- Name: fk7utgogpv8n5r4yxm41lhd70i0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisationunitattributevalues
    ADD CONSTRAINT fk7utgogpv8n5r4yxm41lhd70i0 FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk8eefwcsoitkehdl4qbpslnejb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programattributevalues
    ADD CONSTRAINT fk8eefwcsoitkehdl4qbpslnejb FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk8uk4v6qlon9hw0wlqsnrqj1wy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementcategoryusergroupaccesses
    ADD CONSTRAINT fk8uk4v6qlon9hw0wlqsnrqj1wy FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk8vhnmg1g2etu7mbiqjj0f6ajg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionsettranslations
    ADD CONSTRAINT fk8vhnmg1g2etu7mbiqjj0f6ajg FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk99kbmh5vouduw7bf7sm6buvbm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY legendsetusergroupaccesses
    ADD CONSTRAINT fk99kbmh5vouduw7bf7sm6buvbm FOREIGN KEY (maplegendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk9bekfhcd0225ip2lu83ub6hb8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationrulegroupusergroupaccesses
    ADD CONSTRAINT fk9bekfhcd0225ip2lu83ub6hb8 FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fk9jqvlhax7y8ea3i2q1qg4m08o; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstageattributevalues
    ADD CONSTRAINT fk9jqvlhax7y8ea3i2q1qg4m08o FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk9m9l857b29r9ic86qm04sjlmx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userroletranslations
    ADD CONSTRAINT fk9m9l857b29r9ic86qm04sjlmx FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk9tpnab44tsrxexa47qvr6dnq2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programattributevalues
    ADD CONSTRAINT fk9tpnab44tsrxexa47qvr6dnq2 FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fk9whlsdwfojxbp8yclqolqwm9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programnotificationtemplate
    ADD CONSTRAINT fk9whlsdwfojxbp8yclqolqwm9 FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk9y8t03jswqlpw5w6v6en2lgnf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasettranslations
    ADD CONSTRAINT fk9y8t03jswqlpw5w6v6en2lgnf FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fk9ylyd0xaehcn0gqr8d2stlr5q; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchartusergroupaccesses
    ADD CONSTRAINT fk9ylyd0xaehcn0gqr8d2stlr5q FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_attribute_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY attribute
    ADD CONSTRAINT fk_attribute_optionsetid FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fk_attributereservedvalue_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributereservedvalue
    ADD CONSTRAINT fk_attributereservedvalue_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_attributevalue_attributeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY attributevalue
    ADD CONSTRAINT fk_attributevalue_attributeid FOREIGN KEY (attributeid) REFERENCES attribute(attributeid);


--
-- Name: fk_attributevalue_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributevalue
    ADD CONSTRAINT fk_attributevalue_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_attributevalue_trackedentityinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributereservedvalue
    ADD CONSTRAINT fk_attributevalue_trackedentityinstanceid FOREIGN KEY (trackedentityinstanceid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_attributevalue_trackedentityinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributevalue
    ADD CONSTRAINT fk_attributevalue_trackedentityinstanceid FOREIGN KEY (trackedentityinstanceid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_attributevalueaudit_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributevalueaudit
    ADD CONSTRAINT fk_attributevalueaudit_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_attributevalueaudit_trackedentityinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributevalueaudit
    ADD CONSTRAINT fk_attributevalueaudit_trackedentityinstanceid FOREIGN KEY (trackedentityinstanceid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_categories_categoryoptions_categoryid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories_categoryoptions
    ADD CONSTRAINT fk_categories_categoryoptions_categoryid FOREIGN KEY (categoryid) REFERENCES dataelementcategory(categoryid);


--
-- Name: fk_category_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories_categoryoptions
    ADD CONSTRAINT fk_category_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fk_categorycombo_categoryid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categorycombos_categories
    ADD CONSTRAINT fk_categorycombo_categoryid FOREIGN KEY (categoryid) REFERENCES dataelementcategory(categoryid);


--
-- Name: fk_categorycombo_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categorycombos_optioncombos
    ADD CONSTRAINT fk_categorycombo_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_categorycombo_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categorycombo
    ADD CONSTRAINT fk_categorycombo_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_categorycombos_categories_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categorycombos_categories
    ADD CONSTRAINT fk_categorycombos_categories_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk_categorycombos_optioncombos_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categorycombos_optioncombos
    ADD CONSTRAINT fk_categorycombos_optioncombos_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk_categorydimension_category; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categorydimension
    ADD CONSTRAINT fk_categorydimension_category FOREIGN KEY (categoryid) REFERENCES dataelementcategory(categoryid);


--
-- Name: fk_categorydimension_items_categorydimensionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categorydimension_items
    ADD CONSTRAINT fk_categorydimension_items_categorydimensionid FOREIGN KEY (categorydimensionid) REFERENCES categorydimension(categorydimensionid);


--
-- Name: fk_categorydimension_items_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categorydimension_items
    ADD CONSTRAINT fk_categorydimension_items_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fk_categoryoption_organisationunits_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoption_organisationunits
    ADD CONSTRAINT fk_categoryoption_organisationunits_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fk_categoryoption_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoption_organisationunits
    ADD CONSTRAINT fk_categoryoption_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_categoryoptioncombo_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptioncombos_categoryoptions
    ADD CONSTRAINT fk_categoryoptioncombo_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fk_categoryoptioncombos_categoryoptions_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptioncombos_categoryoptions
    ADD CONSTRAINT fk_categoryoptioncombos_categoryoptions_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_categoryoptiongroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongroup
    ADD CONSTRAINT fk_categoryoptiongroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_categoryoptiongroupmembers_categoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongroupmembers
    ADD CONSTRAINT fk_categoryoptiongroupmembers_categoryoptiongroupid FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fk_categoryoptiongroupmembers_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongroupmembers
    ADD CONSTRAINT fk_categoryoptiongroupmembers_categoryoptionid FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fk_categoryoptiongroupset_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongroupset
    ADD CONSTRAINT fk_categoryoptiongroupset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_categoryoptiongroupsetmembers_categoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongroupsetmembers
    ADD CONSTRAINT fk_categoryoptiongroupsetmembers_categoryoptiongroupid FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fk_categoryoptiongroupsetmembers_categoryoptiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongroupsetmembers
    ADD CONSTRAINT fk_categoryoptiongroupsetmembers_categoryoptiongroupsetid FOREIGN KEY (categoryoptiongroupsetid) REFERENCES categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: fk_chart_categorydimensions_categorydimensionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_categorydimensions
    ADD CONSTRAINT fk_chart_categorydimensions_categorydimensionid FOREIGN KEY (categorydimensionid) REFERENCES categorydimension(categorydimensionid);


--
-- Name: fk_chart_categorydimensions_chartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_categorydimensions
    ADD CONSTRAINT fk_chart_categorydimensions_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_categoryoptiongroups_categoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_categoryoptiongroups
    ADD CONSTRAINT fk_chart_categoryoptiongroups_categoryoptiongroupid FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fk_chart_categoryoptiongroups_chartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_categoryoptiongroups
    ADD CONSTRAINT fk_chart_categoryoptiongroups_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_datadimensionitems_chartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_datadimensionitems
    ADD CONSTRAINT fk_chart_datadimensionitems_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_datadimensionitems_datadimensionitemid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_datadimensionitems
    ADD CONSTRAINT fk_chart_datadimensionitems_datadimensionitemid FOREIGN KEY (datadimensionitemid) REFERENCES datadimensionitem(datadimensionitemid);


--
-- Name: fk_chart_dataelementgroups_chartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_dataelementgroups
    ADD CONSTRAINT fk_chart_dataelementgroups_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_dataelementgroups_dataelementgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_dataelementgroups
    ADD CONSTRAINT fk_chart_dataelementgroups_dataelementgroupid FOREIGN KEY (dataelementgroupid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fk_chart_itemorgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_itemorgunitgroups
    ADD CONSTRAINT fk_chart_itemorgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_chart_itemorgunitunitgroups_chartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_itemorgunitgroups
    ADD CONSTRAINT fk_chart_itemorgunitunitgroups_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_organisationunits_chartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_organisationunits
    ADD CONSTRAINT fk_chart_organisationunits_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_organisationunits
    ADD CONSTRAINT fk_chart_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_chart_orgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_orgunitgroups
    ADD CONSTRAINT fk_chart_orgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_chart_orgunitlevels_chartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_orgunitlevels
    ADD CONSTRAINT fk_chart_orgunitlevels_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_orgunitunitgroups_chartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_orgunitgroups
    ADD CONSTRAINT fk_chart_orgunitunitgroups_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_periods_chartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_periods
    ADD CONSTRAINT fk_chart_periods_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_chart_periods_periodid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_periods
    ADD CONSTRAINT fk_chart_periods_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_chart_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart
    ADD CONSTRAINT fk_chart_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES relativeperiods(relativeperiodsid);


--
-- Name: fk_chart_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart
    ADD CONSTRAINT fk_chart_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_colorset_colors_colorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY colorset_colors
    ADD CONSTRAINT fk_colorset_colors_colorid FOREIGN KEY (colorid) REFERENCES color(colorid);


--
-- Name: fk_colorset_colors_colorsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY colorset_colors
    ADD CONSTRAINT fk_colorset_colors_colorsetid FOREIGN KEY (colorsetid) REFERENCES colorset(colorsetid);


--
-- Name: fk_completedatasetregistration_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY completedatasetregistration
    ADD CONSTRAINT fk_completedatasetregistration_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_completedatasetregistration_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY completedatasetregistration
    ADD CONSTRAINT fk_completedatasetregistration_organisationunitid FOREIGN KEY (sourceid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_configuration_corswhitelist; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY configuration_corswhitelist
    ADD CONSTRAINT fk_configuration_corswhitelist FOREIGN KEY (configurationid) REFERENCES configuration(configurationid);


--
-- Name: fk_configuration_feedback_recipients; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fk_configuration_feedback_recipients FOREIGN KEY (feedbackrecipientsid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_configuration_infrastructural_dataelements; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fk_configuration_infrastructural_dataelements FOREIGN KEY (infrastructuraldataelementsid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fk_configuration_infrastructural_indicators; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fk_configuration_infrastructural_indicators FOREIGN KEY (infrastructuralindicatorsid) REFERENCES indicatorgroup(indicatorgroupid);


--
-- Name: fk_configuration_infrastructural_periodtype; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fk_configuration_infrastructural_periodtype FOREIGN KEY (infrastructuralperiodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_configuration_offline_orgunit_level; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fk_configuration_offline_orgunit_level FOREIGN KEY (offlineorgunitlevelid) REFERENCES orgunitlevel(orgunitlevelid);


--
-- Name: fk_configuration_selfregistrationorgunit; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fk_configuration_selfregistrationorgunit FOREIGN KEY (selfregistrationorgunit) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_configuration_selfregistrationrole; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fk_configuration_selfregistrationrole FOREIGN KEY (selfregistrationrole) REFERENCES userrole(userroleid);


--
-- Name: fk_constant_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY constant
    ADD CONSTRAINT fk_constant_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dashboard_items_dashboardid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboard_items
    ADD CONSTRAINT fk_dashboard_items_dashboardid FOREIGN KEY (dashboardid) REFERENCES dashboard(dashboardid);


--
-- Name: fk_dashboard_items_dashboarditemid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboard_items
    ADD CONSTRAINT fk_dashboard_items_dashboarditemid FOREIGN KEY (dashboarditemid) REFERENCES dashboarditem(dashboarditemid);


--
-- Name: fk_dashboard_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboard
    ADD CONSTRAINT fk_dashboard_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dashboarditem_chartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT fk_dashboarditem_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_dashboarditem_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT fk_dashboarditem_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_dashboarditem_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT fk_dashboarditem_eventreportid FOREIGN KEY (eventreport) REFERENCES eventreport(eventreportid);


--
-- Name: fk_dashboarditem_mapid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT fk_dashboarditem_mapid FOREIGN KEY (mapid) REFERENCES map(mapid);


--
-- Name: fk_dashboarditem_reports_dashboardid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboarditem_reports
    ADD CONSTRAINT fk_dashboarditem_reports_dashboardid FOREIGN KEY (dashboarditemid) REFERENCES dashboarditem(dashboarditemid);


--
-- Name: fk_dashboarditem_reports_reportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboarditem_reports
    ADD CONSTRAINT fk_dashboarditem_reports_reportid FOREIGN KEY (reportid) REFERENCES report(reportid);


--
-- Name: fk_dashboarditem_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboarditem
    ADD CONSTRAINT fk_dashboarditem_reporttableid FOREIGN KEY (reporttable) REFERENCES reporttable(reporttableid);


--
-- Name: fk_dashboarditem_resources_dashboardid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboarditem_resources
    ADD CONSTRAINT fk_dashboarditem_resources_dashboardid FOREIGN KEY (dashboarditemid) REFERENCES dashboarditem(dashboarditemid);


--
-- Name: fk_dashboarditem_resources_resourceid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboarditem_resources
    ADD CONSTRAINT fk_dashboarditem_resources_resourceid FOREIGN KEY (resourceid) REFERENCES document(documentid);


--
-- Name: fk_dashboarditem_users_dashboardid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboarditem_users
    ADD CONSTRAINT fk_dashboarditem_users_dashboardid FOREIGN KEY (dashboarditemid) REFERENCES dashboarditem(dashboarditemid);


--
-- Name: fk_dashboarditem_users_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboarditem_users
    ADD CONSTRAINT fk_dashboarditem_users_userinfoid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataapproval_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT fk_dataapproval_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_dataapproval_creator; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT fk_dataapproval_creator FOREIGN KEY (creator) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataapproval_dataapprovallevel; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT fk_dataapproval_dataapprovallevel FOREIGN KEY (dataapprovallevelid) REFERENCES dataapprovallevel(dataapprovallevelid);


--
-- Name: fk_dataapproval_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT fk_dataapproval_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_dataapproval_periodid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT fk_dataapproval_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_dataapproval_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapproval
    ADD CONSTRAINT fk_dataapproval_workflowid FOREIGN KEY (workflowid) REFERENCES dataapprovalworkflow(workflowid);


--
-- Name: fk_dataapprovallevel_categoryoptiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapprovallevel
    ADD CONSTRAINT fk_dataapprovallevel_categoryoptiongroupsetid FOREIGN KEY (categoryoptiongroupsetid) REFERENCES categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: fk_dataapprovallevel_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapprovallevel
    ADD CONSTRAINT fk_dataapprovallevel_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataapprovalworkflow_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapprovalworkflow
    ADD CONSTRAINT fk_dataapprovalworkflow_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_dataapprovalworkflow_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapprovalworkflow
    ADD CONSTRAINT fk_dataapprovalworkflow_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataapprovalworkflowlevels_levelid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapprovalworkflowlevels
    ADD CONSTRAINT fk_dataapprovalworkflowlevels_levelid FOREIGN KEY (dataapprovallevelid) REFERENCES dataapprovallevel(dataapprovallevelid);


--
-- Name: fk_dataapprovalworkflowlevels_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapprovalworkflowlevels
    ADD CONSTRAINT fk_dataapprovalworkflowlevels_workflowid FOREIGN KEY (workflowid) REFERENCES dataapprovalworkflow(workflowid);


--
-- Name: fk_datadimensionitem_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_datadimensionitem_dataelementoperandid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_dataelementoperandid FOREIGN KEY (dataelementoperandid) REFERENCES dataelementoperand(dataelementoperandid);


--
-- Name: fk_datadimensionitem_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_datadimensionitem_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_indicatorid FOREIGN KEY (indicatorid) REFERENCES indicator(indicatorid);


--
-- Name: fk_datadimensionitem_programattributeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_programattributeid FOREIGN KEY (programattributeid) REFERENCES program_attributes(programtrackedentityattributeid);


--
-- Name: fk_datadimensionitem_programdataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_programdataelementid FOREIGN KEY (programdataelementid) REFERENCES programdataelement(programdataelementid);


--
-- Name: fk_datadimensionitem_programindicatorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datadimensionitem
    ADD CONSTRAINT fk_datadimensionitem_programindicatorid FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fk_dataelement_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT fk_dataelement_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk_dataelement_commentoptionsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT fk_dataelement_commentoptionsetid FOREIGN KEY (commentoptionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fk_dataelement_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY smscodes
    ADD CONSTRAINT fk_dataelement_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_dataelement_legendset; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT fk_dataelement_legendset FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_dataelement_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT fk_dataelement_optionsetid FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fk_dataelement_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelement
    ADD CONSTRAINT fk_dataelement_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataelementaggregationlevels_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementaggregationlevels
    ADD CONSTRAINT fk_dataelementaggregationlevels_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_dataelementcategory_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementcategory
    ADD CONSTRAINT fk_dataelementcategory_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataelementcategoryoption_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementcategoryoption
    ADD CONSTRAINT fk_dataelementcategoryoption_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataelementgroup_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgroupmembers
    ADD CONSTRAINT fk_dataelementgroup_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_dataelementgroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgroup
    ADD CONSTRAINT fk_dataelementgroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataelementgroupmembers_dataelementgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgroupmembers
    ADD CONSTRAINT fk_dataelementgroupmembers_dataelementgroupid FOREIGN KEY (dataelementgroupid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fk_dataelementgroupset_dataelementgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgroupsetmembers
    ADD CONSTRAINT fk_dataelementgroupset_dataelementgroupid FOREIGN KEY (dataelementgroupid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fk_dataelementgroupset_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgroupset
    ADD CONSTRAINT fk_dataelementgroupset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataelementgroupsetmembers_dataelementgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgroupsetmembers
    ADD CONSTRAINT fk_dataelementgroupsetmembers_dataelementgroupsetid FOREIGN KEY (dataelementgroupsetid) REFERENCES dataelementgroupset(dataelementgroupsetid);


--
-- Name: fk_dataelementoperand_dataelement; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementoperand
    ADD CONSTRAINT fk_dataelementoperand_dataelement FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_dataelementoperand_dataelementcategoryoptioncombo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementoperand
    ADD CONSTRAINT fk_dataelementoperand_dataelementcategoryoptioncombo FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_dataset_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT fk_dataset_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk_dataset_dataelementoperandid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasetoperands
    ADD CONSTRAINT fk_dataset_dataelementoperandid FOREIGN KEY (dataelementoperandid) REFERENCES dataelementoperand(dataelementoperandid);


--
-- Name: fk_dataset_dataentryform; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT fk_dataset_dataentryform FOREIGN KEY (dataentryform) REFERENCES dataentryform(dataentryformid);


--
-- Name: fk_dataset_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY smscommands
    ADD CONSTRAINT fk_dataset_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_dataset_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasetindicators
    ADD CONSTRAINT fk_dataset_indicatorid FOREIGN KEY (indicatorid) REFERENCES indicator(indicatorid);


--
-- Name: fk_dataset_legendset; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT fk_dataset_legendset FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_dataset_notificationrecipients; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT fk_dataset_notificationrecipients FOREIGN KEY (notificationrecipients) REFERENCES usergroup(usergroupid);


--
-- Name: fk_dataset_organisationunit; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasetsource
    ADD CONSTRAINT fk_dataset_organisationunit FOREIGN KEY (sourceid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_dataset_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT fk_dataset_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_dataset_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT fk_dataset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_dataset_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT fk_dataset_workflowid FOREIGN KEY (workflowid) REFERENCES dataapprovalworkflow(workflowid);


--
-- Name: fk_datasetcompleteregistration_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY completedatasetregistration
    ADD CONSTRAINT fk_datasetcompleteregistration_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_datasetcompleteregistration_periodid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY completedatasetregistration
    ADD CONSTRAINT fk_datasetcompleteregistration_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_datasetelement_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasetelement
    ADD CONSTRAINT fk_datasetelement_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk_datasetindicators_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasetindicators
    ADD CONSTRAINT fk_datasetindicators_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_datasetmembers_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasetelement
    ADD CONSTRAINT fk_datasetmembers_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_datasetmembers_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasetelement
    ADD CONSTRAINT fk_datasetmembers_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_datasetoperands_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasetoperands
    ADD CONSTRAINT fk_datasetoperands_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_datasetsource_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasetsource
    ADD CONSTRAINT fk_datasetsource_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_datavalue_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datavalue
    ADD CONSTRAINT fk_datavalue_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_datavalue_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datavalue
    ADD CONSTRAINT fk_datavalue_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_datavalue_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datavalue
    ADD CONSTRAINT fk_datavalue_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_datavalue_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datavalue
    ADD CONSTRAINT fk_datavalue_organisationunitid FOREIGN KEY (sourceid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_datavalue_periodid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datavalue
    ADD CONSTRAINT fk_datavalue_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_datavalueaudit_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datavalueaudit
    ADD CONSTRAINT fk_datavalueaudit_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_datavalueaudit_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datavalueaudit
    ADD CONSTRAINT fk_datavalueaudit_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_datavalueaudit_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datavalueaudit
    ADD CONSTRAINT fk_datavalueaudit_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_datavalueaudit_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datavalueaudit
    ADD CONSTRAINT fk_datavalueaudit_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_datavalueaudit_periodid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datavalueaudit
    ADD CONSTRAINT fk_datavalueaudit_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_document_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY document
    ADD CONSTRAINT fk_document_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_entityinstancedatavalue_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentitydatavalue
    ADD CONSTRAINT fk_entityinstancedatavalue_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_entityinstancedatavalue_programstageinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentitydatavalue
    ADD CONSTRAINT fk_entityinstancedatavalue_programstageinstanceid FOREIGN KEY (programstageinstanceid) REFERENCES programstageinstance(programstageinstanceid);


--
-- Name: fk_entityinstancedatavalueaudit_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentitydatavalueaudit
    ADD CONSTRAINT fk_entityinstancedatavalueaudit_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_entityinstancedatavalueaudit_programstageinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentitydatavalueaudit
    ADD CONSTRAINT fk_entityinstancedatavalueaudit_programstageinstanceid FOREIGN KEY (programstageinstanceid) REFERENCES programstageinstance(programstageinstanceid);


--
-- Name: fk_eventchart_attributedimensions_attributedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_attributedimensions
    ADD CONSTRAINT fk_eventchart_attributedimensions_attributedimensionid FOREIGN KEY (trackedentityattributedimensionid) REFERENCES trackedentityattributedimension(trackedentityattributedimensionid);


--
-- Name: fk_eventchart_attributedimensions_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_attributedimensions
    ADD CONSTRAINT fk_eventchart_attributedimensions_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_attributevaluedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT fk_eventchart_attributevaluedimensionid FOREIGN KEY (attributevaluedimensionid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_eventchart_columns_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_columns
    ADD CONSTRAINT fk_eventchart_columns_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_dataelementdimensions_dataelementdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_dataelementdimensions
    ADD CONSTRAINT fk_eventchart_dataelementdimensions_dataelementdimensionid FOREIGN KEY (trackedentitydataelementdimensionid) REFERENCES trackedentitydataelementdimension(trackedentitydataelementdimensionid);


--
-- Name: fk_eventchart_dataelementdimensions_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_dataelementdimensions
    ADD CONSTRAINT fk_eventchart_dataelementdimensions_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_dataelementvaluedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT fk_eventchart_dataelementvaluedimensionid FOREIGN KEY (dataelementvaluedimensionid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_eventchart_filters_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_filters
    ADD CONSTRAINT fk_eventchart_filters_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_itemorgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_itemorgunitgroups
    ADD CONSTRAINT fk_eventchart_itemorgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_eventchart_itemorgunitunitgroups_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_itemorgunitgroups
    ADD CONSTRAINT fk_eventchart_itemorgunitunitgroups_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_organisationunits_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_organisationunits
    ADD CONSTRAINT fk_eventchart_organisationunits_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_organisationunits
    ADD CONSTRAINT fk_eventchart_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_eventchart_orgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_orgunitgroups
    ADD CONSTRAINT fk_eventchart_orgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_eventchart_orgunitlevels_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_orgunitlevels
    ADD CONSTRAINT fk_eventchart_orgunitlevels_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_orgunitunitgroups_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_orgunitgroups
    ADD CONSTRAINT fk_eventchart_orgunitunitgroups_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_periods_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_periods
    ADD CONSTRAINT fk_eventchart_periods_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_periods_periodid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_periods
    ADD CONSTRAINT fk_eventchart_periods_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_eventchart_prindicatordimensions_prindicatordimensionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_programindicatordimensions
    ADD CONSTRAINT fk_eventchart_prindicatordimensions_prindicatordimensionid FOREIGN KEY (trackedentityprogramindicatordimensionid) REFERENCES trackedentityprogramindicatordimension(trackedentityprogramindicatordimensionid);


--
-- Name: fk_eventchart_programid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT fk_eventchart_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_eventchart_programindicatordimensions_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_programindicatordimensions
    ADD CONSTRAINT fk_eventchart_programindicatordimensions_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT fk_eventchart_programstageid FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_eventchart_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT fk_eventchart_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES relativeperiods(relativeperiodsid);


--
-- Name: fk_eventchart_rows_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart_rows
    ADD CONSTRAINT fk_eventchart_rows_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_eventchart_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchart
    ADD CONSTRAINT fk_eventchart_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_eventreport_attributedimensions_attributedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_attributedimensions
    ADD CONSTRAINT fk_eventreport_attributedimensions_attributedimensionid FOREIGN KEY (trackedentityattributedimensionid) REFERENCES trackedentityattributedimension(trackedentityattributedimensionid);


--
-- Name: fk_eventreport_attributedimensions_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_attributedimensions
    ADD CONSTRAINT fk_eventreport_attributedimensions_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_attributevaluedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT fk_eventreport_attributevaluedimensionid FOREIGN KEY (attributevaluedimensionid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_eventreport_columns_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_columns
    ADD CONSTRAINT fk_eventreport_columns_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_dataelementdimensions_dataelementdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_dataelementdimensions
    ADD CONSTRAINT fk_eventreport_dataelementdimensions_dataelementdimensionid FOREIGN KEY (trackedentitydataelementdimensionid) REFERENCES trackedentitydataelementdimension(trackedentitydataelementdimensionid);


--
-- Name: fk_eventreport_dataelementdimensions_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_dataelementdimensions
    ADD CONSTRAINT fk_eventreport_dataelementdimensions_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_dataelementvaluedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT fk_eventreport_dataelementvaluedimensionid FOREIGN KEY (dataelementvaluedimensionid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_eventreport_filters_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_filters
    ADD CONSTRAINT fk_eventreport_filters_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_itemorgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_itemorgunitgroups
    ADD CONSTRAINT fk_eventreport_itemorgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_eventreport_itemorgunitunitgroups_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_itemorgunitgroups
    ADD CONSTRAINT fk_eventreport_itemorgunitunitgroups_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_organisationunits_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_organisationunits
    ADD CONSTRAINT fk_eventreport_organisationunits_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_organisationunits
    ADD CONSTRAINT fk_eventreport_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_eventreport_orgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_orgunitgroups
    ADD CONSTRAINT fk_eventreport_orgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_eventreport_orgunitlevels_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_orgunitlevels
    ADD CONSTRAINT fk_eventreport_orgunitlevels_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_orgunitunitgroups_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_orgunitgroups
    ADD CONSTRAINT fk_eventreport_orgunitunitgroups_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_periods_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_periods
    ADD CONSTRAINT fk_eventreport_periods_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_periods_periodid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_periods
    ADD CONSTRAINT fk_eventreport_periods_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_eventreport_prindicatordimensions_prindicatordimensionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_programindicatordimensions
    ADD CONSTRAINT fk_eventreport_prindicatordimensions_prindicatordimensionid FOREIGN KEY (trackedentityprogramindicatordimensionid) REFERENCES trackedentityprogramindicatordimension(trackedentityprogramindicatordimensionid);


--
-- Name: fk_eventreport_programid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT fk_eventreport_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_eventreport_programindicatordimensions_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_programindicatordimensions
    ADD CONSTRAINT fk_eventreport_programindicatordimensions_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT fk_eventreport_programstageid FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_eventreport_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT fk_eventreport_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES relativeperiods(relativeperiodsid);


--
-- Name: fk_eventreport_rows_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport_rows
    ADD CONSTRAINT fk_eventreport_rows_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_eventreport_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreport
    ADD CONSTRAINT fk_eventreport_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_expression_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY expressiondataelement
    ADD CONSTRAINT fk_expression_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_expression_sampleelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY expressionsampleelement
    ADD CONSTRAINT fk_expression_sampleelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_expressiondataelement_expressionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY expressiondataelement
    ADD CONSTRAINT fk_expressiondataelement_expressionid FOREIGN KEY (expressionid) REFERENCES expression(expressionid);


--
-- Name: fk_expressionsampleelement_expressionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY expressionsampleelement
    ADD CONSTRAINT fk_expressionsampleelement_expressionid FOREIGN KEY (expressionid) REFERENCES expression(expressionid);


--
-- Name: fk_externalmaplayer_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY externalmaplayer
    ADD CONSTRAINT fk_externalmaplayer_legendsetid FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_externalmaplayer_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY externalmaplayer
    ADD CONSTRAINT fk_externalmaplayer_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_fileresource_externalfileresource; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY externalfileresource
    ADD CONSTRAINT fk_fileresource_externalfileresource FOREIGN KEY (fileresourceid) REFERENCES fileresource(fileresourceid);


--
-- Name: fk_fileresource_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fileresource
    ADD CONSTRAINT fk_fileresource_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_fk_users_catconstraints_dataelementcategoryid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users_catdimensionconstraints
    ADD CONSTRAINT fk_fk_users_catconstraints_dataelementcategoryid FOREIGN KEY (dataelementcategoryid) REFERENCES dataelementcategory(categoryid);


--
-- Name: fk_fk_users_cogsconstraints_categoryoptiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users_cogsdimensionconstraints
    ADD CONSTRAINT fk_fk_users_cogsconstraints_categoryoptiongroupsetid FOREIGN KEY (categoryoptiongroupsetid) REFERENCES categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: fk_indicator_indicatortypeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicator
    ADD CONSTRAINT fk_indicator_indicatortypeid FOREIGN KEY (indicatortypeid) REFERENCES indicatortype(indicatortypeid);


--
-- Name: fk_indicator_legendset; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicator
    ADD CONSTRAINT fk_indicator_legendset FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_indicator_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicator
    ADD CONSTRAINT fk_indicator_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_indicatorgroup_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgroupmembers
    ADD CONSTRAINT fk_indicatorgroup_indicatorid FOREIGN KEY (indicatorid) REFERENCES indicator(indicatorid);


--
-- Name: fk_indicatorgroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgroup
    ADD CONSTRAINT fk_indicatorgroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_indicatorgroupmembers_indicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgroupmembers
    ADD CONSTRAINT fk_indicatorgroupmembers_indicatorgroupid FOREIGN KEY (indicatorgroupid) REFERENCES indicatorgroup(indicatorgroupid);


--
-- Name: fk_indicatorgroupset_indicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgroupsetmembers
    ADD CONSTRAINT fk_indicatorgroupset_indicatorgroupid FOREIGN KEY (indicatorgroupid) REFERENCES indicatorgroup(indicatorgroupid);


--
-- Name: fk_indicatorgroupset_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgroupset
    ADD CONSTRAINT fk_indicatorgroupset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_indicatorgroupsetmembers_indicatorgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgroupsetmembers
    ADD CONSTRAINT fk_indicatorgroupsetmembers_indicatorgroupsetid FOREIGN KEY (indicatorgroupsetid) REFERENCES indicatorgroupset(indicatorgroupsetid);


--
-- Name: fk_intepretation_likedby_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY intepretation_likedby
    ADD CONSTRAINT fk_intepretation_likedby_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_interpretation_chartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_interpretation_comments_interpretationcommentid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interpretation_comments
    ADD CONSTRAINT fk_interpretation_comments_interpretationcommentid FOREIGN KEY (interpretationcommentid) REFERENCES interpretationcomment(interpretationcommentid);


--
-- Name: fk_interpretation_comments_interpretationid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interpretation_comments
    ADD CONSTRAINT fk_interpretation_comments_interpretationid FOREIGN KEY (interpretationid) REFERENCES interpretation(interpretationid);


--
-- Name: fk_interpretation_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_interpretation_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_interpretation_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_interpretation_likedby_interpretationid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY intepretation_likedby
    ADD CONSTRAINT fk_interpretation_likedby_interpretationid FOREIGN KEY (interpretationid) REFERENCES interpretation(interpretationid);


--
-- Name: fk_interpretation_mapid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_mapid FOREIGN KEY (mapid) REFERENCES map(mapid);


--
-- Name: fk_interpretation_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_interpretation_periodid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_interpretation_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_interpretation_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interpretation
    ADD CONSTRAINT fk_interpretation_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_interpretationcomment_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interpretationcomment
    ADD CONSTRAINT fk_interpretationcomment_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_legendset_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY maplegendset
    ADD CONSTRAINT fk_legendset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_lockexception_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lockexception
    ADD CONSTRAINT fk_lockexception_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_lockexception_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lockexception
    ADD CONSTRAINT fk_lockexception_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_lockexception_periodid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lockexception
    ADD CONSTRAINT fk_lockexception_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_maplegendset_maplegend; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY maplegendsetmaplegend
    ADD CONSTRAINT fk_maplegendset_maplegend FOREIGN KEY (maplegendid) REFERENCES maplegend(maplegendid);


--
-- Name: fk_maplegendsetmaplegend_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY maplegendsetmaplegend
    ADD CONSTRAINT fk_maplegendsetmaplegend_legendsetid FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_mapmapview_mapid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapmapviews
    ADD CONSTRAINT fk_mapmapview_mapid FOREIGN KEY (mapid) REFERENCES map(mapid);


--
-- Name: fk_mapmapview_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapmapviews
    ADD CONSTRAINT fk_mapmapview_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_attributedimensions_attributedimensionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview_attributedimensions
    ADD CONSTRAINT fk_mapview_attributedimensions_attributedimensionid FOREIGN KEY (trackedentityattributedimensionid) REFERENCES trackedentityattributedimension(trackedentityattributedimensionid);


--
-- Name: fk_mapview_attributedimensions_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview_attributedimensions
    ADD CONSTRAINT fk_mapview_attributedimensions_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_columns_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview_columns
    ADD CONSTRAINT fk_mapview_columns_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_datadimensionitems_datadimensionitemid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview_datadimensionitems
    ADD CONSTRAINT fk_mapview_datadimensionitems_datadimensionitemid FOREIGN KEY (datadimensionitemid) REFERENCES datadimensionitem(datadimensionitemid);


--
-- Name: fk_mapview_datadimensionitems_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview_datadimensionitems
    ADD CONSTRAINT fk_mapview_datadimensionitems_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_dataelementdimensions_dataelementdimensionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview_dataelementdimensions
    ADD CONSTRAINT fk_mapview_dataelementdimensions_dataelementdimensionid FOREIGN KEY (trackedentitydataelementdimensionid) REFERENCES trackedentitydataelementdimension(trackedentitydataelementdimensionid);


--
-- Name: fk_mapview_dataelementdimensions_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview_dataelementdimensions
    ADD CONSTRAINT fk_mapview_dataelementdimensions_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_itemorgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview_itemorgunitgroups
    ADD CONSTRAINT fk_mapview_itemorgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_mapview_itemorgunitunitgroups_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview_itemorgunitgroups
    ADD CONSTRAINT fk_mapview_itemorgunitunitgroups_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_maplegendsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT fk_mapview_maplegendsetid FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_mapview_organisationunits_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview_organisationunits
    ADD CONSTRAINT fk_mapview_organisationunits_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview_organisationunits
    ADD CONSTRAINT fk_mapview_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_mapview_orgunitgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT fk_mapview_orgunitgroupsetid FOREIGN KEY (orgunitgroupsetid) REFERENCES orgunitgroupset(orgunitgroupsetid);


--
-- Name: fk_mapview_orgunitlevels_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview_orgunitlevels
    ADD CONSTRAINT fk_mapview_orgunitlevels_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_periods_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview_periods
    ADD CONSTRAINT fk_mapview_periods_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_mapview_periods_periodid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview_periods
    ADD CONSTRAINT fk_mapview_periods_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_mapview_programid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT fk_mapview_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_mapview_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT fk_mapview_programstageid FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_mapview_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapview
    ADD CONSTRAINT fk_mapview_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES relativeperiods(relativeperiodsid);


--
-- Name: fk_mapview_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY map
    ADD CONSTRAINT fk_mapview_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_message_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY message
    ADD CONSTRAINT fk_message_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_messageconversation_lastsender_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY messageconversation
    ADD CONSTRAINT fk_messageconversation_lastsender_userid FOREIGN KEY (lastsenderid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_messageconversation_messages_messageconversationid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY messageconversation_messages
    ADD CONSTRAINT fk_messageconversation_messages_messageconversationid FOREIGN KEY (messageconversationid) REFERENCES messageconversation(messageconversationid);


--
-- Name: fk_messageconversation_messages_messageid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY messageconversation_messages
    ADD CONSTRAINT fk_messageconversation_messages_messageid FOREIGN KEY (messageid) REFERENCES message(messageid);


--
-- Name: fk_messageconversation_user_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY messageconversation
    ADD CONSTRAINT fk_messageconversation_user_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_messageconversation_usermessages_messageconversationid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY messageconversation_usermessages
    ADD CONSTRAINT fk_messageconversation_usermessages_messageconversationid FOREIGN KEY (messageconversationid) REFERENCES messageconversation(messageconversationid);


--
-- Name: fk_messageconversation_usermessages_usermessageid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY messageconversation_usermessages
    ADD CONSTRAINT fk_messageconversation_usermessages_usermessageid FOREIGN KEY (usermessageid) REFERENCES usermessage(usermessageid);


--
-- Name: fk_minmaxdataelement_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY minmaxdataelement
    ADD CONSTRAINT fk_minmaxdataelement_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_minmaxdataelement_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY minmaxdataelement
    ADD CONSTRAINT fk_minmaxdataelement_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_minmaxdataelement_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY minmaxdataelement
    ADD CONSTRAINT fk_minmaxdataelement_organisationunitid FOREIGN KEY (sourceid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_oauth2clientgranttypes_oauth2clientid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth2clientgranttypes
    ADD CONSTRAINT fk_oauth2clientgranttypes_oauth2clientid FOREIGN KEY (oauth2clientid) REFERENCES oauth2client(oauth2clientid);


--
-- Name: fk_oauth2clientredirecturis_oauth2clientid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth2clientredirecturis
    ADD CONSTRAINT fk_oauth2clientredirecturis_oauth2clientid FOREIGN KEY (oauth2clientid) REFERENCES oauth2client(oauth2clientid);


--
-- Name: fk_objecttranslation_attributeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY attributetranslations
    ADD CONSTRAINT fk_objecttranslation_attributeid FOREIGN KEY (attributeid) REFERENCES attribute(attributeid);


--
-- Name: fk_objecttranslation_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categorycombotranslations
    ADD CONSTRAINT fk_objecttranslation_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk_objecttranslation_categoryid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementcategorytranslations
    ADD CONSTRAINT fk_objecttranslation_categoryid FOREIGN KEY (categoryid) REFERENCES dataelementcategory(categoryid);


--
-- Name: fk_objecttranslation_categoryoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptioncombotranslations
    ADD CONSTRAINT fk_objecttranslation_categoryoptioncomboid FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_objecttranslation_categoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongrouptranslations
    ADD CONSTRAINT fk_objecttranslation_categoryoptiongroupid FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fk_objecttranslation_categoryoptiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongroupsettranslations
    ADD CONSTRAINT fk_objecttranslation_categoryoptiongroupsetid FOREIGN KEY (categoryoptiongroupsetid) REFERENCES categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: fk_objecttranslation_categoryoptionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiontranslations
    ADD CONSTRAINT fk_objecttranslation_categoryoptionid FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fk_objecttranslation_chartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY charttranslations
    ADD CONSTRAINT fk_objecttranslation_chartid FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fk_objecttranslation_colorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY colortranslations
    ADD CONSTRAINT fk_objecttranslation_colorid FOREIGN KEY (colorid) REFERENCES color(colorid);


--
-- Name: fk_objecttranslation_colorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY constanttranslations
    ADD CONSTRAINT fk_objecttranslation_colorid FOREIGN KEY (colorid) REFERENCES constant(constantid);


--
-- Name: fk_objecttranslation_colorsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY colorsettranslations
    ADD CONSTRAINT fk_objecttranslation_colorsetid FOREIGN KEY (colorsetid) REFERENCES colorset(colorsetid);


--
-- Name: fk_objecttranslation_dashboardid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboardtranslations
    ADD CONSTRAINT fk_objecttranslation_dashboardid FOREIGN KEY (dashboardid) REFERENCES dashboard(dashboardid);


--
-- Name: fk_objecttranslation_dashboarditemid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboarditemtranslations
    ADD CONSTRAINT fk_objecttranslation_dashboarditemid FOREIGN KEY (dashboarditemid) REFERENCES dashboarditem(dashboarditemid);


--
-- Name: fk_objecttranslation_dataapprovallevelid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapprovalleveltranslations
    ADD CONSTRAINT fk_objecttranslation_dataapprovallevelid FOREIGN KEY (dataapprovallevelid) REFERENCES dataapprovallevel(dataapprovallevelid);


--
-- Name: fk_objecttranslation_dataelementgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgrouptranslations
    ADD CONSTRAINT fk_objecttranslation_dataelementgroupid FOREIGN KEY (dataelementgroupid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fk_objecttranslation_dataelementgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgroupsettranslations
    ADD CONSTRAINT fk_objecttranslation_dataelementgroupsetid FOREIGN KEY (dataelementgroupsetid) REFERENCES dataelementgroupset(dataelementgroupsetid);


--
-- Name: fk_objecttranslation_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementtranslations
    ADD CONSTRAINT fk_objecttranslation_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_objecttranslation_dataentryformid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataentryformtranslations
    ADD CONSTRAINT fk_objecttranslation_dataentryformid FOREIGN KEY (dataentryformid) REFERENCES dataentryform(dataentryformid);


--
-- Name: fk_objecttranslation_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasettranslations
    ADD CONSTRAINT fk_objecttranslation_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_objecttranslation_documentid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documenttranslations
    ADD CONSTRAINT fk_objecttranslation_documentid FOREIGN KEY (documentid) REFERENCES document(documentid);


--
-- Name: fk_objecttranslation_eventchartid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventcharttranslations
    ADD CONSTRAINT fk_objecttranslation_eventchartid FOREIGN KEY (eventchartid) REFERENCES eventchart(eventchartid);


--
-- Name: fk_objecttranslation_eventreportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreporttranslations
    ADD CONSTRAINT fk_objecttranslation_eventreportid FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fk_objecttranslation_indicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgrouptranslations
    ADD CONSTRAINT fk_objecttranslation_indicatorgroupid FOREIGN KEY (indicatorgroupid) REFERENCES indicatorgroup(indicatorgroupid);


--
-- Name: fk_objecttranslation_indicatorgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgroupsettranslations
    ADD CONSTRAINT fk_objecttranslation_indicatorgroupsetid FOREIGN KEY (indicatorgroupsetid) REFERENCES indicatorgroupset(indicatorgroupsetid);


--
-- Name: fk_objecttranslation_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatortranslations
    ADD CONSTRAINT fk_objecttranslation_indicatorid FOREIGN KEY (indicatorid) REFERENCES indicator(indicatorid);


--
-- Name: fk_objecttranslation_indicatortypeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatortypetranslations
    ADD CONSTRAINT fk_objecttranslation_indicatortypeid FOREIGN KEY (indicatortypeid) REFERENCES indicatortype(indicatortypeid);


--
-- Name: fk_objecttranslation_maplegendid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY maplegendtranslations
    ADD CONSTRAINT fk_objecttranslation_maplegendid FOREIGN KEY (maplegendid) REFERENCES maplegend(maplegendid);


--
-- Name: fk_objecttranslation_maplegendsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY maplegendsettranslations
    ADD CONSTRAINT fk_objecttranslation_maplegendsetid FOREIGN KEY (maplegendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_objecttranslation_mapviewid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapviewtranslations
    ADD CONSTRAINT fk_objecttranslation_mapviewid FOREIGN KEY (mapviewid) REFERENCES mapview(mapviewid);


--
-- Name: fk_objecttranslation_optiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongrouptranslations
    ADD CONSTRAINT fk_objecttranslation_optiongroupid FOREIGN KEY (optiongroupid) REFERENCES optiongroup(optiongroupid);


--
-- Name: fk_objecttranslation_optiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongroupsettranslations
    ADD CONSTRAINT fk_objecttranslation_optiongroupsetid FOREIGN KEY (optiongroupsetid) REFERENCES optiongroupset(optiongroupsetid);


--
-- Name: fk_objecttranslation_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionsettranslations
    ADD CONSTRAINT fk_objecttranslation_optionsetid FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fk_objecttranslation_optionvalueid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvaluetranslations
    ADD CONSTRAINT fk_objecttranslation_optionvalueid FOREIGN KEY (optionvalueid) REFERENCES optionvalue(optionvalueid);


--
-- Name: fk_objecttranslation_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisationunittranslations
    ADD CONSTRAINT fk_objecttranslation_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_objecttranslation_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgrouptranslations
    ADD CONSTRAINT fk_objecttranslation_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_objecttranslation_orgunitgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroupsettranslations
    ADD CONSTRAINT fk_objecttranslation_orgunitgroupsetid FOREIGN KEY (orgunitgroupsetid) REFERENCES orgunitgroupset(orgunitgroupsetid);


--
-- Name: fk_objecttranslation_orgunitlevelid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitleveltranslations
    ADD CONSTRAINT fk_objecttranslation_orgunitlevelid FOREIGN KEY (orgunitlevelid) REFERENCES orgunitlevel(orgunitlevelid);


--
-- Name: fk_objecttranslation_programdataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdataelementtranslations
    ADD CONSTRAINT fk_objecttranslation_programdataelementid FOREIGN KEY (programdataelementid) REFERENCES programdataelement(programdataelementid);


--
-- Name: fk_objecttranslation_programid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programtranslations
    ADD CONSTRAINT fk_objecttranslation_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_objecttranslation_programindicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicatorgrouptranslations
    ADD CONSTRAINT fk_objecttranslation_programindicatorgroupid FOREIGN KEY (programindicatorgroupid) REFERENCES programindicatorgroup(programindicatorgroupid);


--
-- Name: fk_objecttranslation_programindicatorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicatortranslations
    ADD CONSTRAINT fk_objecttranslation_programindicatorid FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fk_objecttranslation_programmessageid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programmessagetranslations
    ADD CONSTRAINT fk_objecttranslation_programmessageid FOREIGN KEY (id) REFERENCES programmessage(id);


--
-- Name: fk_objecttranslation_programruleid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programruletranslations
    ADD CONSTRAINT fk_objecttranslation_programruleid FOREIGN KEY (programruleid) REFERENCES programrule(programruleid);


--
-- Name: fk_objecttranslation_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstagetranslations
    ADD CONSTRAINT fk_objecttranslation_programstageid FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_objecttranslation_programstagesectionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstagesectiontranslations
    ADD CONSTRAINT fk_objecttranslation_programstagesectionid FOREIGN KEY (programstagesectionid) REFERENCES programstagesection(programstagesectionid);


--
-- Name: fk_objecttranslation_relationshiptypeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relationshiptypetranslations
    ADD CONSTRAINT fk_objecttranslation_relationshiptypeid FOREIGN KEY (relationshiptypeid) REFERENCES relationshiptype(relationshiptypeid);


--
-- Name: fk_objecttranslation_reportid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttranslations
    ADD CONSTRAINT fk_objecttranslation_reportid FOREIGN KEY (reportid) REFERENCES report(reportid);


--
-- Name: fk_objecttranslation_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttabletranslations
    ADD CONSTRAINT fk_objecttranslation_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_objecttranslation_sectionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasetsectiontranslations
    ADD CONSTRAINT fk_objecttranslation_sectionid FOREIGN KEY (sectionid) REFERENCES section(sectionid);


--
-- Name: fk_objecttranslation_trackedentityattributegroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributegrouptranslations
    ADD CONSTRAINT fk_objecttranslation_trackedentityattributegroupid FOREIGN KEY (trackedentityattributegroupid) REFERENCES trackedentityattributegroup(trackedentityattributegroupid);


--
-- Name: fk_objecttranslation_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributetranslations
    ADD CONSTRAINT fk_objecttranslation_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_objecttranslation_trackedentityid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentitytranslations
    ADD CONSTRAINT fk_objecttranslation_trackedentityid FOREIGN KEY (trackedentityid) REFERENCES trackedentity(trackedentityid);


--
-- Name: fk_objecttranslation_usergroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usergrouptranslations
    ADD CONSTRAINT fk_objecttranslation_usergroupid FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_objecttranslation_userroleid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userroletranslations
    ADD CONSTRAINT fk_objecttranslation_userroleid FOREIGN KEY (userroleid) REFERENCES userrole(userroleid);


--
-- Name: fk_objecttranslation_validationcriteriaid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationcriteriatranslations
    ADD CONSTRAINT fk_objecttranslation_validationcriteriaid FOREIGN KEY (validationcriteriaid) REFERENCES validationcriteria(validationcriteriaid);


--
-- Name: fk_objecttranslation_validationrulegroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationrulegrouptranslations
    ADD CONSTRAINT fk_objecttranslation_validationrulegroupid FOREIGN KEY (validationrulegroupid) REFERENCES validationrulegroup(validationrulegroupid);


--
-- Name: fk_objecttranslation_validationruleid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationruletranslations
    ADD CONSTRAINT fk_objecttranslation_validationruleid FOREIGN KEY (validationruleid) REFERENCES validationrule(validationruleid);


--
-- Name: fk_objecttranslation_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapprovalworkflowtranslations
    ADD CONSTRAINT fk_objecttranslation_workflowid FOREIGN KEY (workflowid) REFERENCES dataapprovalworkflow(workflowid);


--
-- Name: fk_optiongroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongroup
    ADD CONSTRAINT fk_optiongroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_optiongroupmembers_optiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongroupmembers
    ADD CONSTRAINT fk_optiongroupmembers_optiongroupid FOREIGN KEY (optionid) REFERENCES optionvalue(optionvalueid);


--
-- Name: fk_optiongroupmembers_optionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongroupmembers
    ADD CONSTRAINT fk_optiongroupmembers_optionid FOREIGN KEY (optiongroupid) REFERENCES optiongroup(optiongroupid);


--
-- Name: fk_optiongroupset_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongroupset
    ADD CONSTRAINT fk_optiongroupset_optionsetid FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fk_optiongroupset_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongroupset
    ADD CONSTRAINT fk_optiongroupset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_optiongroupsetmembers_optiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongroupsetmembers
    ADD CONSTRAINT fk_optiongroupsetmembers_optiongroupid FOREIGN KEY (optiongroupid) REFERENCES optiongroup(optiongroupid);


--
-- Name: fk_optiongroupsetmembers_optiongroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongroupsetmembers
    ADD CONSTRAINT fk_optiongroupsetmembers_optiongroupsetid FOREIGN KEY (optiongroupsetid) REFERENCES optiongroupset(optiongroupsetid);


--
-- Name: fk_optionset_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionset
    ADD CONSTRAINT fk_optionset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_optionsetmembers_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_optionsetmembers_optionsetid FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fk_organisationunit_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisationunit
    ADD CONSTRAINT fk_organisationunit_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_orgunitgroup_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroupmembers
    ADD CONSTRAINT fk_orgunitgroup_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_orgunitgroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroup
    ADD CONSTRAINT fk_orgunitgroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_orgunitgroupmembers_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroupmembers
    ADD CONSTRAINT fk_orgunitgroupmembers_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_orgunitgroupset_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroupsetmembers
    ADD CONSTRAINT fk_orgunitgroupset_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_orgunitgroupset_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroupset
    ADD CONSTRAINT fk_orgunitgroupset_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_orgunitgroupsetmembers_orgunitgroupsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroupsetmembers
    ADD CONSTRAINT fk_orgunitgroupsetmembers_orgunitgroupsetid FOREIGN KEY (orgunitgroupsetid) REFERENCES orgunitgroupset(orgunitgroupsetid);


--
-- Name: fk_parentid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisationunit
    ADD CONSTRAINT fk_parentid FOREIGN KEY (parentid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_period_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY period
    ADD CONSTRAINT fk_period_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_predictor_generatorexpressionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT fk_predictor_generatorexpressionid FOREIGN KEY (generatorexpressionid) REFERENCES expression(expressionid);


--
-- Name: fk_predictor_outputcomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT fk_predictor_outputcomboid FOREIGN KEY (generatoroutputcombo) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_predictor_outputdataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT fk_predictor_outputdataelementid FOREIGN KEY (generatoroutput) REFERENCES dataelement(dataelementid);


--
-- Name: fk_predictororgunitlevels_orgunitlevelid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predictororgunitlevels
    ADD CONSTRAINT fk_predictororgunitlevels_orgunitlevelid FOREIGN KEY (orgunitlevelid) REFERENCES orgunitlevel(orgunitlevelid);


--
-- Name: fk_predictororgunitlevels_predictorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predictororgunitlevels
    ADD CONSTRAINT fk_predictororgunitlevels_predictorid FOREIGN KEY (predictorid) REFERENCES predictor(predictorid);


--
-- Name: fk_program_attributeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_attributes
    ADD CONSTRAINT fk_program_attributeid FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_program_categorycomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_categorycomboid FOREIGN KEY (categorycomboid) REFERENCES categorycombo(categorycomboid);


--
-- Name: fk_program_criteria_programid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_criteria
    ADD CONSTRAINT fk_program_criteria_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_program_criteria_validationcriteriaid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_criteria
    ADD CONSTRAINT fk_program_criteria_validationcriteriaid FOREIGN KEY (validationcriteriaid) REFERENCES validationcriteria(validationcriteriaid);


--
-- Name: fk_program_dataentryformid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_dataentryformid FOREIGN KEY (dataentryformid) REFERENCES dataentryform(dataentryformid);


--
-- Name: fk_program_expiryperiodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_expiryperiodtypeid FOREIGN KEY (expiryperiodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_program_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_organisationunits
    ADD CONSTRAINT fk_program_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_program_organisationunits_programid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_organisationunits
    ADD CONSTRAINT fk_program_organisationunits_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_program_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstagesection
    ADD CONSTRAINT fk_program_programstageid FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_program_relatedprogram; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_relatedprogram FOREIGN KEY (relatedprogramid) REFERENCES program(programid);


--
-- Name: fk_program_relationshipid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_relationshipid FOREIGN KEY (relationshiptypeid) REFERENCES relationshiptype(relationshiptypeid);


--
-- Name: fk_program_trackedentityid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_trackedentityid FOREIGN KEY (trackedentityid) REFERENCES trackedentity(trackedentityid);


--
-- Name: fk_program_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_program_userroles; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_userroles
    ADD CONSTRAINT fk_program_userroles FOREIGN KEY (userroleid) REFERENCES userrole(userroleid);


--
-- Name: fk_program_workflowid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program
    ADD CONSTRAINT fk_program_workflowid FOREIGN KEY (workflowid) REFERENCES dataapprovalworkflow(workflowid);


--
-- Name: fk_programdataelement_dataelement; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdataelement
    ADD CONSTRAINT fk_programdataelement_dataelement FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_programdataelement_program; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdataelement
    ADD CONSTRAINT fk_programdataelement_program FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_programindicator_legendset; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicator
    ADD CONSTRAINT fk_programindicator_legendset FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_programindicator_program; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicator
    ADD CONSTRAINT fk_programindicator_program FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_programindicator_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicator
    ADD CONSTRAINT fk_programindicator_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_programindicatorgroup_programindicatorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicatorgroupmembers
    ADD CONSTRAINT fk_programindicatorgroup_programindicatorid FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fk_programindicatorgroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicatorgroup
    ADD CONSTRAINT fk_programindicatorgroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_programindicatorgroupmembers_programindicatorgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicatorgroupmembers
    ADD CONSTRAINT fk_programindicatorgroupmembers_programindicatorgroupid FOREIGN KEY (programindicatorgroupid) REFERENCES programindicatorgroup(programindicatorgroupid);


--
-- Name: fk_programinstance_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programinstance
    ADD CONSTRAINT fk_programinstance_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_programinstance_programid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programinstance
    ADD CONSTRAINT fk_programinstance_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_programinstance_trackedentityinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programinstance
    ADD CONSTRAINT fk_programinstance_trackedentityinstanceid FOREIGN KEY (trackedentityinstanceid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_programinstancecomments_programinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programinstancecomments
    ADD CONSTRAINT fk_programinstancecomments_programinstanceid FOREIGN KEY (programinstanceid) REFERENCES programinstance(programinstanceid);


--
-- Name: fk_programinstancecomments_trackedentitycommentid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programinstancecomments
    ADD CONSTRAINT fk_programinstancecomments_trackedentitycommentid FOREIGN KEY (trackedentitycommentid) REFERENCES trackedentitycomment(trackedentitycommentid);


--
-- Name: fk_programmessage_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programmessage
    ADD CONSTRAINT fk_programmessage_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_programmessage_programinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programmessage
    ADD CONSTRAINT fk_programmessage_programinstanceid FOREIGN KEY (programinstanceid) REFERENCES programinstance(programinstanceid);


--
-- Name: fk_programmessage_programstageinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programmessage
    ADD CONSTRAINT fk_programmessage_programstageinstanceid FOREIGN KEY (programstageinstanceid) REFERENCES programstageinstance(programstageinstanceid);


--
-- Name: fk_programmessage_trackedentityinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programmessage
    ADD CONSTRAINT fk_programmessage_trackedentityinstanceid FOREIGN KEY (trackedentityinstanceid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_programrule_program; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrule
    ADD CONSTRAINT fk_programrule_program FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_programrule_programstage; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrule
    ADD CONSTRAINT fk_programrule_programstage FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_programruleaction_dataelement; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT fk_programruleaction_dataelement FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_programruleaction_programindicator; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT fk_programruleaction_programindicator FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fk_programruleaction_programrule; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT fk_programruleaction_programrule FOREIGN KEY (programruleid) REFERENCES programrule(programruleid);


--
-- Name: fk_programruleaction_programstage; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT fk_programruleaction_programstage FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_programruleaction_programstagesection; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT fk_programruleaction_programstagesection FOREIGN KEY (programstagesectionid) REFERENCES programstagesection(programstagesectionid);


--
-- Name: fk_programruleaction_trackedentityattribute; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programruleaction
    ADD CONSTRAINT fk_programruleaction_trackedentityattribute FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_programrulevariable_dataelement; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrulevariable
    ADD CONSTRAINT fk_programrulevariable_dataelement FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_programrulevariable_program; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrulevariable
    ADD CONSTRAINT fk_programrulevariable_program FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_programrulevariable_programstage; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrulevariable
    ADD CONSTRAINT fk_programrulevariable_programstage FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_programrulevariable_trackedentityattribute; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrulevariable
    ADD CONSTRAINT fk_programrulevariable_trackedentityattribute FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_programstage_dataentryform; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstage
    ADD CONSTRAINT fk_programstage_dataentryform FOREIGN KEY (dataentryformid) REFERENCES dataentryform(dataentryformid);


--
-- Name: fk_programstage_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstage
    ADD CONSTRAINT fk_programstage_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_programstage_program; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstage
    ADD CONSTRAINT fk_programstage_program FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_programstagedataelement_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstagedataelement
    ADD CONSTRAINT fk_programstagedataelement_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_programstagedataelement_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstagedataelement
    ADD CONSTRAINT fk_programstagedataelement_programstageid FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_programstageinstance_attributeoptioncomboid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstageinstance
    ADD CONSTRAINT fk_programstageinstance_attributeoptioncomboid FOREIGN KEY (attributeoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fk_programstageinstance_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstageinstance
    ADD CONSTRAINT fk_programstageinstance_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_programstageinstance_programinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstageinstance
    ADD CONSTRAINT fk_programstageinstance_programinstanceid FOREIGN KEY (programinstanceid) REFERENCES programinstance(programinstanceid);


--
-- Name: fk_programstageinstance_programstageid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstageinstance
    ADD CONSTRAINT fk_programstageinstance_programstageid FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_programstageinstancecomments_programstageinstanceid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstageinstancecomments
    ADD CONSTRAINT fk_programstageinstancecomments_programstageinstanceid FOREIGN KEY (programstageinstanceid) REFERENCES programstageinstance(programstageinstanceid);


--
-- Name: fk_programstageinstancecomments_trackedentitycommentid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstageinstancecomments
    ADD CONSTRAINT fk_programstageinstancecomments_trackedentitycommentid FOREIGN KEY (trackedentitycommentid) REFERENCES trackedentitycomment(trackedentitycommentid);


--
-- Name: fk_programstagenotification_usergroup; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programnotificationtemplate
    ADD CONSTRAINT fk_programstagenotification_usergroup FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_programstagesection_programindicators_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstagesection_programindicators
    ADD CONSTRAINT fk_programstagesection_programindicators_indicatorid FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fk_programstagesection_programindicators_sectionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstagesection_programindicators
    ADD CONSTRAINT fk_programstagesection_programindicators_sectionid FOREIGN KEY (programstagesectionid) REFERENCES programstagesection(programstagesectionid);


--
-- Name: fk_programtrackedentityattribute_programid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_attributes
    ADD CONSTRAINT fk_programtrackedentityattribute_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_pushanalysis_recipientusergroups; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pushanalysisrecipientusergroups
    ADD CONSTRAINT fk_pushanalysis_recipientusergroups FOREIGN KEY (elt) REFERENCES usergroup(usergroupid);


--
-- Name: fk_relationship_relationshiptypeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relationship
    ADD CONSTRAINT fk_relationship_relationshiptypeid FOREIGN KEY (relationshiptypeid) REFERENCES relationshiptype(relationshiptypeid);


--
-- Name: fk_relationship_trackedentityinstanceida; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relationship
    ADD CONSTRAINT fk_relationship_trackedentityinstanceida FOREIGN KEY (trackedentityinstanceaid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_relationship_trackedentityinstanceidb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relationship
    ADD CONSTRAINT fk_relationship_trackedentityinstanceidb FOREIGN KEY (trackedentityinstancebid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_report_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_report_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES relativeperiods(relativeperiodsid);


--
-- Name: fk_report_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_report_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_report_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_report_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_reporttable_categorydimensions_categorydimensionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_categorydimensions
    ADD CONSTRAINT fk_reporttable_categorydimensions_categorydimensionid FOREIGN KEY (categorydimensionid) REFERENCES categorydimension(categorydimensionid);


--
-- Name: fk_reporttable_categorydimensions_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_categorydimensions
    ADD CONSTRAINT fk_reporttable_categorydimensions_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_categoryoptiongroups_categoryoptiongroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_categoryoptiongroups
    ADD CONSTRAINT fk_reporttable_categoryoptiongroups_categoryoptiongroupid FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fk_reporttable_categoryoptiongroups_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_categoryoptiongroups
    ADD CONSTRAINT fk_reporttable_categoryoptiongroups_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_columns_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_columns
    ADD CONSTRAINT fk_reporttable_columns_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_datadimensionitems_datadimensionitemid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_datadimensionitems
    ADD CONSTRAINT fk_reporttable_datadimensionitems_datadimensionitemid FOREIGN KEY (datadimensionitemid) REFERENCES datadimensionitem(datadimensionitemid);


--
-- Name: fk_reporttable_datadimensionitems_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_datadimensionitems
    ADD CONSTRAINT fk_reporttable_datadimensionitems_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_dataelementgroups_dataelementgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_dataelementgroups
    ADD CONSTRAINT fk_reporttable_dataelementgroups_dataelementgroupid FOREIGN KEY (dataelementgroupid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fk_reporttable_dataelementgroups_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_dataelementgroups
    ADD CONSTRAINT fk_reporttable_dataelementgroups_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_filters_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_filters
    ADD CONSTRAINT fk_reporttable_filters_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_itemorgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_itemorgunitgroups
    ADD CONSTRAINT fk_reporttable_itemorgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_reporttable_itemorgunitunitgroups_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_itemorgunitgroups
    ADD CONSTRAINT fk_reporttable_itemorgunitunitgroups_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable
    ADD CONSTRAINT fk_reporttable_legendsetid FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_reporttable_organisationunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_organisationunits
    ADD CONSTRAINT fk_reporttable_organisationunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_reporttable_organisationunits_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_organisationunits
    ADD CONSTRAINT fk_reporttable_organisationunits_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_orgunitgroups_orgunitgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_orgunitgroups
    ADD CONSTRAINT fk_reporttable_orgunitgroups_orgunitgroupid FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fk_reporttable_orgunitlevels_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_orgunitlevels
    ADD CONSTRAINT fk_reporttable_orgunitlevels_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_orgunitunitgroups_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_orgunitgroups
    ADD CONSTRAINT fk_reporttable_orgunitunitgroups_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_periods_periodid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_periods
    ADD CONSTRAINT fk_reporttable_periods_periodid FOREIGN KEY (periodid) REFERENCES period(periodid);


--
-- Name: fk_reporttable_periods_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_periods
    ADD CONSTRAINT fk_reporttable_periods_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_relativeperiodsid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable
    ADD CONSTRAINT fk_reporttable_relativeperiodsid FOREIGN KEY (relativeperiodsid) REFERENCES relativeperiods(relativeperiodsid);


--
-- Name: fk_reporttable_rows_reporttableid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable_rows
    ADD CONSTRAINT fk_reporttable_rows_reporttableid FOREIGN KEY (reporttableid) REFERENCES reporttable(reporttableid);


--
-- Name: fk_reporttable_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttable
    ADD CONSTRAINT fk_reporttable_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_section_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectiondataelements
    ADD CONSTRAINT fk_section_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_section_dataelementoperandid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectiongreyedfields
    ADD CONSTRAINT fk_section_dataelementoperandid FOREIGN KEY (dataelementoperandid) REFERENCES dataelementoperand(dataelementoperandid);


--
-- Name: fk_section_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY section
    ADD CONSTRAINT fk_section_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_section_indicatorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectionindicators
    ADD CONSTRAINT fk_section_indicatorid FOREIGN KEY (indicatorid) REFERENCES indicator(indicatorid);


--
-- Name: fk_sectiondataelements_sectionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectiondataelements
    ADD CONSTRAINT fk_sectiondataelements_sectionid FOREIGN KEY (sectionid) REFERENCES section(sectionid);


--
-- Name: fk_sectiongreyedfields_sectionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectiongreyedfields
    ADD CONSTRAINT fk_sectiongreyedfields_sectionid FOREIGN KEY (sectionid) REFERENCES section(sectionid);


--
-- Name: fk_sectionindicators_sectionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectionindicators
    ADD CONSTRAINT fk_sectionindicators_sectionid FOREIGN KEY (sectionid) REFERENCES section(sectionid);


--
-- Name: fk_smscommand_program; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY smscommands
    ADD CONSTRAINT fk_smscommand_program FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_smscommand_programstage; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY smscommands
    ADD CONSTRAINT fk_smscommand_programstage FOREIGN KEY (programstageid) REFERENCES programstage(programstageid);


--
-- Name: fk_smscommand_usergroup; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY smscommands
    ADD CONSTRAINT fk_smscommand_usergroup FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_sqlview_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sqlview
    ADD CONSTRAINT fk_sqlview_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_teattributedimension_attributeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributedimension
    ADD CONSTRAINT fk_teattributedimension_attributeid FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_teattributedimension_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributedimension
    ADD CONSTRAINT fk_teattributedimension_legendsetid FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_tedataelementdimension_dataelementid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentitydataelementdimension
    ADD CONSTRAINT fk_tedataelementdimension_dataelementid FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fk_tedataelementdimension_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentitydataelementdimension
    ADD CONSTRAINT fk_tedataelementdimension_legendsetid FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_teprogramindicatordimension_legendsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityprogramindicatordimension
    ADD CONSTRAINT fk_teprogramindicatordimension_legendsetid FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_teprogramindicatordimension_programindicatorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityprogramindicatordimension
    ADD CONSTRAINT fk_teprogramindicatordimension_programindicatorid FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fk_trackedentityattribute_attributegroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT fk_trackedentityattribute_attributegroupid FOREIGN KEY (trackedentityattributegroupid) REFERENCES trackedentityattributegroup(trackedentityattributegroupid);


--
-- Name: fk_trackedentityattribute_legendset; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT fk_trackedentityattribute_legendset FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fk_trackedentityattribute_optionsetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT fk_trackedentityattribute_optionsetid FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fk_trackedentityattribute_trackedentityattributeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY smscodes
    ADD CONSTRAINT fk_trackedentityattribute_trackedentityattributeid FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fk_trackedentityattribute_trackedentityid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT fk_trackedentityattribute_trackedentityid FOREIGN KEY (trackedentityid) REFERENCES trackedentity(trackedentityid);


--
-- Name: fk_trackedentityattribute_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattribute
    ADD CONSTRAINT fk_trackedentityattribute_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_trackedentityinstance_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityinstance
    ADD CONSTRAINT fk_trackedentityinstance_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_trackedentityinstance_representativeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityinstance
    ADD CONSTRAINT fk_trackedentityinstance_representativeid FOREIGN KEY (representativeid) REFERENCES trackedentityinstance(trackedentityinstanceid);


--
-- Name: fk_trackedentityinstance_trackedentityid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityinstance
    ADD CONSTRAINT fk_trackedentityinstance_trackedentityid FOREIGN KEY (trackedentityid) REFERENCES trackedentity(trackedentityid);


--
-- Name: fk_user_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_user_userid FOREIGN KEY (creatoruserid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_user_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_user_userinfoid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_userapps_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userapps
    ADD CONSTRAINT fk_userapps_userinfoid FOREIGN KEY (userinfoid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_userdatavieworgunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userdatavieworgunits
    ADD CONSTRAINT fk_userdatavieworgunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_userdatavieworgunits_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userdatavieworgunits
    ADD CONSTRAINT fk_userdatavieworgunits_userinfoid FOREIGN KEY (userinfoid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_usergroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usergroup
    ADD CONSTRAINT fk_usergroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_usergroupaccess_usergroup; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usergroupaccess
    ADD CONSTRAINT fk_usergroupaccess_usergroup FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_usergroupmanaging_managedbygroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usergroupmanaged
    ADD CONSTRAINT fk_usergroupmanaging_managedbygroupid FOREIGN KEY (managedbygroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_usergroupmanaging_managedgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usergroupmanaged
    ADD CONSTRAINT fk_usergroupmanaging_managedgroupid FOREIGN KEY (managedgroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_usergroupmembers_usergroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usergroupmembers
    ADD CONSTRAINT fk_usergroupmembers_usergroupid FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_usergroupmembers_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usergroupmembers
    ADD CONSTRAINT fk_usergroupmembers_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_userinfo_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usermembership
    ADD CONSTRAINT fk_userinfo_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_userkeyjsonvalue_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userkeyjsonvalue
    ADD CONSTRAINT fk_userkeyjsonvalue_user FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_usermembership_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usermembership
    ADD CONSTRAINT fk_usermembership_userinfoid FOREIGN KEY (userinfoid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_usermessage_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usermessage
    ADD CONSTRAINT fk_usermessage_user FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_userrole_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userrole
    ADD CONSTRAINT fk_userrole_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_userroleauthorities_userroleid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userroleauthorities
    ADD CONSTRAINT fk_userroleauthorities_userroleid FOREIGN KEY (userroleid) REFERENCES userrole(userroleid);


--
-- Name: fk_userroledataset_datasetid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userroledataset
    ADD CONSTRAINT fk_userroledataset_datasetid FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fk_userroledataset_userroleid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userroledataset
    ADD CONSTRAINT fk_userroledataset_userroleid FOREIGN KEY (userroleid) REFERENCES userrole(userroleid);


--
-- Name: fk_userrolemembers_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userrolemembers
    ADD CONSTRAINT fk_userrolemembers_userid FOREIGN KEY (userid) REFERENCES users(userid);


--
-- Name: fk_userrolemembers_userroleid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userrolemembers
    ADD CONSTRAINT fk_userrolemembers_userroleid FOREIGN KEY (userroleid) REFERENCES userrole(userroleid);


--
-- Name: fk_userroleprogram_programid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_userroles
    ADD CONSTRAINT fk_userroleprogram_programid FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fk_users_catconstraints_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users_catdimensionconstraints
    ADD CONSTRAINT fk_users_catconstraints_userid FOREIGN KEY (userid) REFERENCES users(userid);


--
-- Name: fk_users_cogsconstraints_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users_cogsdimensionconstraints
    ADD CONSTRAINT fk_users_cogsconstraints_userid FOREIGN KEY (userid) REFERENCES users(userid);


--
-- Name: fk_usersetting_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usersetting
    ADD CONSTRAINT fk_usersetting_userinfoid FOREIGN KEY (userinfoid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_userteisearchorgunits_organisationunitid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userteisearchorgunits
    ADD CONSTRAINT fk_userteisearchorgunits_organisationunitid FOREIGN KEY (organisationunitid) REFERENCES organisationunit(organisationunitid);


--
-- Name: fk_userteisearchorgunits_userinfoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userteisearchorgunits
    ADD CONSTRAINT fk_userteisearchorgunits_userinfoid FOREIGN KEY (userinfoid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_validationrule_leftexpressionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationrule
    ADD CONSTRAINT fk_validationrule_leftexpressionid FOREIGN KEY (leftexpressionid) REFERENCES expression(expressionid);


--
-- Name: fk_validationrule_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT fk_validationrule_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_validationrule_periodtypeid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationrule
    ADD CONSTRAINT fk_validationrule_periodtypeid FOREIGN KEY (periodtypeid) REFERENCES periodtype(periodtypeid);


--
-- Name: fk_validationrule_rightexpressionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationrule
    ADD CONSTRAINT fk_validationrule_rightexpressionid FOREIGN KEY (rightexpressionid) REFERENCES expression(expressionid);


--
-- Name: fk_validationrule_skiptestexpressionid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predictor
    ADD CONSTRAINT fk_validationrule_skiptestexpressionid FOREIGN KEY (skiptestexpressionid) REFERENCES expression(expressionid);


--
-- Name: fk_validationrulegroup_userid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationrulegroup
    ADD CONSTRAINT fk_validationrulegroup_userid FOREIGN KEY (userid) REFERENCES userinfo(userinfoid);


--
-- Name: fk_validationrulegroup_validationruleid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationrulegroupmembers
    ADD CONSTRAINT fk_validationrulegroup_validationruleid FOREIGN KEY (validationruleid) REFERENCES validationrule(validationruleid);


--
-- Name: fk_validationrulegroupmembers_validationrulegroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationrulegroupmembers
    ADD CONSTRAINT fk_validationrulegroupmembers_validationrulegroupid FOREIGN KEY (validationgroupid) REFERENCES validationrulegroup(validationrulegroupid);


--
-- Name: fk_validationrulegroupusergroupstoalert_usergroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationrulegroupusergroupstoalert
    ADD CONSTRAINT fk_validationrulegroupusergroupstoalert_usergroupid FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fk_validationrulegroupusergroupstoalert_validationgroupid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationrulegroupusergroupstoalert
    ADD CONSTRAINT fk_validationrulegroupusergroupstoalert_validationgroupid FOREIGN KEY (validationgroupid) REFERENCES validationrulegroup(validationrulegroupid);


--
-- Name: fka4dwo79bmu0cjtqeqgclj4d42; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY constantattributevalues
    ADD CONSTRAINT fka4dwo79bmu0cjtqeqgclj4d42 FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fka5vwhm9044o3r2mlf7wmkvoka; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgroupsetusergroupaccesses
    ADD CONSTRAINT fka5vwhm9044o3r2mlf7wmkvoka FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkamp4mkfqkkmhhmgjygkmtjpip; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongroupusergroupaccesses
    ADD CONSTRAINT fkamp4mkfqkkmhhmgjygkmtjpip FOREIGN KEY (categoryoptiongroupid) REFERENCES categoryoptiongroup(categoryoptiongroupid);


--
-- Name: fkapnobox9g47rnrrf9wtjkaevy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documenttranslations
    ADD CONSTRAINT fkapnobox9g47rnrrf9wtjkaevy FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkaux0ab565allf4ria7i4yqe9o; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementcategoryusergroupaccesses
    ADD CONSTRAINT fkaux0ab565allf4ria7i4yqe9o FOREIGN KEY (categoryid) REFERENCES dataelementcategory(categoryid);


--
-- Name: fkavox4jvxrnakb535jj5vo759s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgrouptranslations
    ADD CONSTRAINT fkavox4jvxrnakb535jj5vo759s FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkb3i0kpxkt0oyh0pori98xj6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sqlviewusergroupaccesses
    ADD CONSTRAINT fkb3i0kpxkt0oyh0pori98xj6f FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkb8c0sfajb4r29mb76o4o59850; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributeattributevalues
    ADD CONSTRAINT fkb8c0sfajb4r29mb76o4o59850 FOREIGN KEY (trackedentityattributeid) REFERENCES trackedentityattribute(trackedentityattributeid);


--
-- Name: fkbcijpkvi3rcx4nupghfqtpds3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptioncombotranslations
    ADD CONSTRAINT fkbcijpkvi3rcx4nupghfqtpds3 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkbmhr9ethpu50qckrga381i6cy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementattributevalues
    ADD CONSTRAINT fkbmhr9ethpu50qckrga381i6cy FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fkbp9e1cf4kup4bfwa53kqhmhpe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttabletranslations
    ADD CONSTRAINT fkbp9e1cf4kup4bfwa53kqhmhpe FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkbqtw7paqqiuor7kenyjjjkiwv; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documentusergroupaccesses
    ADD CONSTRAINT fkbqtw7paqqiuor7kenyjjjkiwv FOREIGN KEY (documentid) REFERENCES document(documentid);


--
-- Name: fkbvcollq94hbv2kkjvbjhbklxi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementcategoryoptionusergroupaccesses
    ADD CONSTRAINT fkbvcollq94hbv2kkjvbjhbklxi FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkbve6kfglt0ik8f9a3yw45hwnj; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationrulegrouptranslations
    ADD CONSTRAINT fkbve6kfglt0ik8f9a3yw45hwnj FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkbyaw75hj8du8w14hpuhxj762w; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programmessage_emailaddresses
    ADD CONSTRAINT fkbyaw75hj8du8w14hpuhxj762w FOREIGN KEY (programmessageemailaddressid) REFERENCES programmessage(id);


--
-- Name: fkc466epp3jve9b0lpavgxocse4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboardtranslations
    ADD CONSTRAINT fkc466epp3jve9b0lpavgxocse4 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkc5hdg6ruv7glmp88j6ohkvxgu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasetusergroupaccesses
    ADD CONSTRAINT fkc5hdg6ruv7glmp88j6ohkvxgu FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkc5w6s58ykqw8gf6h8oxinq1p1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongroupsetusergroupaccesses
    ADD CONSTRAINT fkc5w6s58ykqw8gf6h8oxinq1p1 FOREIGN KEY (categoryoptiongroupsetid) REFERENCES categoryoptiongroupset(categoryoptiongroupsetid);


--
-- Name: fkc6ae9oxts83ohrx20gxjoo2o4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptioncomboattributevalues
    ADD CONSTRAINT fkc6ae9oxts83ohrx20gxjoo2o4 FOREIGN KEY (categoryoptioncomboid) REFERENCES categoryoptioncombo(categoryoptioncomboid);


--
-- Name: fkc6ibwny8jp0hq6l6w0w2untt4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY smscommandcodes
    ADD CONSTRAINT fkc6ibwny8jp0hq6l6w0w2untt4 FOREIGN KEY (id) REFERENCES smscommands(smscommandid);


--
-- Name: fkccl4gw7l7hxrfgqa2hqnvxlkq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapprovallevelusergroupaccesses
    ADD CONSTRAINT fkccl4gw7l7hxrfgqa2hqnvxlkq FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkcco3y9joqwitwh2mdrq2svakg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgroupsetusergroupaccesses
    ADD CONSTRAINT fkcco3y9joqwitwh2mdrq2svakg FOREIGN KEY (dataelementgroupsetid) REFERENCES dataelementgroupset(dataelementgroupsetid);


--
-- Name: fkcd7hsom4yeetyooplbn496t76; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationruletranslations
    ADD CONSTRAINT fkcd7hsom4yeetyooplbn496t76 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkch98ncn24f71dft102f7of537; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY smscommandspecialcharacters
    ADD CONSTRAINT fkch98ncn24f71dft102f7of537 FOREIGN KEY (smscommandid) REFERENCES smscommands(smscommandid);


--
-- Name: fkci0bfpwjo9komus48g0w5vo6r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitleveltranslations
    ADD CONSTRAINT fkci0bfpwjo9komus48g0w5vo6r FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkcmnb6cbqwkgn6yl4ojsfapy4t; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementcategorytranslations
    ADD CONSTRAINT fkcmnb6cbqwkgn6yl4ojsfapy4t FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkcoo6svgtx8pre5fabnjuyhgpf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisationunitattributevalues
    ADD CONSTRAINT fkcoo6svgtx8pre5fabnjuyhgpf FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkd2mtpc764r2ylnyork25n2ffb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstagedataelement
    ADD CONSTRAINT fkd2mtpc764r2ylnyork25n2ffb FOREIGN KEY (programstagesectionid) REFERENCES programstagesection(programstagesectionid);


--
-- Name: fkd8f9hmgonr1f04lom1pwg2td5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documentusergroupaccesses
    ADD CONSTRAINT fkd8f9hmgonr1f04lom1pwg2td5 FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkdawo044shd3vyrgeqhlbp83h; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY colortranslations
    ADD CONSTRAINT fkdawo044shd3vyrgeqhlbp83h FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkdb0p44e9kub3gakn0bn39v47e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categorycombotranslations
    ADD CONSTRAINT fkdb0p44e9kub3gakn0bn39v47e FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkdba2e0q8kva3oiigmfjujmc09; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorattributevalues
    ADD CONSTRAINT fkdba2e0q8kva3oiigmfjujmc09 FOREIGN KEY (indicatorid) REFERENCES indicator(indicatorid);


--
-- Name: fkdc4xtxb8tk28tg8gihya0f8t3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapprovalworkflowusergroupaccesses
    ADD CONSTRAINT fkdc4xtxb8tk28tg8gihya0f8t3 FOREIGN KEY (workflowid) REFERENCES dataapprovalworkflow(workflowid);


--
-- Name: fkdfoid1s8be97lj4d0dq0wn2h9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementusergroupaccesses
    ADD CONSTRAINT fkdfoid1s8be97lj4d0dq0wn2h9 FOREIGN KEY (dataelementid) REFERENCES dataelement(dataelementid);


--
-- Name: fkdmc46bnsqath7p6mrsrb89eml; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstageinstance_messageconversation
    ADD CONSTRAINT fkdmc46bnsqath7p6mrsrb89eml FOREIGN KEY (messageconversationid) REFERENCES messageconversation(messageconversationid);


--
-- Name: fkdsqsh7ab8t4k1y1taugooxcxl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributevalues
    ADD CONSTRAINT fkdsqsh7ab8t4k1y1taugooxcxl FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkdudfflo1n7r4iuyqxba1b4ovi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementcategoryoptionusergroupaccesses
    ADD CONSTRAINT fkdudfflo1n7r4iuyqxba1b4ovi FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fkdx9fhldp5xt6quko76j4d8kk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionsetusergroupaccesses
    ADD CONSTRAINT fkdx9fhldp5xt6quko76j4d8kk FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fke1eymlpayuhawlo8pfuwue654; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY smscommandcodes
    ADD CONSTRAINT fke1eymlpayuhawlo8pfuwue654 FOREIGN KEY (codeid) REFERENCES smscodes(smscodeid);


--
-- Name: fke2q9lkr609pqg1b0ydm0rowtm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicatorgroupattributevalues
    ADD CONSTRAINT fke2q9lkr609pqg1b0ydm0rowtm FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fke9a9ot5uw06v8xysffntqn163; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttableusergroupaccesses
    ADD CONSTRAINT fke9a9ot5uw06v8xysffntqn163 FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkehrkml89lh7kv1bmutotucsjm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicatorgroupusergroupaccesses
    ADD CONSTRAINT fkehrkml89lh7kv1bmutotucsjm FOREIGN KEY (programindicatorgroupid) REFERENCES programindicatorgroup(programindicatorgroupid);


--
-- Name: fker1uvlubbi174wihftcmjqwah; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicatorgrouptranslations
    ADD CONSTRAINT fker1uvlubbi174wihftcmjqwah FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkeuett3yqyqms2edpep4g1etjd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reportusergroupaccesses
    ADD CONSTRAINT fkeuett3yqyqms2edpep4g1etjd FOREIGN KEY (reportid) REFERENCES report(reportid);


--
-- Name: fkf97c7k1pwvp39tdx1ehrwywxp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY externalmaplayerusergroupaccesses
    ADD CONSTRAINT fkf97c7k1pwvp39tdx1ehrwywxp FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkfamquh0yxd74tj2thpnxll8qd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionsetusergroupaccesses
    ADD CONSTRAINT fkfamquh0yxd74tj2thpnxll8qd FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkfju7l9tdk4vuit5y3mw3pmfdp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasetusergroupaccesses
    ADD CONSTRAINT fkfju7l9tdk4vuit5y3mw3pmfdp FOREIGN KEY (datasetid) REFERENCES dataset(datasetid);


--
-- Name: fkfysoq9tcj6k0g942tni0p91sn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongroupsettranslations
    ADD CONSTRAINT fkfysoq9tcj6k0g942tni0p91sn FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkgf3l6blh1evu8cbbfdel3dap; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiontranslations
    ADD CONSTRAINT fkgf3l6blh1evu8cbbfdel3dap FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkgq38c88dd0nqfrxbdlxj95gkn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboarditemtranslations
    ADD CONSTRAINT fkgq38c88dd0nqfrxbdlxj95gkn FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkgvdx3u8ymbvq3mfr0qih7kbgl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptioncomboattributevalues
    ADD CONSTRAINT fkgvdx3u8ymbvq3mfr0qih7kbgl FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkh063grx17s8wbufgi6rmb2qj9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementattributevalues
    ADD CONSTRAINT fkh063grx17s8wbufgi6rmb2qj9 FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkh7rgh9ccjygftu2um7bt8o15w; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionsetattributevalues
    ADD CONSTRAINT fkh7rgh9ccjygftu2um7bt8o15w FOREIGN KEY (optionsetid) REFERENCES optionset(optionsetid);


--
-- Name: fkh8a8f65qyvb9ht8218fbqif3r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userroleusergroupaccesses
    ADD CONSTRAINT fkh8a8f65qyvb9ht8218fbqif3r FOREIGN KEY (userroleid) REFERENCES userrole(userroleid);


--
-- Name: fkhcb8xpki59p7up71arpcj6mgo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categorycombousergroupaccesses
    ADD CONSTRAINT fkhcb8xpki59p7up71arpcj6mgo FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkhdb5bwj85vxienykc71k0h6gb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvaluetranslations
    ADD CONSTRAINT fkhdb5bwj85vxienykc71k0h6gb FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkhlhawnoj4iw21if6whyjhyuxx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreportusergroupaccesses
    ADD CONSTRAINT fkhlhawnoj4iw21if6whyjhyuxx FOREIGN KEY (eventreportid) REFERENCES eventreport(eventreportid);


--
-- Name: fki0jsa3ibpqnmf9f6a079yvqg1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionattributevalues
    ADD CONSTRAINT fki0jsa3ibpqnmf9f6a079yvqg1 FOREIGN KEY (optionvalueid) REFERENCES optionvalue(optionvalueid);


--
-- Name: fkibpy72i2p9nfkdtqqe6my34nr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pushanalysis
    ADD CONSTRAINT fkibpy72i2p9nfkdtqqe6my34nr FOREIGN KEY (dashboard) REFERENCES dashboard(dashboardid);


--
-- Name: fkijpqu28mpafr0wbgu2p4qs2ys; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongroupattributevalues
    ADD CONSTRAINT fkijpqu28mpafr0wbgu2p4qs2ys FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkikavm35a9xngxxqnaonnmk7yw; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongroupattributevalues
    ADD CONSTRAINT fkikavm35a9xngxxqnaonnmk7yw FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkilna5etu4xlgyf93sguvt6e6s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicatorattributevalues
    ADD CONSTRAINT fkilna5etu4xlgyf93sguvt6e6s FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkisircfmtwyf4f63ci19fi4i8l; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroupsetattributevalues
    ADD CONSTRAINT fkisircfmtwyf4f63ci19fi4i8l FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkj16b2115543s4odxcl034keuj; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documentattributevalues
    ADD CONSTRAINT fkj16b2115543s4odxcl034keuj FOREIGN KEY (documentid) REFERENCES document(documentid);


--
-- Name: fkj3dr5vrqclcaodu7x4rm1qsbo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programinstance_messageconversation
    ADD CONSTRAINT fkj3dr5vrqclcaodu7x4rm1qsbo FOREIGN KEY (programinstanceid) REFERENCES programinstance(programinstanceid);


--
-- Name: fkjmtfdehdm5kixd7fxidajbqpt; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgroupsettranslations
    ADD CONSTRAINT fkjmtfdehdm5kixd7fxidajbqpt FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkjp6o40q5mb5a9fixiaqxf6dur; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementcategoryoptionattributevalues
    ADD CONSTRAINT fkjp6o40q5mb5a9fixiaqxf6dur FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkjtpyr15khpfwyeljjblln3amh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgroupattributevalues
    ADD CONSTRAINT fkjtpyr15khpfwyeljjblln3amh FOREIGN KEY (indicatorgroupid) REFERENCES indicatorgroup(indicatorgroupid);


--
-- Name: fkjuv8jwcqjrp9u60ca0b9secwe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongroupsetusergroupaccesses
    ADD CONSTRAINT fkjuv8jwcqjrp9u60ca0b9secwe FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkjy8ap861np4x3c5glxv8l8719; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programinstance_messageconversation
    ADD CONSTRAINT fkjy8ap861np4x3c5glxv8l8719 FOREIGN KEY (messageconversationid) REFERENCES messageconversation(messageconversationid);


--
-- Name: fkk53fwmr0vsgh3pbfw1u5i7kxd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorusergroupaccesses
    ADD CONSTRAINT fkk53fwmr0vsgh3pbfw1u5i7kxd FOREIGN KEY (indicatorid) REFERENCES indicator(indicatorid);


--
-- Name: fkkca6l1aa5y714267lpm03f6k1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programusergroupaccesses
    ADD CONSTRAINT fkkca6l1aa5y714267lpm03f6k1 FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkkcioj9orjwbcwmdam6pj6d9o2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicatorusergroupaccesses
    ADD CONSTRAINT fkkcioj9orjwbcwmdam6pj6d9o2 FOREIGN KEY (programindicatorid) REFERENCES programindicator(programindicatorid);


--
-- Name: fkkgab7upiou1pws7oempk5t367; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programtranslations
    ADD CONSTRAINT fkkgab7upiou1pws7oempk5t367 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkknm2jjnfl49hvsruohsfapo3r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroupsettranslations
    ADD CONSTRAINT fkknm2jjnfl49hvsruohsfapo3r FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkkrhc4bbmf9jnaxj545a004fb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionsetattributevalues
    ADD CONSTRAINT fkkrhc4bbmf9jnaxj545a004fb FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkkrroom2rcrf3a83abq969085u; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chartusergroupaccesses
    ADD CONSTRAINT fkkrroom2rcrf3a83abq969085u FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fkks9i10v8xg7d22hlhmesia51l; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstageinstance_messageconversation
    ADD CONSTRAINT fkks9i10v8xg7d22hlhmesia51l FOREIGN KEY (programstageinstanceid) REFERENCES programstageinstance(programstageinstanceid);


--
-- Name: fkktmkxjuo5b3v1q2jqk7lymh0p; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY outbound_sms_recipients
    ADD CONSTRAINT fkktmkxjuo5b3v1q2jqk7lymh0p FOREIGN KEY (outbound_sms_id) REFERENCES outbound_sms(id);


--
-- Name: fkkyhyiwi48ogtjvtvltk506eeh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reportusergroupaccesses
    ADD CONSTRAINT fkkyhyiwi48ogtjvtvltk506eeh FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkl0xk38e01qsghc0kkbykbbodo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroupsetusergroupaccesses
    ADD CONSTRAINT fkl0xk38e01qsghc0kkbykbbodo FOREIGN KEY (orgunitgroupsetid) REFERENCES orgunitgroupset(orgunitgroupsetid);


--
-- Name: fkl8cxqyb3s8c31qbaqehu71u9e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY constantusergroupaccesses
    ADD CONSTRAINT fkl8cxqyb3s8c31qbaqehu71u9e FOREIGN KEY (constantid) REFERENCES constant(constantid);


--
-- Name: fklbmw2ijdfkxonj516i8nqcoe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributevalues
    ADD CONSTRAINT fklbmw2ijdfkxonj516i8nqcoe FOREIGN KEY (trackedentityid) REFERENCES trackedentity(trackedentityid);


--
-- Name: fklcvyf20urcrk3k1grq17u5yxa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programindicatorusergroupaccesses
    ADD CONSTRAINT fklcvyf20urcrk3k1grq17u5yxa FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkleuiq3mib4iq5q840n80cv993; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY documentattributevalues
    ADD CONSTRAINT fkleuiq3mib4iq5q840n80cv993 FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkljaoalw4iomchlahjcmijy41n; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementusergroupaccesses
    ADD CONSTRAINT fkljaoalw4iomchlahjcmijy41n FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkljv6vp4ro5l6stx7dclnkenen; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programmessage_deliverychannels
    ADD CONSTRAINT fkljv6vp4ro5l6stx7dclnkenen FOREIGN KEY (programmessagedeliverychannelsid) REFERENCES programmessage(id);


--
-- Name: fklllvhilfsouycft98q82ph66q; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pushanalysisrecipientusergroups
    ADD CONSTRAINT fklllvhilfsouycft98q82ph66q FOREIGN KEY (usergroupid) REFERENCES pushanalysis(pushanalysisid);


--
-- Name: fklp3x88u96384c9cnjqic8hf4w; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdataelementtranslations
    ADD CONSTRAINT fklp3x88u96384c9cnjqic8hf4w FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fklq73q1u6q1w6uilvg8xjvqpkq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreportusergroupaccesses
    ADD CONSTRAINT fklq73q1u6q1w6uilvg8xjvqpkq FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkly81qo12mmdwo1nuxqvdvw07d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstageattributevalues
    ADD CONSTRAINT fkly81qo12mmdwo1nuxqvdvw07d FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkm5h5tkbbogqelay0io9qm74o0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventchartusergroupaccesses
    ADD CONSTRAINT fkm5h5tkbbogqelay0io9qm74o0 FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkmfeihksbnauk0swgve0o96ewr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY interpretationusergroupaccesses
    ADD CONSTRAINT fkmfeihksbnauk0swgve0o96ewr FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkmmdfsq1s9g437k0wsshbivaht; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY externalmaplayerusergroupaccesses
    ADD CONSTRAINT fkmmdfsq1s9g437k0wsshbivaht FOREIGN KEY (externalmaplayerid) REFERENCES externalmaplayer(externalmaplayerid);


--
-- Name: fkmrqgrjgwtns2j3w5wvp2cil0f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgrouptranslations
    ADD CONSTRAINT fkmrqgrjgwtns2j3w5wvp2cil0f FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkmrvj9l6sv7su7wehohc9wipdu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboardusergroupaccesses
    ADD CONSTRAINT fkmrvj9l6sv7su7wehohc9wipdu FOREIGN KEY (dashboardid) REFERENCES dashboard(dashboardid);


--
-- Name: fkmumx7i7wqjn3jh4mt4r4x1eqe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongroupsetusergroupaccesses
    ADD CONSTRAINT fkmumx7i7wqjn3jh4mt4r4x1eqe FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkmw5yn4ptnpkve2lsvxiopdp6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashboardusergroupaccesses
    ADD CONSTRAINT fkmw5yn4ptnpkve2lsvxiopdp6 FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkmwadbe8twmr8ordbjjlrloxnp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userroleusergroupaccesses
    ADD CONSTRAINT fkmwadbe8twmr8ordbjjlrloxnp FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkmxrvdw7rdmo0o50qjbk30lw8f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventreporttranslations
    ADD CONSTRAINT fkmxrvdw7rdmo0o50qjbk30lw8f FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkn2afpli3opeouwqvtguobc7td; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporttranslations
    ADD CONSTRAINT fkn2afpli3opeouwqvtguobc7td FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkn5mp5cao30al69clovpwwe6mk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroupsetusergroupaccesses
    ADD CONSTRAINT fkn5mp5cao30al69clovpwwe6mk FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkn8cff8o99v6tnpgl2fgugjwpf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usergroupusergroupaccesses
    ADD CONSTRAINT fkn8cff8o99v6tnpgl2fgugjwpf FOREIGN KEY (usergroupid) REFERENCES usergroup(usergroupid);


--
-- Name: fkndy19mcicdsxoq15p0fd7p1ew; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgroupsettranslations
    ADD CONSTRAINT fkndy19mcicdsxoq15p0fd7p1ew FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkne0hjh5lknlabbotmbpm9ynwx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongroupusergroupaccesses
    ADD CONSTRAINT fkne0hjh5lknlabbotmbpm9ynwx FOREIGN KEY (optiongroupid) REFERENCES optiongroup(optiongroupid);


--
-- Name: fknfwv4dnc90au8jvtt3ra2scbl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgroupusergroupaccesses
    ADD CONSTRAINT fknfwv4dnc90au8jvtt3ra2scbl FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fknimjjjq6ww7vcnjbxw9qo3daa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroupusergroupaccesses
    ADD CONSTRAINT fknimjjjq6ww7vcnjbxw9qo3daa FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fknqghxxgrlh1dyluj9fgh1x6pn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributeusergroupaccesses
    ADD CONSTRAINT fknqghxxgrlh1dyluj9fgh1x6pn FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fknthmdh7yci1po66i02ssldxod; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY legendsetattributevalues
    ADD CONSTRAINT fknthmdh7yci1po66i02ssldxod FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fko74ok1o1jcw9b9byfp2c995lu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributetranslations
    ADD CONSTRAINT fko74ok1o1jcw9b9byfp2c995lu FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fko975uxx8n7sspdysehujj8e7t; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapusergroupaccesses
    ADD CONSTRAINT fko975uxx8n7sspdysehujj8e7t FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkoccxpdljjjbxr1vrwfp9d25dt; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sqlviewusergroupaccesses
    ADD CONSTRAINT fkoccxpdljjjbxr1vrwfp9d25dt FOREIGN KEY (sqlviewid) REFERENCES sqlview(sqlviewid);


--
-- Name: fkokgalu75pd2e1no2x53cxe8ik; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapusergroupaccesses
    ADD CONSTRAINT fkokgalu75pd2e1no2x53cxe8ik FOREIGN KEY (mapid) REFERENCES map(mapid);


--
-- Name: fkopw1b57inx5x5sm7r22lh0qso; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programstagetranslations
    ADD CONSTRAINT fkopw1b57inx5x5sm7r22lh0qso FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkou5go53l80o7omb2dqcpp7wjh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chartusergroupaccesses
    ADD CONSTRAINT fkou5go53l80o7omb2dqcpp7wjh FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkp7of94t57djd0buqsc46xs32u; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroupattributevalues
    ADD CONSTRAINT fkp7of94t57djd0buqsc46xs32u FOREIGN KEY (orgunitgroupid) REFERENCES orgunitgroup(orgunitgroupid);


--
-- Name: fkp7u6oqpln4dt83wovshmrc1jo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programruletranslations
    ADD CONSTRAINT fkp7u6oqpln4dt83wovshmrc1jo FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkp8i8mavj9jd5q2lyqag2rhi03; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgroupattributevalues
    ADD CONSTRAINT fkp8i8mavj9jd5q2lyqag2rhi03 FOREIGN KEY (dataelementgroupid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fkprt8bw5cw4fvcnpfe9iayng1v; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY attributetranslations
    ADD CONSTRAINT fkprt8bw5cw4fvcnpfe9iayng1v FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkq6f4o8i51dngmiimuj3wctes3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userattributevalues
    ADD CONSTRAINT fkq6f4o8i51dngmiimuj3wctes3 FOREIGN KEY (userinfoid) REFERENCES userinfo(userinfoid);


--
-- Name: fkq80dj8d4slnw9lna5jrsdxxou; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgroupsetusergroupaccesses
    ADD CONSTRAINT fkq80dj8d4slnw9lna5jrsdxxou FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkqgvpllqqqfstetxiuikf4my7q; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoryoptiongrouptranslations
    ADD CONSTRAINT fkqgvpllqqqfstetxiuikf4my7q FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkqky1rnn3ulqpc6j0mpjrm7elm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usergroupusergroupaccesses
    ADD CONSTRAINT fkqky1rnn3ulqpc6j0mpjrm7elm FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkqramkdhx87vxn8oybmygjbu1a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationcriteriatranslations
    ADD CONSTRAINT fkqramkdhx87vxn8oybmygjbu1a FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkqsfp938c3hscdt0l85kakwtxr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datasetattributevalues
    ADD CONSTRAINT fkqsfp938c3hscdt0l85kakwtxr FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fkqv5w8d50v5bhcsvwahlwfslqu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY constantusergroupaccesses
    ADD CONSTRAINT fkqv5w8d50v5bhcsvwahlwfslqu FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkrbtkonmtsb3dd6fri8jh4kcgx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY colorsettranslations
    ADD CONSTRAINT fkrbtkonmtsb3dd6fri8jh4kcgx FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkrq69i1s0tkmw9u0mga5eggoyx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataapprovalleveltranslations
    ADD CONSTRAINT fkrq69i1s0tkmw9u0mga5eggoyx FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fks04qh58fxmsf5601n9cvpdtc8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_filters
    ADD CONSTRAINT fks04qh58fxmsf5601n9cvpdtc8 FOREIGN KEY (chartid) REFERENCES chart(chartid);


--
-- Name: fks1k3a2f1c1isq1ujtwwqwfonx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorusergroupaccesses
    ADD CONSTRAINT fks1k3a2f1c1isq1ujtwwqwfonx FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fks24flr8pd794omx6xusmkeboe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgroupusergroupaccesses
    ADD CONSTRAINT fks24flr8pd794omx6xusmkeboe FOREIGN KEY (dataelementgroupid) REFERENCES dataelementgroup(dataelementgroupid);


--
-- Name: fks2olf101iiehl4ekaw0ytbmpg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementgroupattributevalues
    ADD CONSTRAINT fks2olf101iiehl4ekaw0ytbmpg FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fks2timamyiijrioyi2nd5ysxjc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userattributevalues
    ADD CONSTRAINT fks2timamyiijrioyi2nd5ysxjc FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fks3en52yvnu8nfdbcbsqdealwu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectionattributevalues
    ADD CONSTRAINT fks3en52yvnu8nfdbcbsqdealwu FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fks5roynmoahk5mqu1j019ym7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectionattributevalues
    ADD CONSTRAINT fks5roynmoahk5mqu1j019ym7 FOREIGN KEY (sectionid) REFERENCES section(sectionid);


--
-- Name: fks6crbtws3n0g2os9894uyb0c4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validationrulegroupusergroupaccesses
    ADD CONSTRAINT fks6crbtws3n0g2os9894uyb0c4 FOREIGN KEY (validationrulegroupid) REFERENCES validationrulegroup(validationrulegroupid);


--
-- Name: fksfctbv0m7p1qyf32jisp4u031; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY eventcharttranslations
    ADD CONSTRAINT fksfctbv0m7p1qyf32jisp4u031 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fksii4ij2x35tx3f9u7a76k78jl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY maplegendtranslations
    ADD CONSTRAINT fksii4ij2x35tx3f9u7a76k78jl FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fksmifkdbg5bgp66c2yl203lqrn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongroupattributevalues
    ADD CONSTRAINT fksmifkdbg5bgp66c2yl203lqrn FOREIGN KEY (optiongroupid) REFERENCES optiongroup(optiongroupid);


--
-- Name: fksn12ea6xcfweyp0bob6tssdcg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgunitgroupusergroupaccesses
    ADD CONSTRAINT fksn12ea6xcfweyp0bob6tssdcg FOREIGN KEY (usergroupaccessid) REFERENCES usergroupaccess(usergroupaccessid);


--
-- Name: fkt27tftlhawo7tq1t1embuwc5e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapviewtranslations
    ADD CONSTRAINT fkt27tftlhawo7tq1t1embuwc5e FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fkt66m7wsp2phes81tx37l4sn4b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatorgroupsetusergroupaccesses
    ADD CONSTRAINT fkt66m7wsp2phes81tx37l4sn4b FOREIGN KEY (indicatorgroupsetid) REFERENCES indicatorgroupset(indicatorgroupsetid);


--
-- Name: fkt7cgg1phqdlubtcwekr6jd785; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY legendsetattributevalues
    ADD CONSTRAINT fkt7cgg1phqdlubtcwekr6jd785 FOREIGN KEY (legendsetid) REFERENCES maplegendset(maplegendsetid);


--
-- Name: fktl0s6blarqvbvjhnoa94drtb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY smscommandspecialcharacters
    ADD CONSTRAINT fktl0s6blarqvbvjhnoa94drtb2 FOREIGN KEY (specialcharacterid) REFERENCES smsspecialcharacter(specialcharacterid);


--
-- Name: fktl5384fpv5fdjv4ke8e34ul6e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optiongrouptranslations
    ADD CONSTRAINT fktl5384fpv5fdjv4ke8e34ul6e FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fktlnn6e4dj457rtlgf8gaangnq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usergroupattributevalues
    ADD CONSTRAINT fktlnn6e4dj457rtlgf8gaangnq FOREIGN KEY (attributevalueid) REFERENCES attributevalue(attributevalueid);


--
-- Name: fktokd1a55e5b1vetrjv1ka84av; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataelementcategoryoptionattributevalues
    ADD CONSTRAINT fktokd1a55e5b1vetrjv1ka84av FOREIGN KEY (categoryoptionid) REFERENCES dataelementcategoryoption(categoryoptionid);


--
-- Name: fktpgxscfqt74wu7v11cyrgxc9e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trackedentityattributegrouptranslations
    ADD CONSTRAINT fktpgxscfqt74wu7v11cyrgxc9e FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- Name: fku1h7cukhyye5ejgjbs0kaye0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programusergroupaccesses
    ADD CONSTRAINT fku1h7cukhyye5ejgjbs0kaye0 FOREIGN KEY (programid) REFERENCES program(programid);


--
-- Name: fku37f3oirygw2xn7gqgo6rnq9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY indicatortranslations
    ADD CONSTRAINT fku37f3oirygw2xn7gqgo6rnq9 FOREIGN KEY (objecttranslationid) REFERENCES objecttranslation(objecttranslationid);


--
-- PostgreSQL database dump complete
--

