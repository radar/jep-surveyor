import * as React from "react";
import Form from "./Form";
import * as styles from "./Form.module.scss";

interface CreateProps {
  form_url: string;
  update: boolean;
  id: string;
  url: string;
  addQuestion: Function;
}

class Create extends React.Component<CreateProps> {
  render() {
    return (
      <div>
        <p className={styles.title}>Create a New Question:</p>
        <Form
          form_url={this.props.form_url}
          update={false}
          id={this.props.id}
          url={this.props.url}
          addQuestion={this.props.addQuestion}
        />
      </div>
    );
  }
}

export default Create;
