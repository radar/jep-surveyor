import * as React from "react";
import axios from "axios";
import * as styles from "./Form.module.scss";

interface FormProps {
  form_url: string;
  update: boolean;
  id: string;
  url: string;
  updateTitle?: Function;
  addQuestion?: Function;
}

class Form extends React.Component<FormProps> {
  state = {
    title: ""
  };

  handleChange = (e: React.FormEvent) => {
    this.setState({
      title: (e.target as HTMLInputElement).value
    });
  };

  handleSubmit = (e: React.FormEvent) => {
    const { title } = this.state;
    e.preventDefault();
    let url = this.props.url;

    if (this.props.update === true) {
      axios
        .patch(`${url}.json`, { rating_question: { title: this.state.title } })
        .then(result => {
          this.props.updateTitle(result.data.title);
        });
    } else {
      axios.post("/rating_questions.json", { title }).then(result => {
        this.props.addQuestion(result.data);
      });
    }
  };

  renderMethod() {
    if (this.props.update === true) {
      return <input type="hidden" name="_method" value="patch" />;
    }
  }

  render() {
    return (
      <div>
        <form className={styles.form} onSubmit={this.handleSubmit}>
          {this.renderMethod()}
          <label>
            Title:
            <input
              type="text"
              defaultValue={this.state.title}
              onChange={this.handleChange}
            />
          </label>
          <input type="submit" value="Submit" />
        </form>
      </div>
    );
  }
}

export default Form;
