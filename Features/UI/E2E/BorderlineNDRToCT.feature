@UI
Feature:Borderline NDR to CT

@BorderlineNDRtoCT @E2E @P1_A @Regression @mini_Regression @HP_E2E
# Purpose - To verify that a user can raise a "Borderline NDR to CT" Request internally and progress it through to Release & Publish
#CTPRELMGMT-1553[SIT] Borderline NDR to CT can access Effective Date Change at Desktop Research	CT-Borderline
Scenario: NDRtoCT01_CTPRELMGMT-1553_CTPRELMGMT-1591_CTPRELMGMT-1580-Borderline NDR to CT Raised Internally
	Given User uses test data with ID 'NP_001' from 'Borderline NDR to CT' sheet
	Given User is logged in to Dynamics application to work for "Borderline_NDR to CT_E2E_Flow" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Requests' under 'Service' section
	# Section - Categorisation
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	# Section - Details
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Data Source Role' field value
	#Section - New Hereditament Details
	And User scroll to 'New Hereditament Details' element
	And User click on 'Find Address' button
	And user enters data in "Postcode" and selects unique address in 'scenarioContext'
	And User enter data for 'Proposed Billing Authority' field value
	# Section - Billing Authority Link
	And User scroll to 'Billing Authority Link' element
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User clicks on 'Proceed' button on 'Confirm' dialog
	And User waits till ProgressRing disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	Given User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
	And User click on "Job Id" element
	# Section - Details
	And User waits till 'Details' stage selected
	And User click on 'Set Effective Date' button from 'menubar'
	And User entered 5 days before hereditament 'Proposed Effective Date' for  from calender for 'New Proposed Effective Date' field value on 'dialog'
	And User enter 'Automation testing ' in 'New Effective Date Reason' field
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'New Proposed Effective Date' value display for 'Proposed Effective Date' from feature context
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'New Proposed Effective Date' value display for 'Proposed Effective Date' from feature context
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User clicked on 'Create' button
	And User waits till ProgressRing disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User looked for value '19 - Houses and Bungalows' in 'Group' field
	And User looked for value 'BD - Detached' in 'Type' field
	And User looked for value 'B - 1900 - 1918' in 'Age Code' field
	And User enter data for 'Area' field value
	And User enter data for 'Rooms' field value
	And User enter data for 'Bedrooms' field value
	And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value
	And User enter data for 'Level' field value
	And User looked for value 'N - No Conservatory' in 'Conservatory Type' field
	And User looked for value 'G1 - Garaging' in 'Parking' field
	#And User looked for 'Conservatory Type' field value only when data not entered
	#And User looked for 'Parking' field value by clicking on search icon
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	#And user waits till app progress indicator disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	Then User validates the Pop-ups for 'Borderline NDR to CT' on the Dekstop Reaserch stage
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' single character field value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From                      | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| New Proposed Effective Date Updated |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | New              |
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'History' button
	Then User asserts below 'History' details
		| Effective_From                      | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| New Proposed Effective Date Updated |              | Proposed Tax Band | No            | Current (live entry) | Published         | New              |
	#And User switchs to deafult frame
	And User clicked on 'Outbound Correspondence' tab under 'Job Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'Status Reason' dropdown and select 'Ready' value
	And User clicks on 'OK' button on 'Outbound Correspondence' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User 'Refresh' from 'menubar' until 'Status Reason' field set to 'Sent'
	And User selected 'Integration Messages' under 'Related' tab
	And User click on messages "Job Id" element
	And User captures 'Message' text area field in 'featureContext'
	And User closes browser


