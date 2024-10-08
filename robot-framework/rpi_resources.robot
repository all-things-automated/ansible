*** Settings ***
Library           OperatingSystem
Library           Collections
Library           JSONLibrary 

*** Variables ***
${THRESHOLD_CPU}       75  # 75% CPU usage threshold
${THRESHOLD_MEM}       80  # 80% Memory usage threshold
${THRESHOLD_DISK}      85  # 85% Disk usage threshold

*** Test Cases ***
Verify CPU Usage
    [Documentation]    Ensure CPU usage is below the defined threshold.
    ${metrics}=        Load JSON From File    /root/snap/semaphore/common/repositories/metrics.json
    ${cpu_usage}=      Get From Dictionary    ${metrics}    cpu_usage
    Log                CPU Usage: ${cpu_usage}%
    Should Be True     ${cpu_usage} < ${THRESHOLD_CPU}    msg=CPU usage is too high: ${cpu_usage}%

Verify Memory Usage
    [Documentation]    Ensure Memory usage is below the defined threshold.
    ${metrics}=        Load JSON From File    /root/snap/semaphore/common/repositories/metrics.json
    ${mem_usage}=      Get From Dictionary    ${metrics}    mem_usage
    Log                Memory Usage: ${mem_usage}%
    Should Be True     ${mem_usage} < ${THRESHOLD_MEM}    msg=Memory usage is too high: ${mem_usage}%

Verify Disk Usage
    [Documentation]    Ensure Disk usage is below the defined threshold.
    ${metrics}=        Load JSON From File    /root/snap/semaphore/common/repositories/metrics.json
    ${disk_usage}=     Get From Dictionary    ${metrics}    disk_usage
    Log                Disk Usage: ${disk_usage}%
    Should Be True     ${disk_usage} < ${THRESHOLD_DISK}    msg=Disk usage is too high: ${disk_usage}%

