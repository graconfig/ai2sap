let cachedResources: any;

export async function getAIResources() {
  if (!cachedResources) {
    const aiAPI = await import("@sap-ai-sdk/ai-api");

    const { resources } = await aiAPI.DeploymentApi.deploymentQuery(
      {
        status: "RUNNING",
        executableIds: ["azure-openai", "aws-bedrock","gcp-vertexai"],
        scenarioId: "foundation-models",
      },
      { "AI-Resource-Group": "default" }
    ).execute({ destinationName: "AICore" });

    cachedResources = resources;
  }
  return cachedResources;
}
