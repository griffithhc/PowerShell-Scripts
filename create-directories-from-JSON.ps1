$goalsJSON = '{
  "goals": [
    {
      "id": "goal1",
      "goalname": "Performance Management & Team Development",
      "tasks": [
        {
          "id": "task1.1",
          "taskname": "Employee Goal & Objective Management"
        },
        {
          "id": "task1.2",
          "taskname": "Manage Employee Responsibilities and Duties (Supervision)"
        },
        {
          "id": "task1.3",
          "taskname": "Employee Recruiting, Training, and Development"
        }
      ]
    },
    {
      "id": "goal2",
      "goalname": "Technology Analysis and Support",
      "tasks": [
        {
          "id": "task2.1",
          "taskname": "Classroom & Lab Computer Support Management"
        },
        {
          "id": "task2.2",
          "taskname": "Student Response System Support"
        },
        {
          "id": "task2.3",
          "taskname": "Virtual Desktop Infrastructure (VDI) and Application Virtualization Discovery"
        },
        {
          "id": "task2.4",
          "taskname": "Image Development, Automation, and Delivery"
        },
        {
          "id": "task2.5",
          "taskname": "Software Packaging"
        },
        {
          "id": "task2.6",
          "taskname": "Workstation Standards"
        },
        {
          "id": "task2.7",
          "taskname": "Software Agreement Management"
        },
        {
          "id": "task2.8",
          "taskname": "Mobile Computing Program"
        }
      ]
    },
    {
      "id": "goal3",
      "goalname": "Operations Management and Strategy",
      "tasks": [
        {
          "id": "task3.1",
          "taskname": "Communications"
        },
        {
          "id": "task3.2",
          "taskname": "Processes, Procedures, and Policies"
        },
        {
          "id": "task3.3",
          "taskname": "Documentation"
        },
        {
          "id": "task3.4",
          "taskname": "Inventory Control"
        },
        {
          "id": "task3.5",
          "taskname": "Training and Professional Development"
        },
        {
          "id": "task3.6",
          "taskname": "Event Scheduling"
        },
        {
          "id": "task3.7",
          "taskname": "Change Advisory Board"
        }
      ]
    },
    {
      "id": "goal4",
      "goalname": "Service Level Management",
      "tasks": [
        {
          "id": "task4.1",
          "taskname": "Service Level Agreements (SLA)"
        },
        {
          "id": "task4.2",
          "taskname": "Operational Level Agreements (OLA)"
        }

      ]
    },
    {
      "id": "goal5",
      "goalname": "Project Management & Communication",
      "tasks": [
        {
          "id": "task5.1",
          "taskname": "Project Management"
        },
        {
          "id": "task5.2",
          "taskname": "Project Tracking and Reporting"
        },
        {
          "id": "task5.3",
          "taskname": "Project Communication"
        }
      ]
    }
  ]
}'

$goalsObject = ConvertFrom-Json -InputObject $goalsJSON
$rootPath = "G:\My Drive"
#Remove-Item -Recurse -Force $rootPath

if (!(Test-Path $rootPath)){

    New-Item -Type Directory -Path $rootPath
}

foreach ($goal in $goalsObject.goals){

    $goalIDnumber = $goal.ID.Replace("goal","")
    $goalDirName = $goalIDnumber + " - " + $goal.goalname
    $goalDirPath = Join-Path $rootPath $goalDirName
    Write-Host $goalDirPath
    New-Item -Type Directory -Path $goalDirPath -Force
    
    foreach ($task in $goal.tasks){

        $taskIDNumber = $task.ID.Replace("task","")
        $taskDirName = $taskIDnumber + " - " + $task.taskname
        $taskDirPath = Join-Path $goalDirPath $taskDirName
        Write-Host $taskDirPath
        New-Item -Type Directory -Path $taskDirPath -Force

    }
}