import * as React from "react";
import axios from "axios";

interface FormProps {
  form_url: string;
  update: boolean;
  id: string;
  url: string;
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
      console.log("HELLO THERE IM EDIT");
      console.log(this.props.url);
      axios
        .patch(`${url}.json`, { rating_question: { title: this.state.title } })
        .then(result => {
          // NEED TO RENDER UPDATED QUESTION
          console.log("im in patch");
        });
    } else {
      axios.post("/rating_questions", { title }).then(result => {
        // NEED TO RENDER NEWLY ADDED QUESTION
        console.log(result.data);
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
        <form onSubmit={this.handleSubmit}>
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
