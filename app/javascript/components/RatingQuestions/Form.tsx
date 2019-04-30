import * as React from "react";
import * as styles from "./Form.module.scss";
import axios from "axios";

type UpdateFormProps = {
  update: true;
  id: string;
  title: string;
  changeQuestion(value: string): void;
};

type CreateFormProps = {
  update: false;
  addQuestion(data: string): void;
};

type FormProps = UpdateFormProps | CreateFormProps;

class Form extends React.Component<FormProps> {
  state = {
    title: "",
    value: ""
  };
  handleChange = event => {
    this.setState({ title: event.target.value });
  };

  addNew() {
    axios
      .post("http://localhost:3000/rating_questions.json", {
        title: this.state.title
      })
      .then(response =>
        (this.props as CreateFormProps).addQuestion(response.data)
      );
  }

  handleFormSubmit = event => {
    event.preventDefault();
    if (this.props.update) {
      this.props.changeQuestion(this.state.title);
    } else {
      this.addNew();
    }
  };

  render() {
    return (
      <div className={styles.formStyling}>
        <form onSubmit={this.handleFormSubmit}>
          <label>
            <span className={styles.formTitle}>Title:</span>
            <input
              type="text"
              defaultValue={this.state.value}
              onChange={this.handleChange}
            />
          </label>
          <input type="submit" value="Submit" />
        </form>
        <a className={styles.options} href="/">
          All
        </a>
      </div>
    );
  }
}

export default Form;
