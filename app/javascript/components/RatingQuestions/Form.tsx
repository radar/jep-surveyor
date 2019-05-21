import React from 'react'
import axios from 'axios'

interface FormProps{
    url: string
    addQuestion?: Function
    update: boolean
    updateQuestion?: Function
    rating_question_url: string
}

class Form extends React.Component<FormProps> {
    state = {
        title: '',
    }

    handleChange = (event: React.FormEvent) => {
        const target = event.target as HTMLInputElement;
        this.setState({
            [target.name]: target.value
        })
    }

    submit = (event) => {
        event.preventDefault();
        if (this.props.update) {
            this.updateQuestion()
        }
        else {
            this.createQuestion()
        }
    }

    updateQuestion = () => {
        let url = this.props.url
        let title = this.state.title
        axios.patch(url, { title })
        .then((result) => {
            console.log(result.data)
            this.props.updateQuestion(result.data)
            // this.props.questions = result.question
        })
    }

    createQuestion = () => {
        // console.log(this.state.title);
        // alert(`Your question titled: ${this.state.title} have been added`)

        let url = this.props.url
        let title = this.state.title
        axios.post(url, { title })
        .then((result) => {
            console.log(result.data)
            this.props.addQuestion(result.data)
            // this.props.questions = result.question
        })
    }

    render() {        
        return(
            <div>
                <form className="add-question" onSubmit={this.submit}>
                <label>
                    Question:
                    <input name="title" type="text" placeholder="Question" onChange={this.handleChange}/>
                </label>
                    <button type="submit">Add a question</button>
                </form>
            </div>
        );
    }
}

export default Form;