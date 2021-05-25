function Set-PushoverApiUri {
    <#
    .SYNOPSIS
        Sets the base API URI for all Pushover API requests.
    .DESCRIPTION
        This function is primarily intended for helping with pester tests. It will enable us to
        mock the Pushover API locally to verify our messages are constructed and sent in the
        proper format.

        The API URI is automatically reset to default when the module is imported.
    .EXAMPLE
        PS C:\> Set-PushoverApiUri -Uri http://localhost:8888/
        Sets the Pushover API URI to localhost where presumbaly you would run a small web service
        to receive and parse the HTTP requests generated by the module.
    .EXAMPLE
        PS C:\> Set-PushoverApiUri -Default
        Reset the Pushover API URI to the default value
    #>
    [CmdletBinding(DefaultParameterSetName = 'Set')]
    param (
        # Specifies the base URI for Pushover API requests
        [Parameter(Mandatory, ParameterSetName = 'Set', Position = 1)]
        [uri]
        $Uri,

        # Reset the Pushover URI to default
        [Parameter(Mandatory, ParameterSetName = 'Reset')]
        [switch]
        $Default
    )

    process {
        if ($Default) {
            $script:PushoverApiUri = $script:PushoverApiDefaultUri
        }
        else {
            $script:PushoverApiUri = $Uri.ToString()
        }
    }
}