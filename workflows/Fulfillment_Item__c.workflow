<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Fulfillment_Date_to_Today</fullName>
        <description>Set Fulfillment Date to TODAY</description>
        <field>Fulfillment_Date__c</field>
        <formula>TODAY()</formula>
        <name>Set Fulfillment Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Transaction_Date</fullName>
        <description>Set the Transaction Date to NOW</description>
        <field>Transaction_Date__c</field>
        <formula>NOW()</formula>
        <name>Set Transaction Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Transaction_Date_to_Now</fullName>
        <description>Set the Transaction Date to NOW</description>
        <field>Transaction_Date__c</field>
        <formula>NOW()</formula>
        <name>Set Transaction Date to Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Fulfillment Date when the Fulfillment Item Status is set to Complete</fullName>
        <actions>
            <name>Set_Fulfillment_Date_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Fulfillment_Item__c.Status__c</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <description>When the Fulfillment Item Status is set to &apos;Complete&apos;, then the Fulfillment Date is set to TODAY()</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Transaction Date when the Fulfillment Item Status is set to Ready</fullName>
        <actions>
            <name>Set_Transaction_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Transaction_Date_to_Now</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Fulfillment_Item__c.Status__c</field>
            <operation>equals</operation>
            <value>Ready</value>
        </criteriaItems>
        <description>When the Fulfillment Item Status is set to &apos;Ready&apos;,  then the Transaction Date is set to NOW()</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