@BorderlineNDRtoCT @E2E @P1_A @Regression
Scenario: NDRtoCT02_BST_135239_CTPRELMGMT-1579 - Borderline NDR to CT Wales - System Generated Correspondence is created
	Given User uses test data with ID 'NP_002' from 'Borderline NDR to CT' sheet
	Given User is logged in to Dynamics application to work for "Borderline_NDR to CT_E2E_Flow" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Requests' under 'Service' section
	# Section - Categorisation
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	# Section - Details
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User looked for 'Submitted By' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	#Section - New Hereditament Details
	And User scroll to 'New Hereditament Details' element
	And User click on 'Find Address' button
	And user enters data in "Postcode" and selects unique address in 'scenarioContext'
	And User enter data for 'Proposed Billing Authority' field value
	# Section - Billing Authority Link
	And User scroll to 'Billing Authority Link' element
	And User enter community code number for "Proposed BA Reference Number" field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User clicks on 'Proceed' button on 'Confirm' dialog
	And User waits till ProgressRing disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	Given User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
	And User click on "Job Id" element
	# Section - Details
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User clicked on 'Create' button
	And User waits till ProgressRing disappears
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User looked for value '19 - Houses and Bungalows' in 'Group' field
	And User looked for value 'BD - Detached' in 'Type' field
	And User looked for value 'B - 1900 - 1918' in 'Age Code' field
	And User enter data for 'Area' field value
	And User enter data for 'Rooms' field value
	And User enter data for 'Bedrooms' field value
	And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value
	And User enter data for 'Level' field value
	And User looked for value 'N - No Conservatory' in 'Conservatory Type' field
	And User looked for value 'G1 - Garaging' in 'Parking' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	#And user waits till app progress indicator disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	Then User validates the Pop-ups for 'Borderline NDR to CT' on the Dekstop Reaserch stage
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' single character field value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | New              |
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'History' button
	Then User asserts below 'History' details
		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Published         | New              |
	And User switchs to deafult frame
	And User clicked on 'Outbound Correspondence' tab under 'Job Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'Status Reason' dropdown and select 'Ready' value
	And User clicks on 'OK' button on 'Outbound Correspondence' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User 'Refresh' from 'menubar' until 'Status Reason' field set to 'Sent'
	And User selected 'Integration Messages' under 'Related' tab
	And User click on messages "Job Id" element
	And User captures 'Message' text area field in 'featureContext'
	And User closes browser
	

@BorderlineNDRtoCT @E2E @P1_A @Regression @laportal
Scenario: NDRtoCT03_CTPRELMGMT-1581 - [SIT] - E2E - LA Portal - CR03 - Borderline NDR to CT
Given User uses test data with ID 'TD_012' from 'TestDataPart2' sheet
	#Given User is logged in to Dynamics application to work for "NewProp_E2E_Flow" case
	Given User is logged in to LA Portal
	When I click Single report tab
	Then I choose 'CR03' as the reason code for the submission
	And User enter details on References page for CR03
	And User selects the postcode and Address for the CR03 Portal request
	And User answers the questionnaire about Planning Portal Reference
	And User enter details on Contact Details page
	And User enter EFfective Date and Remarks on Change request details page
	Then I should be able to see "You have successfully submitted your report to the Valuation Office Agency" message on the screen
	Given User is logged in
	And User collapse if site map navigation expanded on left pane
	And User navigates to 'Submissions' under 'Service'
	And user waits till app progress indicator disappears
	And User filters the 'Channel' column with 'Integration' value
	And User clicks on the latest submission from LA Portal
	Then User validates the field values in Details section under Summary tab
	And User clicks on the Request link containing the Submission ID under Related Requests section
	And user waits till progress indicator disappears
	Then User validates the field values in Remarks section under Summary tab
	And User modified value 'Borderline NDR to CT' in 'Job Type' field
	And User scroll to 'New Hereditament Details' element
	And User click on 'Find Address' button
	And user enters data in "Postcode" and selects unique address in 'scenarioContext'
	#And User enter data for 'Proposed Billing Authority' field value
	# Section - Billing Authority Link
	And User scroll to 'Billing Authority Link' element
	And User enter random number for 'Proposed BA Reference Number' field value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User clicks on 'Proceed' button on 'Confirm' dialog
	And User waits till ProgressRing disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	Given User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears 
    And user waits till 'Saving...' 'progressbar' disappears 
	And User click on "Job Id" element
	# Section - Details
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User clicked on 'Create' button
	And User waits till ProgressRing disappears
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User looked for value '19 - Houses and Bungalows' in 'Group' field
	And User looked for value 'BD - Detached' in 'Type' field
	And User looked for value 'B - 1900 - 1918' in 'Age Code' field
	And User enter data for 'Area' field value
	And User enter data for 'Rooms' field value
	And User enter data for 'Bedrooms' field value
	And User enter data for 'Bathrooms' field value
	And User enter data for 'Floors' field value
	And User enter data for 'Level' field value
	And User looked for value 'N - No Conservatory' in 'Conservatory Type' field
	And User looked for value 'G1 - Garaging' in 'Parking' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	#And user waits till app progress indicator disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	Then User validates the Pop-ups for 'Borderline NDR to CT' on the Dekstop Reaserch stage
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' single character field value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser
