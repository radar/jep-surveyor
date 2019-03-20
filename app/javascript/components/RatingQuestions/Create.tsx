import * as React from "react";
import Form from "./Form";

interface CreateProps {
  form_url: string;
  update: boolean;
  id: string;
  url: string;
}

class Create extends React.Component<CreateProps> {
  render() {
    return (
      <div>
        <p>Create a New Question:</p>
        <Form
          form_url={this.props.form_url}
          update={false}
          id={this.props.id}
          url={this.props.url}
        />
      </div>
    );
  }
}

export default Create;
