import React from 'react'
import axios from 'axios'

interface AddRatingQuestionProps{
    rating_question_url: string
    addQuestion: Function
}

class AddRatingQuestion extends React.Component<AddRatingQuestionProps> {
    state = {
        title: '',
    }

    handleChange = (event: React.FormEvent) => {
        const target = event.target as HTMLInputElement;
        this.setState({
            [target.name]: target.value
        })
    }

    createQuestion = (event) => {
        event.preventDefault();
        // console.log(this.state.title);
        // alert(`Your question titled: ${this.state.title} have been added`)

        let url = this.props.rating_question_url
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
                <form className="add-question" onSubmit={this.createQuestion}>
                {/* action = "/rating_questions" */}
                {/* method = "post" */}
                <label>
                    Question:
                    <input name="title" type="text" placeholder="Question" onChange={this.handleChange}/>
                </label>
                    <button type="Submit">Add a question</button>
                </form>
            </div>
        );
    }
}

export default AddRatingQuestion;