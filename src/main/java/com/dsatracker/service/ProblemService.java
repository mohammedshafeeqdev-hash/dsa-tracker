package com.dsatracker.service;

import com.dsatracker.entity.Problem;
import com.dsatracker.entity.Status;
import com.dsatracker.repository.ProblemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProblemService {

    @Autowired
    private ProblemRepository problemRepository;

    public List<Problem> getAllProblems() {
        return problemRepository.findAll();
    }

    public Optional<Problem> getProblemById(Long id) {
        return problemRepository.findById(id);
    }

    public Problem createProblem(Problem problem) {
        return problemRepository.save(problem);
    }

    public Problem updateProblem(Long id, Problem problemDetails) {
        Optional<Problem> optionalProblem = problemRepository.findById(id);
        if (optionalProblem.isPresent()) {
            Problem problem = optionalProblem.get();
            problem.setTitle(problemDetails.getTitle());
            problem.setTopic(problemDetails.getTopic());
            problem.setDifficulty(problemDetails.getDifficulty());
            problem.setDescription(problemDetails.getDescription());
            problem.setLink(problemDetails.getLink());
            problem.setStatus(problemDetails.getStatus());
            problem.setCode(problemDetails.getCode());
            problem.setNotes(problemDetails.getNotes());
            problem.setMistakes(problemDetails.getMistakes());
            return problemRepository.save(problem);
        }
        return null;
    }

    public boolean deleteProblem(Long id) {
        if (problemRepository.existsById(id)) {
            problemRepository.deleteById(id);
            return true;
        }
        return false;
    }

    public Problem updateStatus(Long id, Status status) {
        Optional<Problem> optionalProblem = problemRepository.findById(id);
        if (optionalProblem.isPresent()) {
            Problem problem = optionalProblem.get();
            problem.setStatus(status);
            return problemRepository.save(problem);
        }
        return null;
    }
}