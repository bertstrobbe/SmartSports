using System.Windows.Forms.Application from assembly.
define variable lEmployeeForm as class be.cce.dotnet.SmartSports.Employee.EmployeeForm no-undo.
do on error  undo, leave
	on endkey undo, leave
	on stop   undo, leave
	on quit   undo, leave:
	lEmployeeForm = new be.cce.dotnet.SmartSports.Employee.EmployeeForm ( ) .

	wait-for System.Windows.Forms.Application:Run ( lEmployeeForm ).
	define variable i as integer no-undo.
	catch e1 as Progress.Lang.AppError:
	do i = 1 to e1:NumMessages:
		message e1:GetMessage(i) view-as alert-box buttons ok title "Error".
	end.
	if e1:ReturnValue > "" then
		message e1:ReturnValue view-as alert-box buttons ok title "Return Value".
	end catch.
	catch e2 as Progress.Lang.Error:
		do i = 1 to e2:NumMessages:
			message e2:GetMessage(i) view-as alert-box buttons ok title "Error".
		end.
	end catch.
end.
finally.
if valid-object(lEmployeeForm) then delete object lEmployeeForm no-error.
end finally.
