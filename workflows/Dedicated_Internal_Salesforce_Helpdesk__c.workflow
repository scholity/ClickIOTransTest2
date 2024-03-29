<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_to_approve_DISH_ticket_request_in_UAT</fullName>
        <description>Alert to approve DISH ticket request in UAT</description>
        <protected>false</protected>
        <recipients>
            <recipient>mike.smith2@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Requested_By__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/DISH_Configuration_Request</template>
    </alerts>
    <alerts>
        <fullName>DISH_Skedulo_Issue</fullName>
        <description>DISH Skedulo Issue</description>
        <protected>false</protected>
        <recipients>
            <recipient>heather.lapuma@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mike.smith2@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/DISH_Skedulo_Usage_Functionality_Issue</template>
    </alerts>
    <alerts>
        <fullName>DISH_Ticket_Created_Email</fullName>
        <description>DISH Ticket Created Email</description>
        <protected>false</protected>
        <recipients>
            <recipient>gita.borovsky@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jatinkumar.acharya@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mike.smith2@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sfdcsudhir@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/DISH_Ticket_Created</template>
    </alerts>
    <alerts>
        <fullName>DISH_Ticket_Status_marked_Requestor_Comment_Pending</fullName>
        <description>DISH Ticket Status marked Requestor Comment Pending</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>mike.smith2@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Workflow_Templates/DISH_Status_Requestor_Comment_Pending</template>
    </alerts>
    <alerts>
        <fullName>DISH_Ticket_Status_marked_awaiting_Approval_Response</fullName>
        <description>DISH Ticket Status marked awaiting Response</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>mike.smith2@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Workflow_Templates/DISH_Status_Awaiting_ApprovaL_Response</template>
    </alerts>
    <alerts>
        <fullName>DISH_Ticket_Status_marked_complete</fullName>
        <description>DISH Ticket Status marked complete</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>mike.smith2@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Workflow_Templates/DISH_Status_Complete</template>
    </alerts>
    <alerts>
        <fullName>DISH_Ticket_Status_marked_declined</fullName>
        <description>DISH Ticket Status marked declined</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>mike.smith2@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Workflow_Templates/DISH_Status_Declined</template>
    </alerts>
    <alerts>
        <fullName>DISH_User_Access_Request_Alert</fullName>
        <description>DISH User Access Request Alert for Saba LMS</description>
        <protected>false</protected>
        <recipients>
            <recipient>margot.alloway@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mike.smith2@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/DISH_User_Access_Request</template>
    </alerts>
    <alerts>
        <fullName>DISH_User_Access_Request_Alert_for_IC_and_Sharepoint</fullName>
        <description>DISH User Access Request Alert for IC and Sharepoint</description>
        <protected>false</protected>
        <recipients>
            <recipient>mike.smith2@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>shweta.kohli@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/DISH_User_Access_Request_IC_and_Sharepoint</template>
    </alerts>
    <fieldUpdates>
        <fullName>Dish_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>D_I_S_H_Tickets</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Dish Owner</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Assign to DISH queue</fullName>
        <actions>
            <name>Dish_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Dedicated_Internal_Salesforce_Helpdesk__c.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Assigns ticket to dish queue on creation</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>DISH Skedulo Issue</fullName>
        <actions>
            <name>DISH_Skedulo_Issue</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>Dedicated_Internal_Salesforce_Helpdesk__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Skedulo Issue</value>
        </criteriaItems>
        <criteriaItems>
            <field>Dedicated_Internal_Salesforce_Helpdesk__c.Usage_Functionality_Issue__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DISH Status Notification - Comment Pending</fullName>
        <actions>
            <name>DISH_Ticket_Status_marked_Requestor_Comment_Pending</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Dedicated_Internal_Salesforce_Helpdesk__c.Dish_Request_Status__c</field>
            <operation>contains</operation>
            <value>Requestor comment pending</value>
        </criteriaItems>
        <description>Notifies ticket owner that a requestor comment is pending</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>DISH Status Notification - Complete</fullName>
        <actions>
            <name>DISH_Ticket_Status_marked_complete</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Dedicated_Internal_Salesforce_Helpdesk__c.Dish_Request_Status__c</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <description>Notifies ticket requester that the status is complete</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DISH Status Notification - Declined</fullName>
        <actions>
            <name>DISH_Ticket_Status_marked_declined</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Dedicated_Internal_Salesforce_Helpdesk__c.Dish_Request_Status__c</field>
            <operation>equals</operation>
            <value>Declined</value>
        </criteriaItems>
        <description>Notifies ticket requester that the status is Declined.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DISH Status Notification - Response</fullName>
        <actions>
            <name>DISH_Ticket_Status_marked_awaiting_Approval_Response</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Dedicated_Internal_Salesforce_Helpdesk__c.Dish_Request_Status__c</field>
            <operation>contains</operation>
            <value>Awaiting Requester Response</value>
        </criteriaItems>
        <description>Notifies ticket requester that Response is needed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DISH Ticket Created</fullName>
        <actions>
            <name>DISH_Ticket_Created_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Dedicated_Internal_Salesforce_Helpdesk__c.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Send email Alert when ticket is created</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>DISH User Access IC and Sharepoint</fullName>
        <actions>
            <name>DISH_User_Access_Request_Alert_for_IC_and_Sharepoint</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>Dedicated_Internal_Salesforce_Helpdesk__c.User_Access__c</field>
            <operation>includes</operation>
            <value>Instructor&apos;s Corner,PHSS SharePoint</value>
        </criteriaItems>
        <criteriaItems>
            <field>Dedicated_Internal_Salesforce_Helpdesk__c.Dish_Request_Status__c</field>
            <operation>equals</operation>
            <value>Created</value>
        </criteriaItems>
        <description>Send email Alert when User Access is IC or Sharepoint</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DISH User Access Saba LMS</fullName>
        <actions>
            <name>DISH_User_Access_Request_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>Dedicated_Internal_Salesforce_Helpdesk__c.User_Access__c</field>
            <operation>includes</operation>
            <value>SABA LMS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Dedicated_Internal_Salesforce_Helpdesk__c.Dish_Request_Status__c</field>
            <operation>equals</operation>
            <value>Created</value>
        </criteriaItems>
        <description>Send email Alert when User Access is Saba LMS.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Sandbox Notification</fullName>
        <actions>
            <name>Alert_to_approve_DISH_ticket_request_in_UAT</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Dedicated_Internal_Salesforce_Helpdesk__c.In_UAT_Sandbox_for_Approval__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Notifies ticket requester that the configuration request is ready to be viewed in UAT</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
