<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    

    <title>
        PowerShell Gallery
        | Get-WindowsAutopilotInfo.ps1 3.8
    </title>

    <link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
        <link title="https://www.powershellgallery.com" type="application/opensearchdescription+xml" href="/opensearch.xml" rel="search">

    <link href="/Content/gallery/css/site.min.css?v=N-FMpZ9py63ZO32Sjay59lx-8krWdY3bkLtzeZMpb8w1" rel="stylesheet"/>

    <link href="/Content/gallery/css/branding.css?v=1.2" rel="stylesheet"/>



    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    

    
    
    
                <!-- Telemetry -->
            <script type="text/javascript">
                var appInsights = window.appInsights || function (config) {
                    function s(config) {
                        t[config] = function () {
                            var i = arguments;
                            t.queue.push(function () { t[config].apply(t, i) })
                        }
                    }

                    var t = { config: config }, r = document, f = window, e = "script", o = r.createElement(e), i, u;
                    for (o.src = config.url || "//az416426.vo.msecnd.net/scripts/a/ai.0.js", r.getElementsByTagName(e)[0].parentNode.appendChild(o), t.cookie = r.cookie, t.queue = [], i = ["Event", "Exception", "Metric", "PageView", "Trace"]; i.length;) s("track" + i.pop());
                    return config.disableExceptionTracking || (i = "onerror", s("_" + i), u = f[i], f[i] = function (config, r, f, e, o) {
                        var s = u && u(config, r, f, e, o);
                        return s !== !0 && t["_" + i](config, r, f, e, o), s
                    }), t
                }({
                    instrumentationKey: '50d4abc3-17d3-4a1b-8361-2d1e9ca8f6d5',
                    samplingPercentage: 100
                });

                window.appInsights = appInsights;
                appInsights.trackPageView();
            </script>

        <script type="text/javascript">

        window.addEventListener('DOMContentLoaded', () => {
            const tabs = document.querySelectorAll('[role="tab"]');
            const tabList = document.querySelector('[role="tablist"]');

            // Add a click event handler to each tab
            tabs.forEach((tab) => {
                tab.addEventListener('click', changeTabs);
            });

            // Enable arrow navigation between tabs in the tab list
            let tabFocus = 0;

            tabList.addEventListener('keydown', (e) => {
                // Move right
                if (e.keyCode === 39 || e.keyCode === 37) {
                    tabs[tabFocus].setAttribute('tabindex', -1);
                    if (e.keyCode === 39) {
                        tabFocus++;
                        // If we're at the end, go to the start
                        if (tabFocus >= tabs.length) {
                            tabFocus = 0;
                        }
                        // Move left
                    } else if (e.keyCode === 37) {
                        tabFocus--;
                        // If we're at the start, move to the end
                        if (tabFocus < 0) {
                            tabFocus = tabs.length - 1;
                        }
                    }

                    tabs[tabFocus].setAttribute('tabindex', 0);
                    tabs[tabFocus].focus();
                }
            });
        });

        function changeTabs(e) {
            const target = e.target;
            const parent = target.parentNode;
            const grandparent = parent.parentNode;

            // Remove all current selected tabs
            parent
                .querySelectorAll('[aria-selected="true"]')
                .forEach((t) => t.setAttribute('aria-selected', false));

            // Set this tab as selected
            target.setAttribute('aria-selected', true);

            // Hide all tab panels
            grandparent
                .querySelectorAll('[role="tabpanel"]')
                .forEach((p) => p.setAttribute('hidden', true));

            // Show the selected panel
            grandparent.parentNode
                .querySelector(`#${target.getAttribute('aria-controls')}`)
                .removeAttribute('hidden');
        }
    </script>

</head>
<body>
    





<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-center">
                <a href="#" id="skipToContent" class="showOnFocus" title="Skip To Content">Skip To Content</a>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-offset-1 col-sm-2">
                <div class="navbar-header">
                    <a href="/" class="nvabar-header-aLink">
                        <div class="navbar-logo-container">
                            <img class="navbar-logo img-responsive" alt="PowerShell Gallery Home"
                             src="/Content/Images/Branding/psgallerylogo.svg"
                                 onerror="this.src='https://powershellgallery.com/Content/Images/Branding/psgallerylogo-whiteinlay.png'; this.onerror = null;"
 />
                            <p class="navbar-logo-text">PowerShell Gallery</p>
                        </div>
                    </a>
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" title="Open Main Menu and profile dropdown">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
            </div>
            <div class="col-sm-12 col-md-8 special-margin-left">
                <div id="navbar" class="navbar-collapse collapse" aria-label="Navigation Bar">
                    <table>
                        <tr>
                            <td colspan="3">
                                <ul class="nav navbar-nav" role="list">
                                        <li class="">
        <a role="link" href="/packages" target="" aria-label="Packages">
            <span aria-hidden="true">Packages</span>
        </a>
    </li>

                                        <li class="">
        <a role="link" href="/packages/manage/upload" target="" aria-label="Publish">
            <span aria-hidden="true">Publish</span>
        </a>
    </li>

                                                                            <li class="">
        <a role="link" href="https://go.microsoft.com/fwlink/?LinkID=825202&amp;clcid=0x409" target="_blank" aria-label="Documentation">
            <span aria-hidden="true">Documentation</span>
        </a>
    </li>

                                </ul>
                            </td>
                            <td colspan="1" class="td-align-topright">
                                    <div class="nav navbar-nav navbar-right">
    <li class="">
        <a role="link" href="/users/account/LogOn?returnUrl=%2Fpackages%2FGet-WindowsAutoPilotInfo%2F3.8%2FContent%2FGet-WindowsAutopilotInfo.ps1" target="" aria-label="Sign in">
            <span aria-hidden="true">Sign in</span>
        </a>
    </li>
                                    </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

        <div class="container-fluid search-container">
            <div class="row" id="search-row">
                <form aria-label="Package search bar" action="/packages" method="get">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-offset-1 col-sm-2"></div>
                            <div class="col-sm-12 col-md-8">
                                <div class="form-group special-margin-left">
                                    <label for="search">Search PowerShell packages:</label>
<div class="input-group"  role="presentation">
    <input name="q" type="text" class="form-control ms-borderColor-blue search-box" id="search" aria-label="Enter packages to search, use the arrow keys to autofill."
           placeholder="Az, etc..." autocomplete="on"
           value=""
           />
    <span class="input-group-btn">
        <button class="btn btn-default btn-search ms-borderColor-blue ms-borderColor-blue--hover" type="submit"
                title="Search PowerShell packages" aria-label="Search PowerShell packages">
            <span class="ms-Icon ms-Icon--Search" aria-hidden="true"></span>
        </button>
    </span>
</div>

                                    <div id="autocomplete-results-container" class="text-left" tabindex="0"></div>

<script type="text/html" id="autocomplete-results-row">
    <!-- ko if: $data -->
    <!-- ko if: $data.PackageRegistration -->
    <div class="col-sm-4 autocomplete-row-id autocomplete-row-data">
        <span data-bind="attr: { id: 'autocomplete-result-id-' + $data.PackageRegistration.Id, title: $data.PackageRegistration.Id }, text: $data.PackageRegistration.Id"></span>
    </div>
    <div class="col-sm-4 autocomplete-row-downloadcount text-right autocomplete-row-data">
        <span data-bind="text: $data.DownloadCount + ' downloads'"></span>
    </div>
    <div class="col-sm-4 autocomplete-row-owners text-left autocomplete-row-data">
        <span data-bind="text: $data.OwnersString + ' '"></span>
    </div>
    <!-- /ko -->
    <!-- ko ifnot: $data.PackageRegistration -->
    <div class="col-sm-12 autocomplete-row-id autocomplete-row-data">
        <span data-bind="attr: { id: 'autocomplete-result-id-' + $data, title: $data  }, text: $data"></span>
    </div>
    <!-- /ko -->
    <!-- /ko -->
</script>

<script type="text/html" id="autocomplete-results-template">
    <!-- ko if: $data.data.length > 0 -->
    <div data-bind="foreach: $data.data" id="autocomplete-results-list">
        <a data-bind="attr: { id: 'autocomplete-result-row-' + $data, href: '/packages/' + $data, title: $data }" tabindex="-1">
            <div data-bind="attr:{ id: 'autocomplete-container-' + $data }" class="autocomplete-results-row">
            </div>
        </a>
    </div>
    <!-- /ko -->
</script>

                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
</nav>





    <div id="skippedToContent">
        

<div role="main" class="container page-display-filecontent">
    <div class="row package-page-heading">
        <div class="col-xs-12 col-sm-offset-1 col-sm-10">
            <h1><a href="/packages/Get-WindowsAutoPilotInfo/">Get-WindowsAutoPilotInfo</a></h1>
            <h4><a href="/packages/Get-WindowsAutoPilotInfo/3.8"> 3.8</a></h4>
        </div>
    </div>
    <div class="row package-page-MoreInfo">
        <div class="col-xs-12 col-sm-offset-1 col-sm-10">
            <h3>Get-WindowsAutopilotInfo.ps1</h3>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12 col-sm-offset-1 col-sm-10 div-fileContentDisplay">          
            <div class="row fileContentDisplay">
                <table class="fileContentDisplay-table">
                    <tbody>
                        <tr>
                            <td class="fileContent col-sm-10">
                                <span style='color:#006400'>&lt;#PSScriptInfo<BR />
