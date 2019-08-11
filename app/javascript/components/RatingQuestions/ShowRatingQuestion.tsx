import * as React from 'react'
import * as styles from './ShowRatingQuestion.module.scss'
import Form from './Form'

interface Question {
    title: string,
    id: string,
    url: string
}

interface ShowRatingQuestionProps {
    question: Question
}

interface ShowRatingQuestionState {
    question: Question
}

class ShowRatingQuestion extends React.Component<ShowRatingQuestionProps, ShowRatingQuestionState> {
    state = {
        question: this.props.question
    }

    updateQuestion = (question) => {
        console.log(question)
        this.setState({
            question: question
        })
    }

    deleteQuestion = (question) => {
        console.log(question)
        this.setState({
            question: question
        })
    }
    render() {
        return(
            <div className={styles.ratingQuestion} data-automation-id='question'>
                {this.state.question.title}
                <Form rating_question_url='' url={this.props.question.url} updateQuestion={this.updateQuestion} update={true}/>
            </div>
        )
    }
}

export default ShowRatingQuestion