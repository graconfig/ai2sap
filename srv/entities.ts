export enum Sender {
  AI = "AI",
  HUMAN = "Human",
  System = "system",
  Assistant = "assistant",
  User = "user",
  Tool = "tool",
}

export type Message = 
  {
    role: string;
    content: string;
  }
;
