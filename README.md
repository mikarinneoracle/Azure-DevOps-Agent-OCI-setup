
### Resource Manager Terraform Stack to create self-hosted Azure DevOps Agent on OCI

Benefits of using a self-hosted agent (besides using standard Azure DevOps pipeline tasks and oci scripting):
<ul>
    <li>Allows running <code>oci cli</code> scripting as <code>instance principal</code> that enables authentication and authorization via OCI <code>policies</code> without storing credentials on Azure DevOps side</li>
    <li>Enables caching e.g. container images caching for fast builds</li>
</ul>

Deploy Azure Devops Agent creation stack to OCI Resource Manager (Terraform) using the button below.
<p>
Stack then allows to configure the agent parameters for the Agent and VM creation:
<ul>
    <li>Agent and VM name</li>
    <li>Azure DevOps organization url</li>
    <li>Azure DevOps PAT</li>
    <li>Agent pool name (default is 'Default')</li>
    <li>VM shape (OCPUs, memory and boot volume disk size)</li>
</ul>
<p>

[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/mikarinneoracle/Azure-DevOps-Agent-OCI-setup/releases/download/latest/azure-agent-stack.zip)

<p>
<br>
You can delete the created resources at any time using stack <code>destroy</code> and re-create them again using the stack <code>apply</code>. Before re-creating it is advisable to remove the exisiting agent from the Azure DevOps agent pool. Multiple
agents can be set up by changing the default name <code>AzureDevOpsagent</code> of individual agents to something unique.
<p>
Terraform provider <code>oracle/oci</code> is installed so the created agent can be also used for Terraform pipelines including https://marketplace.visualstudio.com/items?itemName=ms-devlabs.custom-terraform-tasks 
<p>

Terraform takes a moment to complete and eventually the build agent should appear in Azure DevOps agent pool.
<p>
<img src="azure-devops-agent.jpg" width="1200" />
<p>

VM boot volume size is 200M by default that can be adjusted per build needs during the Terraform stack creation.
<p>
<img src="azure-devops-agent-vm.jpg" width="1200" />
<br>
<br>
A bigger VM shape performs better. The defaults are 1 OCPU and 8GB memory that can be also adjusted during the Terraform stack creation.
<p>
