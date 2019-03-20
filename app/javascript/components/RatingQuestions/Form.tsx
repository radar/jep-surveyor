import * as React from "react";

interface FormProps {
  form_url: string;
  update: boolean;
}

class Form extends React.Component<FormProps> {
  renderMethod() {
    if (this.props.update === true) {
      return <input type="hidden" name="_method" value="put" />;
    }
  }

  render() {
    return (
      <div>
        <form action={this.props.form_url} method="post">
          {this.renderMethod()}
          <label>
            Title:
            <input type="text" name="rating_question[title]" />
          </label>
          <input type="submit" value="Submit" />
        </form>
      </div>
    );
  }
}

export default Form;
