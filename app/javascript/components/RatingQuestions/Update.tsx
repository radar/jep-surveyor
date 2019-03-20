import * as React from "react";
import Form from "./Form";

interface UpdateProps {
  form_url: string;
  id: string;
  url: string;
}

class Update extends React.Component<UpdateProps> {
  render() {
    return (
      <div>
        edit question
        <Form
          form_url={this.props.form_url}
          update={true}
          id={this.props.id}
          url={this.props.url}
        />
      </div>
    );
  }
}

export default Update;
