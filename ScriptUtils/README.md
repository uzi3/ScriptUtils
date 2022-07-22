# ScriptUtils
This Module is a collection of wrapper functions that makes your scripting experience fast and easy.
As a scripter you might have come across this situation several times when you have to perform checks before proceeding with a specific task.
These functions helps you eliminate the need to perform checks and just use a single command to get the work done. Thereby, enabling you to focus on the
main section of your script rather than spending time to write code to perform checks.

Some examples are given below. For detailed information on usage, check each command's help. 


1) Test whether file name is as per Windows naming standard.

Test-FileName "My\<> File"

False




2) Here the file name will noit just be tested but will also be rectified and returned. 

Repair-FileName -Name "My\<> File"
 
MyFile 




3) Check if the current PowerShell process is running with admin privileges

Test-IfAdmin

True




4) Test whether the IP address is valid

Test-Ipv4AddressFormat "192.168.3.3556"

False




5) Return details of PowerShell version and PowerShell environment


Get-PSInfo

PSRemotingProtocolVersion : 2.3
WSManStackVersion         : 3.0
DebuggerEnabled           : True
Platform                  : Win32NT
IsRunspacePushed          : False
PSVersion                 : 7.2.1
Name                      : ConsoleHost
OS                        : Microsoft Windows 10.0.22000
GitCommitId               : 7.2.1
CurrentCulture            : {KeyboardLayoutId, IetfLanguageTag, EnglishName, IsNeutralCulture…}
SerializationVersion      : 1.1.0.1
UI                        : {SupportsVirtualTerminal, RawUI}
Version                   : {MajorRevision, Revision, Major, Build…}
Runspace                  : {LanguageMode, RunspaceAvailability, JobManager, RunspaceStateInfo…}
PSEdition                 : Core
PSCompatibleVersions      : {1.0, 2.0, 3.0, 4.0…}
CurrentUICulture          : {KeyboardLayoutId, IetfLanguageTag, EnglishName, IsNeutralCulture…}
InstanceId                : 210c0211-9a97-4baa-8e41-a33afbeafe5d
PrivateData               : {ErrorAccentColor, VerboseBackgroundColor, WarningForegroundColor,
                            ProgressBackgroundColor…}