&nbsp;<BR />
.VERSION 3.5<BR />
&nbsp;<BR />
.GUID ebf446a3-3362-4774-83c0-b7299410b63f<BR />
&nbsp;<BR />
.AUTHOR Michael Niehaus<BR />
&nbsp;<BR />
.COMPANYNAME Microsoft<BR />
&nbsp;<BR />
.COPYRIGHT <BR />
&nbsp;<BR />
.TAGS Windows AutoPilot<BR />
&nbsp;<BR />
.LICENSEURI <BR />
&nbsp;<BR />
.PROJECTURI <BR />
&nbsp;<BR />
.ICONURI <BR />
&nbsp;<BR />
.EXTERNALMODULEDEPENDENCIES <BR />
&nbsp;<BR />
.REQUIREDSCRIPTS <BR />
&nbsp;<BR />
.EXTERNALSCRIPTDEPENDENCIES <BR />
&nbsp;<BR />
.RELEASENOTES<BR />
Version 1.0:  Original published version.<BR />
Version 1.1:  Added -Append switch.<BR />
Version 1.2:  Added -Credential switch.<BR />
Version 1.3:  Added -Partner switch.<BR />
Version 1.4:  Switched from Get-WMIObject to Get-CimInstance.<BR />
Version 1.5:  Added -GroupTag parameter.<BR />
Version 1.6:  Bumped version number (no other change).<BR />
Version 2.0:  Added -Online parameter.<BR />
Version 2.1:  Bug fix.<BR />
Version 2.3:  Updated comments.<BR />
Version 2.4:  Updated &quot;online&quot; import logic to wait for the device to sync, added new parameter.<BR />
Version 2.5:  Added AssignedUser for Intune importing, and AssignedComputerName for online Intune importing.<BR />
Version 2.6:  Added support for app-based authentication via Connect-MSGraphApp.<BR />
Version 2.7:  Added new Reboot option for use with -Online -Assign.<BR />
Version 2.8:  Fixed up parameter sets.<BR />
Version 2.9:  Fixed typo installing AzureAD module.<BR />
Version 3.0:  Fixed typo for app-based auth, added logic to explicitly install NuGet (silently).<BR />
Version 3.2:  Fixed logic to explicitly install NuGet (silently).<BR />
Version 3.3:  Added more logging and error handling for group membership.<BR />
Version 3.4:  Added logic to verify that devices were added successfully.  Fixed a bug that could cause all Autopilot devices to be added to the specified AAD group.<BR />
Version 3.5:  Added logic to display the serial number of the gathered device.<BR />
#&gt;</span><br />
<br />
<span style='color:#006400'>&lt;#<BR />
.SYNOPSIS<BR />
Retrieves the Windows AutoPilot deployment details from one or more computers<BR />
&nbsp;<BR />
MIT LICENSE<BR />
&nbsp;<BR />
Copyright (c) 2020 Microsoft<BR />
&nbsp;<BR />
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the &quot;Software&quot;), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:<BR />
&nbsp;<BR />
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.<BR />
&nbsp;<BR />
THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.<BR />
&nbsp;<BR />
.DESCRIPTION<BR />
This script uses WMI to retrieve properties needed for a customer to register a device with Windows Autopilot.  Note that it is normal for the resulting CSV file to not collect a Windows Product ID (PKID) value since this is not required to register a device.  Only the serial number and hardware hash will be populated.<BR />
.PARAMETER Name<BR />
The names of the computers.  These can be provided via the pipeline (property name Name or one of the available aliases, DNSHostName, ComputerName, and Computer).<BR />
.PARAMETER OutputFile<BR />
The name of the CSV file to be created with the details for the computers.  If not specified, the details will be returned to the PowerShell<BR />
pipeline.<BR />
.PARAMETER Append<BR />
Switch to specify that new computer details should be appended to the specified output file, instead of overwriting the existing file.<BR />
.PARAMETER Credential<BR />
Credentials that should be used when connecting to a remote computer (not supported when gathering details from the local computer).<BR />
.PARAMETER Partner<BR />
Switch to specify that the created CSV file should use the schema for Partner Center (using serial number, make, and model).<BR />
.PARAMETER GroupTag<BR />
An optional tag value that should be included in a CSV file that is intended to be uploaded via Intune (not supported by Partner Center or Microsoft Store for Business).<BR />
.PARAMETER AssignedUser<BR />
An optional value specifying the UPN of the user to be assigned to the device.  This can only be specified for Intune (not supported by Partner Center or Microsoft Store for Business).<BR />
.PARAMETER Online<BR />
Add computers to Windows Autopilot via the Intune Graph API<BR />
.PARAMETER AssignedComputerName<BR />
An optional value specifying the computer name to be assigned to the device.  This can only be specified with the -Online switch and only works with AAD join scenarios.<BR />
.PARAMETER AddToGroup<BR />
Specifies the name of the Azure AD group that the new device should be added to.<BR />
.PARAMETER Assign<BR />
Wait for the Autopilot profile assignment.  (This can take a while for dynamic groups.)<BR />
.PARAMETER Reboot<BR />
Reboot the device after the Autopilot profile has been assigned (necessary to download the profile and apply the computer name, if specified).<BR />
.EXAMPLE<BR />
.\Get-WindowsAutoPilotInfo.ps1 -ComputerName MYCOMPUTER -OutputFile .\MyComputer.csv<BR />
.EXAMPLE<BR />
.\Get-WindowsAutoPilotInfo.ps1 -ComputerName MYCOMPUTER -OutputFile .\MyComputer.csv -GroupTag Kiosk<BR />
.EXAMPLE<BR />
.\Get-WindowsAutoPilotInfo.ps1 -ComputerName MYCOMPUTER -OutputFile .\MyComputer.csv -GroupTag Kiosk -AssignedUser JohnDoe@contoso.com<BR />
.EXAMPLE<BR />
.\Get-WindowsAutoPilotInfo.ps1 -ComputerName MYCOMPUTER -OutputFile .\MyComputer.csv -Append<BR />
.EXAMPLE<BR />
.\Get-WindowsAutoPilotInfo.ps1 -ComputerName MYCOMPUTER1,MYCOMPUTER2 -OutputFile .\MyComputers.csv<BR />
.EXAMPLE<BR />
Get-ADComputer -Filter * | .\GetWindowsAutoPilotInfo.ps1 -OutputFile .\MyComputers.csv<BR />
.EXAMPLE<BR />
Get-CMCollectionMember -CollectionName &quot;All Systems&quot; | .\GetWindowsAutoPilotInfo.ps1 -OutputFile .\MyComputers.csv<BR />
.EXAMPLE<BR />
.\Get-WindowsAutoPilotInfo.ps1 -ComputerName MYCOMPUTER1,MYCOMPUTER2 -OutputFile .\MyComputers.csv -Partner<BR />
.EXAMPLE<BR />
.\GetWindowsAutoPilotInfo.ps1 -Online<BR />
&nbsp;<BR />
#&gt;</span><br />
<br />
<span style='color:#737373'>[</span><span style='color:#007BA6'>CmdletBinding</span><span style='color:#000000'>(</span><span style='color:#000000'>DefaultParameterSetName</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&#39;Default&#39;</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><br />
<span style='color:#00008B'>param</span><span style='color:#000000'>(</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$False</span><span style='color:#737373'>,</span><span style='color:#000000'>ValueFromPipeline</span><span style='color:#737373'>=</span><span style='color:#D93900'>$True</span><span style='color:#737373'>,</span><span style='color:#000000'>ValueFromPipelineByPropertyName</span><span style='color:#737373'>=</span><span style='color:#D93900'>$True</span><span style='color:#737373'>,</span><span style='color:#000000'>Position</span><span style='color:#737373'>=</span><span style='color:#800080'>0</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#737373'>[</span><span style='color:#007BA6'>alias</span><span style='color:#000000'>(</span><span style='color:#8B0000'>&quot;DNSHostName&quot;</span><span style='color:#737373'>,</span><span style='color:#8B0000'>&quot;ComputerName&quot;</span><span style='color:#737373'>,</span><span style='color:#8B0000'>&quot;Computer&quot;</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[String[]]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$Name</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>@(</span><span style='color:#8B0000'>&quot;localhost&quot;</span><span style='color:#000000'>)</span><span style='color:#737373'>,</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$False</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[String]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$OutputFile</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#737373'>,</span><span style='color:#000000'>&nbsp;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$False</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[String]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$GroupTag</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#737373'>,</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$False</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[String]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$AssignedUser</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#737373'>,</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$False</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[Switch]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$Append</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$false</span><span style='color:#737373'>,</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$False</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[System.Management.Automation.PSCredential]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$Credential</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$null</span><span style='color:#737373'>,</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$False</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[Switch]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$Partner</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$false</span><span style='color:#737373'>,</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$False</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[Switch]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$Force</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$false</span><span style='color:#737373'>,</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$True</span><span style='color:#737373'>,</span><span style='color:#000000'>ParameterSetName</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&#39;Online&#39;</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[Switch]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$Online</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$false</span><span style='color:#737373'>,</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$False</span><span style='color:#737373'>,</span><span style='color:#000000'>ParameterSetName</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&#39;Online&#39;</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[String]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$TenantId</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#737373'>,</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$False</span><span style='color:#737373'>,</span><span style='color:#000000'>ParameterSetName</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&#39;Online&#39;</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[String]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$AppId</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#737373'>,</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$False</span><span style='color:#737373'>,</span><span style='color:#000000'>ParameterSetName</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&#39;Online&#39;</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[String]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$AppSecret</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#737373'>,</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$False</span><span style='color:#737373'>,</span><span style='color:#000000'>ParameterSetName</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&#39;Online&#39;</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[String]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$AddToGroup</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#737373'>,</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$False</span><span style='color:#737373'>,</span><span style='color:#000000'>ParameterSetName</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&#39;Online&#39;</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[String]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$AssignedComputerName</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#737373'>,</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$False</span><span style='color:#737373'>,</span><span style='color:#000000'>ParameterSetName</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&#39;Online&#39;</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[Switch]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$Assign</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$false</span><span style='color:#737373'>,</span><span style='color:#000000'>&nbsp;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#737373'>[</span><span style='color:#007BA6'>Parameter</span><span style='color:#000000'>(</span><span style='color:#000000'>Mandatory</span><span style='color:#737373'>=</span><span style='color:#D93900'>$False</span><span style='color:#737373'>,</span><span style='color:#000000'>ParameterSetName</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&#39;Online&#39;</span><span style='color:#000000'>)</span><span style='color:#737373'>]</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[Switch]</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$Reboot</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$false</span><br />
<span style='color:#000000'>)</span><br />
<br />
<span style='color:#00008B'>Begin</span><br />
<span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Initialize empty list</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$computers</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>@(</span><span style='color:#000000'>)</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># If online, make sure we are able to authenticate</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$Online</span><span style='color:#000000'>)</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Get NuGet</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$provider</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Get-PackageProvider</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>NuGet</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-ErrorAction</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>Ignore</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#737373'>-not</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$provider</span><span style='color:#000000'>)</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Installing provider NuGet&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Find-PackageProvider</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Name</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>NuGet</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-ForceBootstrap</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-IncludeDependencies</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Get WindowsAutopilotIntune module (and dependencies)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$module</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Import-Module</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>WindowsAutopilotIntune</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-PassThru</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-ErrorAction</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>Ignore</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#737373'>-not</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$module</span><span style='color:#000000'>)</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Installing module WindowsAutopilotIntune&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Install-Module</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>WindowsAutopilotIntune</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Force</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Import-Module</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>WindowsAutopilotIntune</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Scope</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>Global</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Get Azure AD if needed</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$AddToGroup</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$module</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Import-Module</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>AzureAD</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-PassThru</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-ErrorAction</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>Ignore</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#737373'>-not</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$module</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Installing module AzureAD&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Install-Module</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>AzureAD</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Force</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Connect</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$AppId</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-ne</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$graph</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Connect-MSGraphApp</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Tenant</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$TenantId</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-AppId</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$AppId</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-AppSecret</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$AppSecret</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Connected to Intune tenant $TenantId using app-based authentication (Azure AD authentication not supported)&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>else</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$graph</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Connect-MSGraph</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Connected to Intune tenant $($graph.TenantId)&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$AddToGroup</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$aadId</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Connect-AzureAD</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-AccountId</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$graph</span><span style='color:#737373'>.</span><span style='color:#000000'>UPN</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Connected to Azure AD tenant $($aadId.TenantId)&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Force the output to a file</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$OutputFile</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-eq</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$OutputFile</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;$($env:TEMP)\autopilot.csv&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><span style='color:#000000'>&nbsp;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>}</span><br />
<br />
<span style='color:#00008B'>Process</span><br />
<span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>foreach</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$comp</span><span style='color:#000000'>&nbsp;</span><span style='color:#00008B'>in</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$Name</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$bad</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$false</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Get a CIM session</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$comp</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-eq</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;localhost&quot;</span><span style='color:#000000'>)</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$session</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>New-CimSession</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>else</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$session</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>New-CimSession</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-ComputerName</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$comp</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Credential</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$Credential</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Get the common properties.</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Verbose</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Checking $comp&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$serial</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#0000FF'>Get-CimInstance</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-CimSession</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$session</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Class</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>Win32_BIOS</span><span style='color:#000000'>)</span><span style='color:#737373'>.</span><span style='color:#000000'>SerialNumber</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Get the hash (if available)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$devDetail</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#0000FF'>Get-CimInstance</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-CimSession</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$session</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Namespace</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>root/cimv2/mdm/dmmap</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Class</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>MDM_DevDetail_Ext01</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Filter</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;InstanceID=&#39;Ext&#39; AND ParentID=&#39;./DevDetail&#39;&quot;</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$devDetail</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-and</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#737373'>-not</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$Force</span><span style='color:#000000'>)</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$hash</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$devDetail</span><span style='color:#737373'>.</span><span style='color:#000000'>DeviceHardwareData</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>else</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$bad</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$true</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$hash</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># If the hash isn&#39;t available, get the make and model</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$bad</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-or</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$Force</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$cs</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Get-CimInstance</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-CimSession</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$session</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Class</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>Win32_ComputerSystem</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$make</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$cs</span><span style='color:#737373'>.</span><span style='color:#000000'>Manufacturer</span><span style='color:#737373'>.</span><span style='color:#000000'>Trim</span><span style='color:#000000'>(</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$model</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$cs</span><span style='color:#737373'>.</span><span style='color:#000000'>Model</span><span style='color:#737373'>.</span><span style='color:#000000'>Trim</span><span style='color:#000000'>(</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$Partner</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$bad</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$false</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>else</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$make</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$model</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Getting the PKID is generally problematic for anyone other than OEMs, so let&#39;s skip it here</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$product</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Depending on the format requested, create the necessary object</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$Partner</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Create a pipeline object</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$c</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>New-Object</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>psobject</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Property</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>@{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#8B0000'>&quot;Device Serial Number&quot;</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$serial</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#8B0000'>&quot;Windows Product ID&quot;</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$product</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#8B0000'>&quot;Hardware Hash&quot;</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$hash</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#8B0000'>&quot;Manufacturer name&quot;</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$make</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#8B0000'>&quot;Device model&quot;</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$model</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># From spec:</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'>#    &quot;Manufacturer Name&quot; = $make</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'>#    &quot;Device Name&quot; = $model</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>else</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Create a pipeline object</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$c</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>New-Object</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>psobject</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Property</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>@{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#8B0000'>&quot;Device Serial Number&quot;</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$serial</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#8B0000'>&quot;Windows Product ID&quot;</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$product</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#8B0000'>&quot;Hardware Hash&quot;</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$hash</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$GroupTag</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-ne</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Add-Member</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-InputObject</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$c</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-NotePropertyName</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Group Tag&quot;</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-NotePropertyValue</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$GroupTag</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$AssignedUser</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-ne</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Add-Member</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-InputObject</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$c</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-NotePropertyName</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Assigned User&quot;</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-NotePropertyValue</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$AssignedUser</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Write the object to the pipeline or array</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$bad</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Report an error when the hash isn&#39;t available</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Error</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Message</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Unable to retrieve device hardware data (hash) from computer $comp&quot;</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Category</span><span style='color:#000000'>&nbsp;</span><span style='color:#8A2BE2'>DeviceError</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>elseif</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$OutputFile</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-eq</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$c</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>else</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$computers</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>+=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$c</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Gathered details for device with serial number: $serial&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Remove-CimSession</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$session</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>}</span><br />
<br />
<span style='color:#00008B'>End</span><br />
<span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$OutputFile</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-ne</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$Append</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#0000FF'>Test-Path</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$OutputFile</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$computers</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>+=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Import-CSV</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Path</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$OutputFile</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$Partner</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$computers</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Select</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Device Serial Number&quot;</span><span style='color:#737373'>,</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Windows Product ID&quot;</span><span style='color:#737373'>,</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Hardware Hash&quot;</span><span style='color:#737373'>,</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Manufacturer name&quot;</span><span style='color:#737373'>,</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Device model&quot;</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>ConvertTo-CSV</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-NoTypeInformation</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>%</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><span style='color:#D93900'>$_</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-replace</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&#39;&quot;&#39;</span><span style='color:#737373'>,</span><span style='color:#8B0000'>&#39;&#39;</span><span style='color:#000000'>}</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Out-File</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$OutputFile</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>elseif</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$AssignedUser</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-ne</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$computers</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Select</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Device Serial Number&quot;</span><span style='color:#737373'>,</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Windows Product ID&quot;</span><span style='color:#737373'>,</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Hardware Hash&quot;</span><span style='color:#737373'>,</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Group Tag&quot;</span><span style='color:#737373'>,</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Assigned User&quot;</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>ConvertTo-CSV</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-NoTypeInformation</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>%</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><span style='color:#D93900'>$_</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-replace</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&#39;&quot;&#39;</span><span style='color:#737373'>,</span><span style='color:#8B0000'>&#39;&#39;</span><span style='color:#000000'>}</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Out-File</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$OutputFile</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>elseif</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$GroupTag</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-ne</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$computers</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Select</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Device Serial Number&quot;</span><span style='color:#737373'>,</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Windows Product ID&quot;</span><span style='color:#737373'>,</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Hardware Hash&quot;</span><span style='color:#737373'>,</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Group Tag&quot;</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>ConvertTo-CSV</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-NoTypeInformation</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>%</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><span style='color:#D93900'>$_</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-replace</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&#39;&quot;&#39;</span><span style='color:#737373'>,</span><span style='color:#8B0000'>&#39;&#39;</span><span style='color:#000000'>}</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Out-File</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$OutputFile</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>else</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$computers</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Select</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Device Serial Number&quot;</span><span style='color:#737373'>,</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Windows Product ID&quot;</span><span style='color:#737373'>,</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Hardware Hash&quot;</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>ConvertTo-CSV</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-NoTypeInformation</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>%</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><span style='color:#D93900'>$_</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-replace</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&#39;&quot;&#39;</span><span style='color:#737373'>,</span><span style='color:#8B0000'>&#39;&#39;</span><span style='color:#000000'>}</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Out-File</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$OutputFile</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$Online</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Add the devices</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$importStart</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Get-Date</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$imported</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>@(</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$computers</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>%</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$imported</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>+=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Add-AutopilotImportedDevice</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-serialNumber</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$_</span><span style='color:#737373'>.</span><span style='color:#8B0000'>&#39;Device Serial Number&#39;</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-hardwareIdentifier</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$_</span><span style='color:#737373'>.</span><span style='color:#8B0000'>&#39;Hardware Hash&#39;</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-groupTag</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$_</span><span style='color:#737373'>.</span><span style='color:#8B0000'>&#39;Group Tag&#39;</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-assignedUser</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$_</span><span style='color:#737373'>.</span><span style='color:#8B0000'>&#39;Assigned User&#39;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Wait until the devices have been imported</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>1</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>while</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-gt</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>0</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$current</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>@(</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>0</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$imported</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>%</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$device</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Get-AutopilotImportedDevice</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-id</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$_</span><span style='color:#737373'>.</span><span style='color:#000000'>id</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$device</span><span style='color:#737373'>.</span><span style='color:#000000'>state</span><span style='color:#737373'>.</span><span style='color:#000000'>deviceImportStatus</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-eq</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;unknown&quot;</span><span style='color:#000000'>)</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>+</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>1</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$current</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>+=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$device</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$deviceCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$imported</span><span style='color:#737373'>.</span><span style='color:#000000'>Length</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Waiting for $processingCount of $deviceCount to be imported&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-gt</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>0</span><span style='color:#000000'>)</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Start-Sleep</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>30</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$importDuration</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#0000FF'>Get-Date</span><span style='color:#000000'>)</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$importStart</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$importSeconds</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[Math]</span><span style='color:#737373'>::</span><span style='color:#000000'>Ceiling</span><span style='color:#000000'>(</span><span style='color:#D93900'>$importDuration</span><span style='color:#737373'>.</span><span style='color:#000000'>TotalSeconds</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$successCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>0</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$current</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>%</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;$($device.serialNumber): $($device.state.deviceImportStatus) $($device.state.deviceErrorCode) $($device.state.deviceErrorName)&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$device</span><span style='color:#737373'>.</span><span style='color:#000000'>state</span><span style='color:#737373'>.</span><span style='color:#000000'>deviceImportStatus</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-eq</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;complete&quot;</span><span style='color:#000000'>)</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$successCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$successCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>+</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>1</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;$successCount devices imported successfully.  Elapsed time to complete import: $importSeconds seconds&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Wait until the devices can be found in Intune (should sync automatically)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$syncStart</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Get-Date</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>1</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>while</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-gt</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>0</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$autopilotDevices</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>@(</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>0</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$current</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>%</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$device</span><span style='color:#737373'>.</span><span style='color:#000000'>state</span><span style='color:#737373'>.</span><span style='color:#000000'>deviceImportStatus</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-eq</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;complete&quot;</span><span style='color:#000000'>)</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$device</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Get-AutopilotDevice</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-id</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$_</span><span style='color:#737373'>.</span><span style='color:#000000'>state</span><span style='color:#737373'>.</span><span style='color:#000000'>deviceRegistrationId</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#737373'>-not</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$device</span><span style='color:#000000'>)</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>+</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>1</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$autopilotDevices</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>+=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$device</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$deviceCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$autopilotDevices</span><span style='color:#737373'>.</span><span style='color:#000000'>Length</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Waiting for $processingCount of $deviceCount to be synced&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-gt</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>0</span><span style='color:#000000'>)</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Start-Sleep</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>30</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$syncDuration</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#0000FF'>Get-Date</span><span style='color:#000000'>)</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$syncStart</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$syncSeconds</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[Math]</span><span style='color:#737373'>::</span><span style='color:#000000'>Ceiling</span><span style='color:#000000'>(</span><span style='color:#D93900'>$syncDuration</span><span style='color:#737373'>.</span><span style='color:#000000'>TotalSeconds</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;All devices synced.  Elapsed time to complete sync: $syncSeconds seconds&quot;</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Add the device to the specified AAD group</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$AddToGroup</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$aadGroup</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Get-AzureADGroup</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Filter</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;DisplayName eq &#39;$AddToGroup&#39;&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$aadGroup</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$autopilotDevices</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>%</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$aadDevice</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Get-AzureADDevice</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-ObjectId</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;deviceid_$($_.azureActiveDirectoryDeviceId)&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$aadDevice</span><span style='color:#000000'>)</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Adding device $($_.serialNumber) to group $AddToGroup&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Add-AzureADGroupMember</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-ObjectId</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$aadGroup</span><span style='color:#737373'>.</span><span style='color:#000000'>ObjectId</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-RefObjectId</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$aadDevice</span><span style='color:#737373'>.</span><span style='color:#000000'>ObjectId</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>else</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Error</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Unable to find Azure AD device with ID $($_.azureActiveDirectoryDeviceId)&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Added devices to group &#39;$AddToGroup&#39; ($($aadGroup.ObjectId))&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>else</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Error</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Unable to find group $AddToGroup&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Assign the computer name </span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$AssignedComputerName</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-ne</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;&quot;</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$autopilotDevices</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>%</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Set-AutopilotDevice</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Id</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$_</span><span style='color:#737373'>.</span><span style='color:#000000'>Id</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-displayName</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$AssignedComputerName</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#006400'># Wait for assignment (if specified)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$Assign</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$assignStart</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Get-Date</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>1</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>while</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-gt</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>0</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>0</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$autopilotDevices</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>|</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>%</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$device</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#0000FF'>Get-AutopilotDevice</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-id</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$_</span><span style='color:#737373'>.</span><span style='color:#000000'>id</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Expand</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#737373'>-not</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$device</span><span style='color:#737373'>.</span><span style='color:#000000'>deploymentProfileAssignmentStatus</span><span style='color:#737373'>.</span><span style='color:#000000'>StartsWith</span><span style='color:#000000'>(</span><span style='color:#8B0000'>&quot;assigned&quot;</span><span style='color:#000000'>)</span><span style='color:#000000'>)</span><span style='color:#000000'>)</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>+</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>1</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$deviceCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$autopilotDevices</span><span style='color:#737373'>.</span><span style='color:#000000'>Length</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Waiting for $processingCount of $deviceCount to be assigned&quot;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$processingCount</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-gt</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>0</span><span style='color:#000000'>)</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Start-Sleep</span><span style='color:#000000'>&nbsp;</span><span style='color:#800080'>30</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$assignDuration</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#0000FF'>Get-Date</span><span style='color:#000000'>)</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>-</span><span style='color:#000000'>&nbsp;</span><span style='color:#D93900'>$assignStart</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#D93900'>$assignSeconds</span><span style='color:#000000'>&nbsp;</span><span style='color:#737373'>=</span><span style='color:#000000'>&nbsp;</span><span style='color:#008080'>[Math]</span><span style='color:#737373'>::</span><span style='color:#000000'>Ceiling</span><span style='color:#000000'>(</span><span style='color:#D93900'>$assignDuration</span><span style='color:#737373'>.</span><span style='color:#000000'>TotalSeconds</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Write-Host</span><span style='color:#000000'>&nbsp;</span><span style='color:#8B0000'>&quot;Profiles assigned to all devices.  Elapsed time to complete assignment: $assignSeconds seconds&quot;</span><span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#00008B'>if</span><span style='color:#000000'>&nbsp;</span><span style='color:#000000'>(</span><span style='color:#D93900'>$Reboot</span><span style='color:#000000'>)</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>{</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#0000FF'>Restart-Computer</span><span style='color:#000000'>&nbsp;</span><span style='color:#000080'>-Force</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color:#000000'>}</span><br />
<span style='color:#000000'>}</span><br />

                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
    </div>
    <footer class="footer">
    <div class="container footer-container" >
        <div class="row">
            <div class="hidden-xs footer-heading">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-offset-1 col-sm-1 footer-heading">
                <span><a href="/policies/Contact">Contact Us</a></span>
            </div>
            <div class="col-sm-1 footer-heading">
                <span><a href="/policies/Terms">Terms of Use</a></span>
            </div>
            <div class="col-sm-1 footer-heading">
                <span><a href="https://go.microsoft.com/fwlink/?LinkId=521839">Privacy Policy</a></span>
            </div>
            <div class="col-sm-1 footer-heading">
                <span><a href="https://aka.ms/psgallery-status/">Gallery Status</a></span>
            </div>
            <div class="col-sm-1 footer-heading">
                <span><a href="https://github.com/PowerShell/PowerShellGallery/issues">Feedback</a></span>
            </div>
            <div class="col-sm-1 footer-heading">
                <span><a href="https://aka.ms/PSGalleryPreviewFAQ">FAQs</a></span>
            </div>
            <div class="col-sm-4 footer-heading">
                <span class="footer-heading-last">&copy; 2024 Microsoft Corporation</span>
            </div>
        </div>  
    </div>
</footer>

    <script src="/Scripts/gallery/site.min.js?v=s-Nycwu4c-T9eVJC1tGlnrSh8SDtsEN_92Vs4B72tZk1"></script>

    
</body>
</html>
