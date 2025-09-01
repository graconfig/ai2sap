import { getAIResources } from "./AIRources";
import { Sender } from "./entities";

export const AIRuequestHandler = async function (
  model: string,
  messages: any,
  func_json?: any
) {
  const resources = await getAIResources();

  if (!model) model = "anthropic--claude-3.7-sonnet";

  const resource = resources.find(
    (deployment: any) =>
      deployment.details?.resources?.backendDetails?.model?.name === model
  );
  if (!resource) {
    throw new Error(`Model ${model} not found in resources`);
  }

  const modelId = resource.id;

  if (model.includes("gpt")) {
    const tools: any = func_json
      ? [
          {
            type: "function",
            function: {
              name: func_json.name,
              description: func_json.description,
              parameters: func_json.parameters || func_json.input_schema,
            },
          },
        ]
      : undefined;

    const foundationModels = await import("@sap-ai-sdk/foundation-models");
    const response = await new foundationModels.AzureOpenAiChatClient(
      { deploymentId: modelId },
      {
        destinationName: "AICore",
      }
    ).run({
      messages,
      tool_choice: func_json ? "required" : undefined,
      tools: tools,
    });

    if (response.getFinishReason() == "tool_calls") {
      return {
        reason: Sender.Tool,
        content: response.data.choices[0].message?.tool_calls?.map(
          (call: any) => JSON.parse(call.function.arguments)
        ),
        tokens: response.data.usage?.total_tokens,
      };
    } else {
      return {
        reason: Sender.Assistant,
        content: response.getContent(),
        tokens: response.data.usage?.total_tokens,
      };
    }
  } else if (model.includes("claude")) {
    const system_message = messages.find((r: any) => r.role === Sender.System);

    let system_prompt;
    if (system_message) system_prompt = [{ text: system_message?.content }];

    const chat_messages = messages.filter((r: any) => r.role !== Sender.System);

    messages = chat_messages.map((r: any) => ({
      role: r.role,
      content: [{ text: r.content?.trim().replace(/\n/g, " ") }],
    }));

    const toolConfig: any = func_json
      ? {
          tools: [
            {
              toolSpec: {
                name: func_json.name,
                description: func_json.description,
                inputSchema: {
                  json:
                    func_json.parameters ||
                    func_json.input_schema ||
                    func_json.inputSchema.json,
                },
              },
            },
          ],
        }
      : undefined;

    const foundationModels = await import("@sap-ai-sdk/foundation-models");
    const response = await new foundationModels.AzureOpenAiChatClient(
      { deploymentId: modelId },
      {
        destinationName: "AICore",
      }
    ).run(
      {
        system: system_prompt,
        messages,
        toolConfig: toolConfig,
      },
      {
        path: "converse",
      }
    );

    if (response.data.stopReason === "tool_use") {
      let tool_calls: any = [];
      response.data.output.message.content.map((c: any) => {
        if (c.toolUse) tool_calls.push(c.toolUse.input);
      });

      return {
        reason: Sender.Tool,
        content: tool_calls,
        tokens: response.data.usage?.totalTokens,
      };
    } else {
      return {
        reason: Sender.Assistant,
        content: response.data.output.message.content[0].text,
        tokens: response.data.usage?.totalTokens,
      };
    }
  } else if (model.includes("gemini")) {
    // const system_message = messages.find((r: any) => r.role === Sender.System);

    // let systemInstruction;
    // if (system_message)
    //   systemInstruction = { parts: [{ text: system_message.content }] };

    // const chat_messages = messages.filter((r: any) => r.role !== Sender.System);

    // // const contents = chat_messages.map((r: any) => ({
    // //   role: r.role,
    // //   parts: [{ text: r.content?.trim().replace(/\n/g, " ") }],
    // // }));
    // const contents = chat_messages.map((r: any) => ({
    //   role: r.role,
    //   parts: [{ text: r.content?.trim().replace(/\n/g, " ") }],
    // }));
    // const tools: any = func_json
    //   ? [
    //       {
    //         function_declarations: [
    //           {
    //             name: func_json.name,
    //             description: func_json.description,
    //             parameters:
    //               func_json.parameters ||
    //               func_json.input_schema ||
    //               func_json.inputSchema.json,
    //           },
    //         ],
    //       },
    //     ]
    //   : undefined;

    // const foundationModels = await import("@sap-ai-sdk/foundation-models");
    // const response = await new foundationModels.AzureOpenAiChatClient(
    //   { deploymentId: modelId },
    //   {
    //     destinationName: "AICore",
    //   }
    // ).run(
    //   {
    //     systemInstruction,
    //     contents,
    //     tools: tools,
    //   },
    //   {
    //     path: "models/" + model + ":generateContent",
    //   }
    // );

    // let tool_calls: any = [];
    // response.data.candidates[0].content.parts.map((c: any) => {
    //   if (c.functionCall) tool_calls.push(c.functionCall.args);
    // });

    // if (tool_calls.length > 0) {
    //   return {
    //     reason: Sender.Tool,
    //     content: tool_calls,
    //     tokens: response.data.usageMetadata?.totalTokenCount,
    //   };
    // } else {
    //   return {
    //     reason: Sender.Assistant,
    //     content: response.data.candidates[0].content.parts[0].text,
    //     tokens: response.data.usageMetadata?.totalTokenCount,
    //   };
    // }
  }
};
