
### Resource Manager Terraform Stack to create Azure DevOps Agent on OCI

Deploy Azure Devops Agent creation stack to OCI Resource Manager (Terraform) using the button below.
<p>
Stack then allows to configure the agent parameters for the Agent and VM creation:
<ul>
    <li>Azure DevOps organization url</li>
    <li>Azure DevOps PAT</li>
    <li>Agent pool name (default is 'Default'</li>
    <li>VM shape (ocpus and memory)</li>
</ul>
<p>
You can delete the created resources any time using stack destroy and re-create them again using the stack apply.

[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/mikarinneoracle/Azure-DevOps-Agent-OCI-setup/releases/download/latest/azure-agent-stack.zip)
